import 'dart:io';

import 'package:apparence_kit/core/data/api/analytics_api.dart';
import 'package:apparence_kit/modules/gps/services/gps_tracking_service.dart';
import 'package:apparence_kit/modules/notifications/api/local_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gps_tracking_notifier.g.dart';

/// Riverpod notifier that wraps the GPS tracking service.
///
/// This notifier provides:
/// - Reactive state for UI components
/// - Clean API for starting/stopping GPS tracking
/// - Integration point for the round lifecycle
@Riverpod(keepAlive: true)
class GpsTrackingNotifier extends _$GpsTrackingNotifier {
  GpsTrackingService get _service => ref.read(gpsTrackingServiceProvider);

  @override
  GpsTrackingStatus build() {
    // Set up callback to update state when service status changes
    _service.onStatusChanged = (status) {
      state = status;
    };
    return _service.status;
  }

  /// Check current location permission status
  Future<LocationPermissionResult> checkPermission() {
    return _service.checkPermission();
  }

  /// Request location permission for GPS tracking
  Future<LocationPermissionResult> requestPermission() {
    return _service.requestPermission();
  }

  /// Check if background location permission is granted
  Future<bool> hasBackgroundPermission() {
    return _service.hasBackgroundPermission();
  }

  /// Request background location permission
  Future<bool> requestBackgroundPermission() {
    return _service.requestBackgroundPermission();
  }

  /// Start GPS tracking
  ///
  /// On Android 14+, this will request notification permission first
  /// to ensure the foreground service notification can be displayed.
  Future<void> startTracking() async {
    // On Android, request notification permission for foreground service notification
    if (Platform.isAndroid) {
      final granted = await ref.read(notificationsSettingsProvider).askPermission();
      final analytics = ref.read(analyticsApiProvider);
      if (granted) {
        analytics.logEvent('permission_granted', {
          'permission_type': 'notification',
          'context': 'gps_tracking',
        });
      } else {
        analytics.logEvent('permission_denied', {
          'permission_type': 'notification',
          'context': 'gps_tracking',
        });
      }
    }
    await _service.start();
  }

  /// Stop GPS tracking
  Future<void> stopTracking() async {
    await _service.stop();
  }

  /// Pause GPS tracking (keeps subscription but stops timer)
  void pauseTracking() {
    _service.pause();
  }

  /// Resume GPS tracking after pause
  void resumeTracking() {
    _service.resume();
  }

  /// Check if currently tracking
  bool get isTracking => state == GpsTrackingStatus.tracking;

  /// Check if tracking is stopped
  bool get isStopped => state == GpsTrackingStatus.stopped;

  /// Check if there was an error
  bool get hasError => state == GpsTrackingStatus.error;
}
