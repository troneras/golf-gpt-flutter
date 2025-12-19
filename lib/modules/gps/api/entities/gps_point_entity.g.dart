// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gps_point_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GpsPointEntityData _$GpsPointEntityDataFromJson(Map json) => GpsPointEntityData(
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  accuracy: (json['accuracy'] as num?)?.toDouble(),
  altitude: (json['altitude'] as num?)?.toDouble(),
  speed: (json['speed'] as num?)?.toDouble(),
  heading: (json['heading'] as num?)?.toDouble(),
  recordedAt: json['recorded_at'] as String?,
);

Map<String, dynamic> _$GpsPointEntityDataToJson(GpsPointEntityData instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'accuracy': instance.accuracy,
      'altitude': instance.altitude,
      'speed': instance.speed,
      'heading': instance.heading,
      'recorded_at': instance.recordedAt,
    };

GpsTrackResponseData _$GpsTrackResponseDataFromJson(Map json) =>
    GpsTrackResponseData(ok: json['ok'] as bool, id: json['id'] as String?);

Map<String, dynamic> _$GpsTrackResponseDataToJson(
  GpsTrackResponseData instance,
) => <String, dynamic>{'ok': instance.ok, 'id': instance.id};
