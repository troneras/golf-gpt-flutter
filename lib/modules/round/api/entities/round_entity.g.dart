// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'round_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoundEntityData _$RoundEntityDataFromJson(Map json) => RoundEntityData(
  id: json['id'] as String,
  courseId: json['course_id'] as String?,
  teeId: json['tee_id'] as String?,
  status: json['status'] as String,
  startTime: json['start_time'] as String,
  endTime: json['end_time'] as String?,
  durationMinutes: (json['duration_minutes'] as num?)?.toInt(),
  totalStrokes: (json['total_strokes'] as num?)?.toInt(),
  totalPutts: (json['total_putts'] as num?)?.toInt(),
  totalPenalties: (json['total_penalties'] as num?)?.toInt(),
  scoreRelativeToPar: (json['score_relative_to_par'] as num?)?.toInt(),
  distanceWalked: (json['distance_walked'] as num?)?.toDouble(),
  fairwaysHit: (json['fairways_hit'] as num?)?.toInt(),
  fairwaysTotal: (json['fairways_total'] as num?)?.toInt(),
  greensInRegulation: (json['greens_in_regulation'] as num?)?.toInt(),
  greensTotal: (json['greens_total'] as num?)?.toInt(),
  weatherConditions: json['weather_conditions'] as String?,
  chatgptEnabled: json['chatgpt_enabled'] as bool? ?? false,
  gpsEnabled: json['gps_enabled'] as bool? ?? true,
  notes: json['notes'] as String?,
  course: json['course'] == null
      ? null
      : CourseEntity.fromJson(Map<String, Object?>.from(json['course'] as Map)),
  tee: json['tee'] == null
      ? null
      : TeeEntity.fromJson(Map<String, Object?>.from(json['tee'] as Map)),
  scores:
      (json['scores'] as List<dynamic>?)
          ?.map(
            (e) =>
                HoleScoreEntity.fromJson(Map<String, Object?>.from(e as Map)),
          )
          .toList() ??
      const [],
);

Map<String, dynamic> _$RoundEntityDataToJson(RoundEntityData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'course_id': instance.courseId,
      'tee_id': instance.teeId,
      'status': instance.status,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'duration_minutes': instance.durationMinutes,
      'total_strokes': instance.totalStrokes,
      'total_putts': instance.totalPutts,
      'total_penalties': instance.totalPenalties,
      'score_relative_to_par': instance.scoreRelativeToPar,
      'distance_walked': instance.distanceWalked,
      'fairways_hit': instance.fairwaysHit,
      'fairways_total': instance.fairwaysTotal,
      'greens_in_regulation': instance.greensInRegulation,
      'greens_total': instance.greensTotal,
      'weather_conditions': instance.weatherConditions,
      'chatgpt_enabled': instance.chatgptEnabled,
      'gps_enabled': instance.gpsEnabled,
      'notes': instance.notes,
      'course': instance.course?.toJson(),
      'tee': instance.tee?.toJson(),
      'scores': instance.scores.map((e) => e.toJson()).toList(),
    };

RoundResponseData _$RoundResponseDataFromJson(Map json) => RoundResponseData(
  round: RoundEntity.fromJson(Map<String, Object?>.from(json['round'] as Map)),
);

Map<String, dynamic> _$RoundResponseDataToJson(RoundResponseData instance) =>
    <String, dynamic>{'round': instance.round.toJson()};

RoundsListResponseData _$RoundsListResponseDataFromJson(Map json) =>
    RoundsListResponseData(
      rounds: (json['rounds'] as List<dynamic>)
          .map((e) => RoundEntity.fromJson(Map<String, Object?>.from(e as Map)))
          .toList(),
      total: (json['total'] as num).toInt(),
      limit: (json['limit'] as num?)?.toInt() ?? 20,
      offset: (json['offset'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$RoundsListResponseDataToJson(
  RoundsListResponseData instance,
) => <String, dynamic>{
  'rounds': instance.rounds.map((e) => e.toJson()).toList(),
  'total': instance.total,
  'limit': instance.limit,
  'offset': instance.offset,
};
