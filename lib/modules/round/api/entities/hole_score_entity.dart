// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'hole_score_entity.freezed.dart';
part 'hole_score_entity.g.dart';

@freezed
sealed class HoleScoreEntity with _$HoleScoreEntity {
  const factory HoleScoreEntity({
    String? id,
    @JsonKey(name: 'hole_number') required int holeNumber,
    int? strokes,
    int? putts,
    int? penalties,
    int? par,
    @JsonKey(name: 'fairway_hit') bool? fairwayHit,
    @JsonKey(name: 'green_in_regulation') bool? greenInRegulation,
    @JsonKey(name: 'in_sand') bool? inSand,
    @JsonKey(name: 'score_name') String? scoreName,
  }) = HoleScoreEntityData;

  const HoleScoreEntity._();

  factory HoleScoreEntity.fromJson(Map<String, Object?> json) =>
      _$HoleScoreEntityFromJson(json);
}
