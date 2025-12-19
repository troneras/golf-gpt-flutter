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
    @JsonKey(name: 'distance_walked') double? distanceWalked,
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
    required int total,
    @Default(20) int limit,
    @Default(0) int offset,
  }) = RoundsListResponseData;

  const RoundsListResponse._();

  factory RoundsListResponse.fromJson(Map<String, Object?> json) =>
      _$RoundsListResponseFromJson(json);
}
