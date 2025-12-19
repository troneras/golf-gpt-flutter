// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseEntityData _$CourseEntityDataFromJson(Map json) => CourseEntityData(
  id: json['id'] as String,
  externalCourseId: json['external_course_id'] as String?,
  name: json['name'] as String,
  clubName: json['club_name'] as String?,
  address: json['address'] as String?,
  city: json['city'] as String?,
  state: json['state'] as String?,
  country: json['country'] as String?,
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  distanceKm: (json['distance_km'] as num?)?.toDouble(),
  tees:
      (json['tees'] as List<dynamic>?)
          ?.map((e) => TeeEntity.fromJson(Map<String, Object?>.from(e as Map)))
          .toList() ??
      const [],
  holes: (json['holes'] as num?)?.toInt(),
  par: (json['par'] as num?)?.toInt(),
  measureUnit: json['measure_unit'] as String?,
  hasGps: json['has_gps'] as bool?,
  parsMen: (json['pars_men'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
  indexesMen: (json['indexes_men'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
);

Map<String, dynamic> _$CourseEntityDataToJson(CourseEntityData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'external_course_id': instance.externalCourseId,
      'name': instance.name,
      'club_name': instance.clubName,
      'address': instance.address,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'distance_km': instance.distanceKm,
      'tees': instance.tees.map((e) => e.toJson()).toList(),
      'holes': instance.holes,
      'par': instance.par,
      'measure_unit': instance.measureUnit,
      'has_gps': instance.hasGps,
      'pars_men': instance.parsMen,
      'indexes_men': instance.indexesMen,
    };

ClosestCourseResponseData _$ClosestCourseResponseDataFromJson(Map json) =>
    ClosestCourseResponseData(
      course: CourseEntity.fromJson(
        Map<String, Object?>.from(json['course'] as Map),
      ),
    );

Map<String, dynamic> _$ClosestCourseResponseDataToJson(
  ClosestCourseResponseData instance,
) => <String, dynamic>{'course': instance.course.toJson()};

NearbyCourseEntityData _$NearbyCourseEntityDataFromJson(Map json) =>
    NearbyCourseEntityData(
      courseId: json['courseID'] as String,
      courseName: json['courseName'] as String,
      clubId: json['clubID'] as String?,
      clubName: json['clubName'] as String?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      country: json['country'] as String?,
      distance: (json['distance'] as num?)?.toDouble(),
      measureUnit: json['measureUnit'] as String?,
      numHoles: (json['numHoles'] as num?)?.toInt(),
      hasGps: (json['hasGPS'] as num?)?.toInt(),
    );

Map<String, dynamic> _$NearbyCourseEntityDataToJson(
  NearbyCourseEntityData instance,
) => <String, dynamic>{
  'courseID': instance.courseId,
  'courseName': instance.courseName,
  'clubID': instance.clubId,
  'clubName': instance.clubName,
  'address': instance.address,
  'city': instance.city,
  'state': instance.state,
  'country': instance.country,
  'distance': instance.distance,
  'measureUnit': instance.measureUnit,
  'numHoles': instance.numHoles,
  'hasGPS': instance.hasGps,
};
