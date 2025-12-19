import 'dart:async';
import 'dart:io';

import 'package:apparence_kit/modules/gps/domain/gps_point.dart';
import 'package:apparence_kit/modules/gps/repositories/gps_tracking_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';

final _logger = Logger(printer: PrettyPrinter(methodCount: 0));

/// Interval between GPS tracking calls
const Duration kTrackingInterval = Duration(seconds: 10);

/// Maximum points to buffer when offline
const int kMaxBufferSize = 100;

final gpsTrackingServiceProvider = Provider<GpsTrackingService>((ref) {
  return GpsTrackingService(
    repository: ref.read(gpsTrackingRepositoryProvider),
  );
});

/// Status of the GPS tracking service
enum GpsTrackingStatus {
  stopped,
  starting,
  tracking,
  paused,
  error,
}

/// Service that manages GPS tracking during active rounds.
///
/// This service:
/// - Listens to position updates via geolocator
/// - Sends position to backend every [kTrackingInterval] seconds
/// - Buffers failed requests for retry
/// - Supports background tracking on Android and iOS
class GpsTrackingService {
  final GpsTrackingRepository _repository;

  StreamSubscription<Position>? _positionSubscription;
  Timer? _trackingTimer;
  Position? _lastPosition;

  GpsTrackingStatus _status = GpsTrackingStatus.stopped;
  GpsTrackingStatus get status => _status;

  /// Buffer for failed requests (retry when connection restores)
  final List<GpsPoint> _retryBuffer = [];

  /// Callback for status changes
  void Function(GpsTrackingStatus)? onStatusChanged;

  GpsTrackingService({required GpsTrackingRepository repository})
      : _repository = repository;

  /// Check if background location permission is granted
  Future<bool> hasBackgroundPermission() async {
    final status = await Permission.locationAlways.status;
    return status.isGranted;
  }

  /// Request background location permission
  Future<bool> requestBackgroundPermission() async {
    // First ensure we have "when in use" permission
    final whenInUse = await Permission.locationWhenInUse.request();
    if (!whenInUse.isGranted) {
      _logger.w('Location "when in use" permission denied');
      return false;
    }

    // Then request "always" permission for background
    final always = await Permission.locationAlways.request();
    if (!always.isGranted) {
      _logger.w('Background location permission denied');
      return false;
    }

    return true;
  }

  /// Start GPS tracking
  Future<void> start() async {
    if (_status == GpsTrackingStatus.tracking) {
      _logger.w('GPS tracking already active');
      return;
    }

    _logger.i('Starting GPS tracking service');
    _setStatus(GpsTrackingStatus.starting);

    try {
      // Check if location services are enabled
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        _logger.e('Location services are disabled');
        _setStatus(GpsTrackingStatus.error);
        return;
      }

      // Check location permission
      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          _logger.e('Location permission denied');
          _setStatus(GpsTrackingStatus.error);
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        _logger.e('Location permission permanently denied');
        _setStatus(GpsTrackingStatus.error);
        return;
      }

      // Configure location settings based on platform
      final locationSettings = _createLocationSettings();

      // Start position stream
      _positionSubscription = Geolocator.getPositionStream(
        locationSettings: locationSettings,
      ).listen(
        _onPositionUpdate,
        onError: _onPositionError,
      );

      // Start timer for regular interval tracking
      _trackingTimer = Timer.periodic(kTrackingInterval, (_) {
        _sendCurrentPosition();
      });

      _setStatus(GpsTrackingStatus.tracking);
      _logger.i('GPS tracking started successfully');
    } catch (e, stackTrace) {
      _logger.e('Failed to start GPS tracking', error: e, stackTrace: stackTrace);
      _setStatus(GpsTrackingStatus.error);
    }
  }

  /// Create platform-specific location settings
  LocationSettings _createLocationSettings() {
    if (Platform.isAndroid) {
      return AndroidSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 0, // Get all updates
        forceLocationManager: false,
        intervalDuration: kTrackingInterval,
        foregroundNotificationConfig: const ForegroundNotificationConfig(
          notificationText: 'TalkCaddy esta rastreando tu recorrido',
          notificationTitle: 'Ronda en progreso',
          enableWakeLock: true,
          notificationIcon: AndroidResource(
            name: 'ic_launcher',
            defType: 'mipmap',
          ),
        ),
      );
    } else if (Platform.isIOS) {
      return AppleSettings(
        accuracy: LocationAccuracy.high,
        activityType: ActivityType.fitness,
        distanceFilter: 0,
        pauseLocationUpdatesAutomatically: false,
        showBackgroundLocationIndicator: true,
      );
    } else {
      return const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 0,
      );
    }
  }

  /// Stop GPS tracking
  Future<void> stop() async {
    _logger.i('Stopping GPS tracking service');

    await _positionSubscription?.cancel();
    _positionSubscription = null;

    _trackingTimer?.cancel();
    _trackingTimer = null;

    _lastPosition = null;

    // Try to flush retry buffer before stopping
    await _flushRetryBuffer();

    _setStatus(GpsTrackingStatus.stopped);
    _logger.i('GPS tracking stopped');
  }

  /// Pause tracking (e.g., when app lifecycle changes)
  void pause() {
    if (_status != GpsTrackingStatus.tracking) return;
    _trackingTimer?.cancel();
    _setStatus(GpsTrackingStatus.paused);
    _logger.i('GPS tracking paused');
  }

  /// Resume tracking after pause
  void resume() {
    if (_status != GpsTrackingStatus.paused) return;
    _trackingTimer = Timer.periodic(kTrackingInterval, (_) {
      _sendCurrentPosition();
    });
    _setStatus(GpsTrackingStatus.tracking);
    _logger.i('GPS tracking resumed');
  }

  void _onPositionUpdate(Position position) {
    _lastPosition = position;
    _logger.d('Position updated: ${position.latitude}, ${position.longitude}');
  }

  void _onPositionError(Object error) {
    _logger.e('Position stream error: $error');
    _setStatus(GpsTrackingStatus.error);
  }

  Future<void> _sendCurrentPosition() async {
    if (_lastPosition == null) {
      _logger.d('No position available to send');
      return;
    }

    final point = GpsPoint.fromPosition(_lastPosition!);

    try {
      // First try to flush any buffered points
      await _flushRetryBuffer();

      // Then send current point
      await _repository.trackPoint(point);
      _logger.d('GPS point sent successfully');
    } catch (e) {
      _logger.w('Failed to send GPS point, buffering for retry');
      _addToRetryBuffer(point);
    }
  }

  void _addToRetryBuffer(GpsPoint point) {
    if (_retryBuffer.length >= kMaxBufferSize) {
      // Remove oldest point to make room
      _retryBuffer.removeAt(0);
    }
    _retryBuffer.add(point);
  }

  Future<void> _flushRetryBuffer() async {
    if (_retryBuffer.isEmpty) return;

    try {
      _logger.i('Flushing ${_retryBuffer.length} buffered GPS points');
      await _repository.trackPoints(List.from(_retryBuffer));
      _retryBuffer.clear();
      _logger.i('Retry buffer flushed successfully');
    } catch (e) {
      _logger.w('Failed to flush retry buffer: $e');
      // Keep buffer for next attempt
    }
  }

  void _setStatus(GpsTrackingStatus newStatus) {
    _status = newStatus;
    onStatusChanged?.call(newStatus);
  }
}
