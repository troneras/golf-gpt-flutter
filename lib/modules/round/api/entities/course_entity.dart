// ignore_for_file: invalid_annotation_target

import 'package:apparence_kit/modules/round/api/entities/tee_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_entity.freezed.dart';
part 'course_entity.g.dart';

@freezed
sealed class CourseEntity with _$CourseEntity {
  const factory CourseEntity({
    required String id,
    @JsonKey(name: 'external_course_id') String? externalCourseId,
    required String name,
    String? address,
    String? city,
    String? state,
    String? country,
    double? latitude,
    double? longitude,
    @JsonKey(name: 'distance_km') double? distanceKm,
    @Default([]) List<TeeEntity> tees,
  }) = CourseEntityData;

  const CourseEntity._();

  factory CourseEntity.fromJson(Map<String, Object?> json) =>
      _$CourseEntityFromJson(json);
}

@freezed
sealed class ClosestCourseResponse with _$ClosestCourseResponse {
  const factory ClosestCourseResponse({
    required CourseEntity course,
  }) = ClosestCourseResponseData;

  const ClosestCourseResponse._();

  factory ClosestCourseResponse.fromJson(Map<String, Object?> json) =>
      _$ClosestCourseResponseFromJson(json);
}
