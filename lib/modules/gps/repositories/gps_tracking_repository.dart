import 'package:apparence_kit/modules/gps/api/entities/gps_point_entity.dart';
import 'package:apparence_kit/modules/gps/api/gps_tracking_api.dart';
import 'package:apparence_kit/modules/gps/domain/gps_point.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final gpsTrackingRepositoryProvider = Provider<GpsTrackingRepository>(
  (ref) => GpsTrackingRepository(
    api: ref.read(gpsTrackingApiProvider),
  ),
);

class GpsTrackingRepository {
  final GpsTrackingApi _api;

  GpsTrackingRepository({required GpsTrackingApi api}) : _api = api;

  /// Track a single GPS point
  Future<void> trackPoint(GpsPoint point) async {
    final entity = _toEntity(point);
    await _api.trackPoint(entity);
  }

  /// Track multiple GPS points (for retry buffer flush)
  Future<void> trackPoints(List<GpsPoint> points) async {
    final entities = points.map(_toEntity).toList();
    await _api.trackPoints(entities);
  }

  GpsPointEntity _toEntity(GpsPoint point) {
    return GpsPointEntity(
      latitude: point.latitude,
      longitude: point.longitude,
      accuracy: point.accuracy,
      altitude: point.altitude,
      speed: point.speed,
      heading: point.heading,
      recordedAt: point.recordedAt.toUtc().toIso8601String(),
    );
  }
}
