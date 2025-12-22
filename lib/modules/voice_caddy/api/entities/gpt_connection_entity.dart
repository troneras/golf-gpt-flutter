// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'gpt_connection_entity.freezed.dart';
part 'gpt_connection_entity.g.dart';

@freezed
sealed class GptConnectionEntity with _$GptConnectionEntity {
  const factory GptConnectionEntity({
    @JsonKey(name: 'has_completed_oauth') @Default(false) bool hasCompletedOauth,
    @JsonKey(name: 'last_interaction') DateTime? lastInteraction,
  }) = GptConnectionEntityData;

  const GptConnectionEntity._();

  factory GptConnectionEntity.fromJson(Map<String, Object?> json) =>
      _$GptConnectionEntityFromJson(json);
}
