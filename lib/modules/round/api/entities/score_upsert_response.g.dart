// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score_upsert_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScoreUpsertResponseData _$ScoreUpsertResponseDataFromJson(Map json) =>
    ScoreUpsertResponseData(
      ok: json['ok'] as bool,
      id: json['id'] as String?,
      score: json['score'] == null
          ? null
          : ScoreUpsertData.fromJson(
              Map<String, Object?>.from(json['score'] as Map),
            ),
      running: json['running'] == null
          ? null
          : RunningScoreEntity.fromJson(
              Map<String, Object?>.from(json['running'] as Map),
            ),
      next: json['next'] == null
          ? null
          : NextActionsEntity.fromJson(
              Map<String, Object?>.from(json['next'] as Map),
            ),
    );

Map<String, dynamic> _$ScoreUpsertResponseDataToJson(
  ScoreUpsertResponseData instance,
) => <String, dynamic>{
  'ok': instance.ok,
  'id': instance.id,
  'score': instance.score?.toJson(),
  'running': instance.running?.toJson(),
  'next': instance.next?.toJson(),
};

ScoreUpsertDataData _$ScoreUpsertDataDataFromJson(Map json) =>
    ScoreUpsertDataData(
      hole: (json['hole'] as num).toInt(),
      strokes: (json['strokes'] as num?)?.toInt(),
      putts: (json['putts'] as num?)?.toInt(),
      scoreName: json['scoreName'] as String?,
    );

Map<String, dynamic> _$ScoreUpsertDataDataToJson(
  ScoreUpsertDataData instance,
) => <String, dynamic>{
  'hole': instance.hole,
  'strokes': instance.strokes,
  'putts': instance.putts,
  'scoreName': instance.scoreName,
};

RunningScoreEntityData _$RunningScoreEntityDataFromJson(Map json) =>
    RunningScoreEntityData(
      totalStrokes: (json['totalStrokes'] as num?)?.toInt(),
      holesPlayed: (json['holesPlayed'] as num?)?.toInt(),
      relativeToPar: (json['relativeToPar'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RunningScoreEntityDataToJson(
  RunningScoreEntityData instance,
) => <String, dynamic>{
  'totalStrokes': instance.totalStrokes,
  'holesPlayed': instance.holesPlayed,
  'relativeToPar': instance.relativeToPar,
};

NextActionsEntityData _$NextActionsEntityDataFromJson(Map json) =>
    NextActionsEntityData(
      hint: json['hint'] as String?,
      actions:
          (json['actions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$NextActionsEntityDataToJson(
  NextActionsEntityData instance,
) => <String, dynamic>{'hint': instance.hint, 'actions': instance.actions};

FinishRoundResponseData _$FinishRoundResponseDataFromJson(Map json) =>
    FinishRoundResponseData(
      ok: json['ok'] as bool,
      id: json['id'] as String?,
      summary: json['summary'] == null
          ? null
          : RoundSummaryEntity.fromJson(
              Map<String, Object?>.from(json['summary'] as Map),
            ),
      next: json['next'] == null
          ? null
          : NextActionsEntity.fromJson(
              Map<String, Object?>.from(json['next'] as Map),
            ),
    );

Map<String, dynamic> _$FinishRoundResponseDataToJson(
  FinishRoundResponseData instance,
) => <String, dynamic>{
  'ok': instance.ok,
  'id': instance.id,
  'summary': instance.summary?.toJson(),
  'next': instance.next?.toJson(),
};

RoundSummaryEntityData _$RoundSummaryEntityDataFromJson(Map json) =>
    RoundSummaryEntityData(
      totalStrokes: (json['totalStrokes'] as num?)?.toInt(),
      relativeToPar: (json['relativeToPar'] as num?)?.toInt(),
      totalPutts: (json['totalPutts'] as num?)?.toInt(),
      fairwaysHit: (json['fairwaysHit'] as num?)?.toInt(),
      fairwaysTotal: (json['fairwaysTotal'] as num?)?.toInt(),
      gir: (json['gir'] as num?)?.toInt(),
      girTotal: (json['girTotal'] as num?)?.toInt(),
      durationMinutes: (json['durationMinutes'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RoundSummaryEntityDataToJson(
  RoundSummaryEntityData instance,
) => <String, dynamic>{
  'totalStrokes': instance.totalStrokes,
  'relativeToPar': instance.relativeToPar,
  'totalPutts': instance.totalPutts,
  'fairwaysHit': instance.fairwaysHit,
  'fairwaysTotal': instance.fairwaysTotal,
  'gir': instance.gir,
  'girTotal': instance.girTotal,
  'durationMinutes': instance.durationMinutes,
};

StartRoundResponseData _$StartRoundResponseDataFromJson(Map json) =>
    StartRoundResponseData(
      ok: json['ok'] as bool,
      id: json['id'] as String?,
      round: json['round'] == null
          ? null
          : StartRoundData.fromJson(
              Map<String, Object?>.from(json['round'] as Map),
            ),
      next: json['next'] == null
          ? null
          : NextActionsEntity.fromJson(
              Map<String, Object?>.from(json['next'] as Map),
            ),
    );

Map<String, dynamic> _$StartRoundResponseDataToJson(
  StartRoundResponseData instance,
) => <String, dynamic>{
  'ok': instance.ok,
  'id': instance.id,
  'round': instance.round?.toJson(),
  'next': instance.next?.toJson(),
};

StartRoundDataData _$StartRoundDataDataFromJson(Map json) => StartRoundDataData(
  id: json['id'] as String,
  courseName: json['courseName'] as String?,
  tee: json['tee'] as String?,
  startTime: json['startTime'] as String?,
);

Map<String, dynamic> _$StartRoundDataDataToJson(StartRoundDataData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'courseName': instance.courseName,
      'tee': instance.tee,
      'startTime': instance.startTime,
    };
