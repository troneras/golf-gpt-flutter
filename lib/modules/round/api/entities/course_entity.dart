// ignore_for_file: invalid_annotation_target

import 'package:apparence_kit/modules/round/api/entities/tee_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_entity.freezed.dart';
part 'course_entity.g.dart';

/// Helper to extract latitude from nested location object or flat field
double? _extractLatitude(Map<dynamic, dynamic> json, String key) {
  // First check for flat latitude field
  if (json['latitude'] != null) {
    return (json['latitude'] as num).toDouble();
  }
  // Then check for nested location.lat
  final location = json['location'];
  if (location is Map && location['lat'] != null) {
    return (location['lat'] as num).toDouble();
  }
  return null;
}

/// Helper to extract longitude from nested location object or flat field
double? _extractLongitude(Map<dynamic, dynamic> json, String key) {
  // First check for flat longitude field
  if (json['longitude'] != null) {
    return (json['longitude'] as num).toDouble();
  }
  // Then check for nested location.lng
  final location = json['location'];
  if (location is Map && location['lng'] != null) {
    return (location['lng'] as num).toDouble();
  }
  return null;
}

@freezed
sealed class CourseEntity with _$CourseEntity {
  const factory CourseEntity({
    required String id,
    @JsonKey(name: 'external_course_id') String? externalCourseId,
    required String name,
    @JsonKey(name: 'club_name') String? clubName,
    String? address,
    String? city,
    String? state,
    String? country,
    @JsonKey(readValue: _extractLatitude) double? latitude,
    @JsonKey(readValue: _extractLongitude) double? longitude,
    @JsonKey(name: 'distance_km') double? distanceKm,
    @Default([]) List<TeeEntity> tees,
    int? holes,
    int? par,
    @JsonKey(name: 'measure_unit') String? measureUnit,
    @JsonKey(name: 'has_gps') bool? hasGps,
    @JsonKey(name: 'pars_men') List<int>? parsMen,
    @JsonKey(name: 'indexes_men') List<int>? indexesMen,
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

/// Entity for /courses/nearby and /courses/search responses
/// which have different field names than /courses/closest
@freezed
sealed class NearbyCourseEntity with _$NearbyCourseEntity {
  const factory NearbyCourseEntity({
    @JsonKey(name: 'courseID') required String courseId,
    @JsonKey(name: 'courseName') required String courseName,
    @JsonKey(name: 'clubID') String? clubId,
    @JsonKey(name: 'clubName') String? clubName,
    String? address,
    String? city,
    String? state,
    String? country,
    double? distance,
    @JsonKey(name: 'measureUnit') String? measureUnit,
    @JsonKey(name: 'numHoles') int? numHoles,
    @JsonKey(name: 'hasGPS') int? hasGps,
  }) = NearbyCourseEntityData;

  const NearbyCourseEntity._();

  factory NearbyCourseEntity.fromJson(Map<String, Object?> json) =>
      _$NearbyCourseEntityFromJson(json);

  /// Convert to the standard CourseEntity format
  CourseEntity toCourseEntity() {
    return CourseEntity(
      id: courseId,
      name: courseName,
      clubName: clubName,
      address: address,
      city: city,
      state: state,
      country: country,
      distanceKm: distance,
    );
  }
}
