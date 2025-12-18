// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'tee_entity.freezed.dart';
part 'tee_entity.g.dart';

int? _intFromJson(dynamic value) {
  if (value == null) return null;
  if (value is int) return value;
  if (value is String) return int.tryParse(value);
  if (value is double) return value.toInt();
  return null;
}

double? _doubleFromJson(dynamic value) {
  if (value == null) return null;
  if (value is double) return value;
  if (value is int) return value.toDouble();
  if (value is String) return double.tryParse(value);
  return null;
}

List<int>? _intListFromJson(dynamic value) {
  if (value == null) return null;
  if (value is! List) return null;
  return value.map((e) => _intFromJson(e) ?? 0).toList();
}

@freezed
sealed class TeeEntity with _$TeeEntity {
  const factory TeeEntity({
    required String id,
    required String name,
    String? color,
    @JsonKey(name: 'slope_men', fromJson: _intFromJson) int? slopeMen,
    @JsonKey(name: 'slope_women', fromJson: _intFromJson) int? slopeWomen,
    @JsonKey(name: 'course_rating_men', fromJson: _doubleFromJson) double? courseRatingMen,
    @JsonKey(name: 'course_rating_women', fromJson: _doubleFromJson) double? courseRatingWomen,
    @JsonKey(name: 'total_length', fromJson: _intFromJson) int? totalLength,
    @JsonKey(name: 'measure_unit') String? measureUnit,
    @JsonKey(name: 'hole_lengths', fromJson: _intListFromJson) List<int>? holeLengths,
  }) = TeeEntityData;

  const TeeEntity._();

  factory TeeEntity.fromJson(Map<String, Object?> json) =>
      _$TeeEntityFromJson(json);
}
