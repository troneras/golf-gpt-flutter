// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tee_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeeEntityData _$TeeEntityDataFromJson(Map json) => TeeEntityData(
  id: json['id'] as String,
  name: json['name'] as String,
  color: json['color'] as String?,
  slopeMen: _intFromJson(json['slope_men']),
  slopeWomen: _intFromJson(json['slope_women']),
  courseRatingMen: _doubleFromJson(json['course_rating_men']),
  courseRatingWomen: _doubleFromJson(json['course_rating_women']),
  totalLength: _intFromJson(json['total_length']),
  measureUnit: json['measure_unit'] as String?,
  holeLengths: _intListFromJson(json['hole_lengths']),
);

Map<String, dynamic> _$TeeEntityDataToJson(TeeEntityData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color': instance.color,
      'slope_men': instance.slopeMen,
      'slope_women': instance.slopeWomen,
      'course_rating_men': instance.courseRatingMen,
      'course_rating_women': instance.courseRatingWomen,
      'total_length': instance.totalLength,
      'measure_unit': instance.measureUnit,
      'hole_lengths': instance.holeLengths,
    };
