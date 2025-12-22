// ignore_for_file: invalid_annotation_target

import 'package:apparence_kit/modules/round/api/entities/course_entity.dart';
import 'package:apparence_kit/modules/round/api/entities/hole_score_entity.dart';
import 'package:apparence_kit/modules/round/api/entities/tee_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'round_entity.freezed.dart';
part 'round_entity.g.dart';

@freezed
sealed class RoundEntity with _$RoundEntity {
  const factory RoundEntity({
    required String id,
    @JsonKey(name: 'course_id') String? courseId,
    @JsonKey(name: 'tee_id') String? teeId,
    required String status,
    @JsonKey(name: 'start_time') required String startTime,
    @JsonKey(name: 'end_time') String? endTime,
    @JsonKey(name: 'duration_minutes') int? durationMinutes,
    @JsonKey(name: 'total_strokes') int? totalStrokes,
    @JsonKey(name: 'total_putts') int? totalPutts,
    @JsonKey(name: 'total_penalties') int? totalPenalties,
    @JsonKey(name: 'score_relative_to_par') int? scoreRelativeToPar,
    @JsonKey(name: 'distance_walked', fromJson: _parseDoubleOrString) double? distanceWalked,
    @JsonKey(name: 'fairways_hit') int? fairwaysHit,
    @JsonKey(name: 'fairways_total') int? fairwaysTotal,
    @JsonKey(name: 'greens_in_regulation') int? greensInRegulation,
    @JsonKey(name: 'greens_total') int? greensTotal,
    @JsonKey(name: 'weather_conditions') String? weatherConditions,
    @JsonKey(name: 'chatgpt_enabled') @Default(false) bool chatgptEnabled,
    @JsonKey(name: 'gps_enabled') @Default(true) bool gpsEnabled,
    String? notes,
    CourseEntity? course,
    TeeEntity? tee,
    @Default([]) List<HoleScoreEntity> scores,
  }) = RoundEntityData;

  const RoundEntity._();

  factory RoundEntity.fromJson(Map<String, Object?> json) =>
      _$RoundEntityFromJson(json);
}

/// Response wrapper for round endpoints
@freezed
sealed class RoundResponse with _$RoundResponse {
  const factory RoundResponse({
    required RoundEntity round,
  }) = RoundResponseData;

  const RoundResponse._();

  factory RoundResponse.fromJson(Map<String, Object?> json) =>
      _$RoundResponseFromJson(json);
}

/// Response wrapper for rounds list
@freezed
sealed class RoundsListResponse with _$RoundsListResponse {
  const factory RoundsListResponse({
    required List<RoundEntity> rounds,
    @JsonKey(fromJson: _parseIntOrString) @Default(0) int total,
    @JsonKey(fromJson: _parseIntOrStringWithDefault20) @Default(20) int limit,
    @JsonKey(fromJson: _parseIntOrString) @Default(0) int offset,
  }) = RoundsListResponseData;

  const RoundsListResponse._();

  factory RoundsListResponse.fromJson(Map<String, Object?> json) =>
      _$RoundsListResponseFromJson(json);
}

/// Parse int from either int or string, defaulting to 0
int _parseIntOrString(dynamic value) {
  if (value == null) return 0;
  if (value is int) return value;
  if (value is String) return int.tryParse(value) ?? 0;
  if (value is num) return value.toInt();
  return 0;
}

/// Parse int from either int or string, defaulting to 20
int _parseIntOrStringWithDefault20(dynamic value) {
  if (value == null) return 20;
  if (value is int) return value;
  if (value is String) return int.tryParse(value) ?? 20;
  if (value is num) return value.toInt();
  return 20;
}

/// Parse double from either num or string
double? _parseDoubleOrString(dynamic value) {
  if (value == null) return null;
  if (value is double) return value;
  if (value is int) return value.toDouble();
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value);
  return null;
}
