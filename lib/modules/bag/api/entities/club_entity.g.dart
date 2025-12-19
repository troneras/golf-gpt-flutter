// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'club_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClubEntityData _$ClubEntityDataFromJson(Map json) => ClubEntityData(
  id: json['id'] as String,
  clubType: json['club_type'] as String,
  clubTypeName: json['club_type_name'] as String,
  nickname: json['nickname'] as String?,
  brand: json['brand'] as String?,
  model: json['model'] as String?,
  displayName: json['display_name'] as String,
  isActive: json['is_active'] as bool? ?? true,
  currentDistanceYards: (json['current_distance_yards'] as num?)?.toInt(),
  acquiredAt: json['acquired_at'] as String?,
  notes: json['notes'] as String?,
  createdAt: json['created_at'] as String?,
);

Map<String, dynamic> _$ClubEntityDataToJson(ClubEntityData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'club_type': instance.clubType,
      'club_type_name': instance.clubTypeName,
      'nickname': instance.nickname,
      'brand': instance.brand,
      'model': instance.model,
      'display_name': instance.displayName,
      'is_active': instance.isActive,
      'current_distance_yards': instance.currentDistanceYards,
      'acquired_at': instance.acquiredAt,
      'notes': instance.notes,
      'created_at': instance.createdAt,
    };

BagResponseData _$BagResponseDataFromJson(Map json) => BagResponseData(
  clubs: (json['clubs'] as List<dynamic>)
      .map((e) => ClubEntity.fromJson(Map<String, Object?>.from(e as Map)))
      .toList(),
  totalClubs: (json['total_clubs'] as num?)?.toInt() ?? 0,
  narrative: json['narrative'] as String?,
);

Map<String, dynamic> _$BagResponseDataToJson(BagResponseData instance) =>
    <String, dynamic>{
      'clubs': instance.clubs.map((e) => e.toJson()).toList(),
      'total_clubs': instance.totalClubs,
      'narrative': instance.narrative,
    };

ClubResponseData _$ClubResponseDataFromJson(Map json) => ClubResponseData(
  club: ClubEntity.fromJson(Map<String, Object?>.from(json['club'] as Map)),
);

Map<String, dynamic> _$ClubResponseDataToJson(ClubResponseData instance) =>
    <String, dynamic>{'club': instance.club.toJson()};
