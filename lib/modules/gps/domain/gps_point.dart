import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';

part 'gps_point.freezed.dart';

/// Domain model for GPS point data
@freezed
sealed class GpsPoint with _$GpsPoint {
  const factory GpsPoint({
    required double latitude,
    required double longitude,
    double? accuracy,
    double? altitude,
    double? speed,
    double? heading,
    required DateTime recordedAt,
  }) = GpsPointData;

  const GpsPoint._();

  /// Create a GpsPoint from a geolocator Position
  factory GpsPoint.fromPosition(Position position) {
    return GpsPoint(
      latitude: position.latitude,
      longitude: position.longitude,
      accuracy: position.accuracy,
      altitude: position.altitude,
      speed: position.speed,
      heading: position.heading,
      recordedAt: position.timestamp,
    );
  }
}
