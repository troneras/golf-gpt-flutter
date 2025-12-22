// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

@freezed
sealed class UserEntity with _$UserEntity {
  const factory UserEntity({
    @JsonKey(includeIfNull: false) String? id,
    @JsonKey(name: 'creation_date') DateTime? creationDate,
    @JsonKey(name: 'last_update_date') DateTime? lastUpdateDate,
    String? email,
    String? name,
    String? avatarPath,
    bool? onboarded,
    String? locale,
    @JsonKey(name: 'has_completed_gpt_oauth') @Default(false) bool hasCompletedGptOauth,
    @JsonKey(name: 'is_beta') @Default(false) bool isBeta,
  }) = UserEntityData;

  const UserEntity._();

  factory UserEntity.fromJson(Map<String, Object?> json) =>
      _$UserEntityFromJson(json);
}

class Credentials {
  // this is the user id
  final String id;
  // this is the user security token (example: JWT)
  // but your can use an Oauth2 token with a refresh token too
  final String token;
  // whether the user's email has been verified
  final bool emailVerified;

  Credentials({
    required this.id,
    required this.token,
    this.emailVerified = false,
  });

  factory Credentials.fromJson(Map<String, Object?> json) {
    if (!json.containsKey('id') || !json.containsKey('token')) {
      throw Exception('Invalid credentials');
    }
    return Credentials(
      id: json['id']! as String,
      token: json['token']! as String,
      emailVerified: json['email_verified'] as bool? ?? false,
    );
  }
}
