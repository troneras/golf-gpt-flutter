// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'score_upsert_response.freezed.dart';
part 'score_upsert_response.g.dart';

/// Response from POST /v1/scores/upsert
@freezed
sealed class ScoreUpsertResponse with _$ScoreUpsertResponse {
  const factory ScoreUpsertResponse({
    required bool ok,
    String? id,
    ScoreUpsertData? score,
    RunningScoreEntity? running,
    NextActionsEntity? next,
  }) = ScoreUpsertResponseData;

  const ScoreUpsertResponse._();

  factory ScoreUpsertResponse.fromJson(Map<String, Object?> json) =>
      _$ScoreUpsertResponseFromJson(json);
}

@freezed
sealed class ScoreUpsertData with _$ScoreUpsertData {
  const factory ScoreUpsertData({
    required int hole,
    int? strokes,
    int? putts,
    @JsonKey(name: 'scoreName') String? scoreName,
  }) = ScoreUpsertDataData;

  const ScoreUpsertData._();

  factory ScoreUpsertData.fromJson(Map<String, Object?> json) =>
      _$ScoreUpsertDataFromJson(json);
}

@freezed
sealed class RunningScoreEntity with _$RunningScoreEntity {
  const factory RunningScoreEntity({
    @JsonKey(name: 'totalStrokes') int? totalStrokes,
    @JsonKey(name: 'holesPlayed') int? holesPlayed,
    @JsonKey(name: 'relativeToPar') int? relativeToPar,
  }) = RunningScoreEntityData;

  const RunningScoreEntity._();

  factory RunningScoreEntity.fromJson(Map<String, Object?> json) =>
      _$RunningScoreEntityFromJson(json);
}

@freezed
sealed class NextActionsEntity with _$NextActionsEntity {
  const factory NextActionsEntity({
    String? hint,
    @Default([]) List<String> actions,
  }) = NextActionsEntityData;

  const NextActionsEntity._();

  factory NextActionsEntity.fromJson(Map<String, Object?> json) =>
      _$NextActionsEntityFromJson(json);
}

/// Response from POST /v1/rounds/finish
@freezed
sealed class FinishRoundResponse with _$FinishRoundResponse {
  const factory FinishRoundResponse({
    required bool ok,
    String? id,
    RoundSummaryEntity? summary,
    NextActionsEntity? next,
  }) = FinishRoundResponseData;

  const FinishRoundResponse._();

  factory FinishRoundResponse.fromJson(Map<String, Object?> json) =>
      _$FinishRoundResponseFromJson(json);
}

@freezed
sealed class RoundSummaryEntity with _$RoundSummaryEntity {
  const factory RoundSummaryEntity({
    @JsonKey(name: 'totalStrokes') int? totalStrokes,
    @JsonKey(name: 'relativeToPar') int? relativeToPar,
    @JsonKey(name: 'totalPutts') int? totalPutts,
    @JsonKey(name: 'fairwaysHit') int? fairwaysHit,
    @JsonKey(name: 'fairwaysTotal') int? fairwaysTotal,
    int? gir,
    @JsonKey(name: 'girTotal') int? girTotal,
    @JsonKey(name: 'durationMinutes') int? durationMinutes,
  }) = RoundSummaryEntityData;

  const RoundSummaryEntity._();

  factory RoundSummaryEntity.fromJson(Map<String, Object?> json) =>
      _$RoundSummaryEntityFromJson(json);
}

/// Response from POST /v1/rounds/start
@freezed
sealed class StartRoundResponse with _$StartRoundResponse {
  const factory StartRoundResponse({
    required bool ok,
    String? id,
    StartRoundData? round,
    NextActionsEntity? next,
  }) = StartRoundResponseData;

  const StartRoundResponse._();

  factory StartRoundResponse.fromJson(Map<String, Object?> json) =>
      _$StartRoundResponseFromJson(json);
}

@freezed
sealed class StartRoundData with _$StartRoundData {
  const factory StartRoundData({
    required String id,
    @JsonKey(name: 'courseName') String? courseName,
    String? tee,
    @JsonKey(name: 'startTime') String? startTime,
  }) = StartRoundDataData;

  const StartRoundData._();

  factory StartRoundData.fromJson(Map<String, Object?> json) =>
      _$StartRoundDataFromJson(json);
}
