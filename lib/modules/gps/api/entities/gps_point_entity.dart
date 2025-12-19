// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'gps_point_entity.freezed.dart';
part 'gps_point_entity.g.dart';

/// Entity for GPS point data sent to POST /api/gps/track
@freezed
sealed class GpsPointEntity with _$GpsPointEntity {
  const factory GpsPointEntity({
    required double latitude,
    required double longitude,
    double? accuracy,
    double? altitude,
    double? speed,
    double? heading,
    @JsonKey(name: 'recorded_at') String? recordedAt,
  }) = GpsPointEntityData;

  const GpsPointEntity._();

  factory GpsPointEntity.fromJson(Map<String, Object?> json) =>
      _$GpsPointEntityFromJson(json);
}

/// Response from POST /api/gps/track
@freezed
sealed class GpsTrackResponse with _$GpsTrackResponse {
  const factory GpsTrackResponse({
    required bool ok,
    String? id,
  }) = GpsTrackResponseData;

  const GpsTrackResponse._();

  factory GpsTrackResponse.fromJson(Map<String, Object?> json) =>
      _$GpsTrackResponseFromJson(json);
}
