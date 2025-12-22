import 'package:apparence_kit/core/data/entities/user_entity.dart';
import 'package:apparence_kit/core/data/models/subscription.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'user.freezed.dart';

@freezed
sealed class User with _$User {
  const factory User.authenticated({
    required String email,
    String? name,
    String? id,
    DateTime? creationDate,
    DateTime? lastUpdateDate,
    String? avatarPath,
    required bool onboarded,
    String? locale,
    // this will be empty only if you don't use the Subscription module
    Subscription? subscription,
    // Whether the user has connected their account to the ChatGPT CustomGPT
    @Default(false) bool hasCompletedGptOauth,
    // Whether the user is a beta tester
    @Default(false) bool isBeta,
  }) = AuthenticatedUserData;

  const factory User.loading() = LoadingUserData;

  /// Represents a user that is not authenticated (no credentials stored)
  const factory User.unauthenticated() = UnauthenticatedUserData;

  const User._();

  factory User.fromEntity(UserEntity? entity) {
    try {
      if (entity == null) {
        return const User.unauthenticated();
      }
      if (entity.email == null) {
        throw Exception('User entity must have an email address');
      }
      return User.authenticated(
        id: entity.id,
        email: entity.email!,
        name: entity.name,
        onboarded: entity.onboarded ?? false,
        avatarPath: entity.avatarPath,
        creationDate: entity.creationDate,
        lastUpdateDate: entity.lastUpdateDate,
        locale: entity.locale,
        hasCompletedGptOauth: entity.hasCompletedGptOauth,
        isBeta: entity.isBeta,
      );
    } catch (e, trace) {
      Logger().e(e, stackTrace: trace);
      rethrow;
    }
  }

  UserEntity toEntity() {
    return switch (this) {
      final AuthenticatedUserData value => UserEntity(
        id: value.id,
        email: value.email,
        name: value.name ?? '',
        onboarded: value.onboarded,
        avatarPath: value.avatarPath,
        creationDate: value.creationDate,
        lastUpdateDate: value.lastUpdateDate,
        locale: value.locale,
        hasCompletedGptOauth: value.hasCompletedGptOauth,
        isBeta: value.isBeta,
      ),
      LoadingUserData() => throw "user is loading",
      UnauthenticatedUserData() => throw "user is not authenticated",
    };
  }

  String get idOrThrow => switch (this) {
    AuthenticatedUserData(:final id) => id!,
    LoadingUserData() => throw "user is loading",
    UnauthenticatedUserData() => throw "user is not authenticated",
  };

  String? get idOrNull => switch (this) {
    AuthenticatedUserData(:final id) => id,
    LoadingUserData() => null,
    UnauthenticatedUserData() => null,
  };

  bool get isLoading => switch (this) {
    AuthenticatedUserData() => false,
    LoadingUserData() => true,
    UnauthenticatedUserData() => false,
  };

  bool get isAuthenticated => switch (this) {
    AuthenticatedUserData() => true,
    LoadingUserData() => false,
    UnauthenticatedUserData() => false,
  };

  bool get isOnboarded => switch (this) {
    AuthenticatedUserData(:final onboarded) => onboarded,
    LoadingUserData() => false,
    UnauthenticatedUserData() => false,
  };

  bool get isGptConnected => switch (this) {
    AuthenticatedUserData(:final hasCompletedGptOauth) => hasCompletedGptOauth,
    LoadingUserData() => false,
    UnauthenticatedUserData() => false,
  };
}
