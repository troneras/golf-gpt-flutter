// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gpt_connection_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GptConnectionEntityData _$GptConnectionEntityDataFromJson(Map json) =>
    GptConnectionEntityData(
      hasCompletedOauth: json['has_completed_oauth'] as bool? ?? false,
      lastInteraction: json['last_interaction'] == null
          ? null
          : DateTime.parse(json['last_interaction'] as String),
    );

Map<String, dynamic> _$GptConnectionEntityDataToJson(
  GptConnectionEntityData instance,
) => <String, dynamic>{
  'has_completed_oauth': instance.hasCompletedOauth,
  'last_interaction': instance.lastInteraction?.toIso8601String(),
};
