// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'club_entity.freezed.dart';
part 'club_entity.g.dart';

@freezed
sealed class ClubEntity with _$ClubEntity {
  const factory ClubEntity({
    required String id,
    @JsonKey(name: 'club_type') required String clubType,
    @JsonKey(name: 'club_type_name') required String clubTypeName,
    String? nickname,
    String? brand,
    String? model,
    @JsonKey(name: 'display_name') required String displayName,
    @JsonKey(name: 'is_active') @Default(true) bool isActive,
    @JsonKey(name: 'current_distance_yards') int? currentDistanceYards,
    @JsonKey(name: 'acquired_at') String? acquiredAt,
    String? notes,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = ClubEntityData;

  const ClubEntity._();

  factory ClubEntity.fromJson(Map<String, Object?> json) =>
      _$ClubEntityFromJson(json);
}

@freezed
sealed class BagResponse with _$BagResponse {
  const factory BagResponse({
    required List<ClubEntity> clubs,
    @JsonKey(name: 'total_clubs') @Default(0) int totalClubs,
    String? narrative,
  }) = BagResponseData;

  const BagResponse._();

  factory BagResponse.fromJson(Map<String, Object?> json) =>
      _$BagResponseFromJson(json);
}

@freezed
sealed class ClubResponse with _$ClubResponse {
  const factory ClubResponse({
    required ClubEntity club,
  }) = ClubResponseData;

  const ClubResponse._();

  factory ClubResponse.fromJson(Map<String, Object?> json) =>
      _$ClubResponseFromJson(json);
}
