// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hole_score_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HoleScoreEntityData _$HoleScoreEntityDataFromJson(Map json) =>
    HoleScoreEntityData(
      id: json['id'] as String?,
      holeNumber: (json['hole_number'] as num).toInt(),
      strokes: (json['strokes'] as num?)?.toInt(),
      putts: (json['putts'] as num?)?.toInt(),
      penalties: (json['penalties'] as num?)?.toInt(),
      par: (json['par'] as num?)?.toInt(),
      fairwayHit: json['fairway_hit'] as bool?,
      greenInRegulation: json['green_in_regulation'] as bool?,
      inSand: json['in_sand'] as bool?,
      scoreName: json['score_name'] as String?,
    );

Map<String, dynamic> _$HoleScoreEntityDataToJson(
  HoleScoreEntityData instance,
) => <String, dynamic>{
  'id': instance.id,
  'hole_number': instance.holeNumber,
  'strokes': instance.strokes,
  'putts': instance.putts,
  'penalties': instance.penalties,
  'par': instance.par,
  'fairway_hit': instance.fairwayHit,
  'green_in_regulation': instance.greenInRegulation,
  'in_sand': instance.inSand,
  'score_name': instance.scoreName,
};
