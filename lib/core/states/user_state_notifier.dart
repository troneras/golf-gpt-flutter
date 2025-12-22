import 'package:apparence_kit/core/data/models/user.dart';
import 'package:apparence_kit/core/data/repositories/user_repository.dart';
import 'package:apparence_kit/core/initializer/onstart_service.dart';
import 'package:apparence_kit/core/states/models/user_state.dart';
import 'package:apparence_kit/environnements.dart';
import 'package:apparence_kit/modules/authentication/repositories/authentication_repository.dart';
import 'package:apparence_kit/modules/notifications/providers/models/device.dart';
import 'package:apparence_kit/modules/notifications/repositories/device_repository.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';


part 'user_state_notifier.g.dart';

/// Use this provider to access the user state (legacy name)
const userStateNotifierProvider = userStateProvider;

/// This class is responsible for managing the state of the user over the app.
/// It will be used to know if the user is connected or not and to get the user
@Riverpod(keepAlive: true)
class UserStateNotifier extends _$UserStateNotifier implements OnStartService {
  Logger get _logger => Logger();

  AuthenticationRepository get _authenticationRepository =>
      ref.read(authRepositoryProvider);

  DeviceRepository get _deviceRepository => ref.read(deviceRepositoryProvider);

  UserRepository get _userRepository => ref.read(userRepositoryProvider);

  @override
  UserState build() {
    return const UserState(user: User.loading());
  }

  @override
  Future<void> init() async {
    try {
      await _loadState();
    } catch (e, stacktrace) {
      _logger.e(e, stackTrace: stacktrace);
      // Fail-safe: on auth error, logout and let user re-authenticate
      // This prevents red error screens and provides a better UX
      await _authenticationRepository.logout();
      state = state.copyWith(user: const User.unauthenticated());
      _logger.i('Auth error during init - user logged out, will redirect to login');
      // Don't rethrow - let the app continue to the login screen
    }
    if (state.user is LoadingUserData) {
      // Safety check: ensure we never leave the user in loading state
      state = state.copyWith(user: const User.unauthenticated());
    }
    await _initDeviceRegistration();
    _deviceRepository.onTokenUpdate(_onUpdateToken);
  }

  /// This function is called when the user click on the signin button
  /// It will load the user state and register the device to the notification service
  /// It will also load the subscription state
  Future<void> onSignin() async {
    state = const UserState(
      user: User.loading(),
    );
    await _loadState();
    await _initDeviceRegistration();
  }

  /// Set the user as onboarded in the database
  /// This function is called when the user has completed the onboarding
  Future<void> onOnboarded() async {
    final newUser = await _userRepository.setOnboarded(state.user);
    state = state.copyWith(user: newUser);
  }

  /// This function is called when the user click on the logout button
  /// It will unregister the device from the notification service
  /// and logout the user
  Future<void> onLogout() async {
    final userId = state.user.idOrThrow;
    _deviceRepository.removeTokenUpdateListener();
    await _deviceRepository.unregister(userId);
    await _authenticationRepository.logout();
    _clearSentryUser();
    state = const UserState(
      user: User.unauthenticated(),
    );
  }

  /// Refresh the user
  Future<void> onUpdateAvatar() async {
    await refresh();
  }

  /// Refresh the user
  Future<void> refresh() async {
    final user = await _userRepository.get(state.user.idOrThrow);
    if (user == null) {
      throw Exception('User not found during refresh');
    }
    state = state.copyWith(user: user);
  }

  

  /// Apple store and Google play stores requires you to be able to delete a user account on demand
  /// Here is the function to do it.
  /// It will delete the user account and logout the user
  Future<void> deleteAccount() async {
    try {
      final userId = state.user.idOrThrow;
      _deviceRepository.removeTokenUpdateListener();
      await _deviceRepository.unregister(userId);
      await _userRepository.delete();
      await _authenticationRepository.logout();
    } catch (e) {
      _logger.e(e);
    }
    state = const UserState(
      user: User.unauthenticated(),
    );
  }

  // -------------------------------
  // PRIVATES
  // -------------------------------

  /// Load the state of the user
  Future<void> _loadState() async {
    final credentials = await _authenticationRepository.get();

    if (credentials == null) {
      _logger.i('User is not authenticated');
      state = state.copyWith(user: const User.unauthenticated());
    } else {
      _logger.i('User is connected with id ${credentials.id}');
      // I like to save a User automatically when the user is authenticated
      // Using firestore you can create a trigger to do this with the same document ID as the credentials
      final user = await _userRepository.get(credentials.id);
      if (user == null) {
        throw Exception('''
User infos not found. If you are using firebase \r\n
- Check that you have correctly installed firebase functions
If you are using supabase
- Check that you have properly run the setup script
        ''');
      }
      state = state.copyWith(user: user);
      await _setSentryUser(user);
    }
  }

  /// If user has an ID we will register his device to send notifications from
  /// the server to the device (only if user has accepted them)
  /// Maybe save your device in UserState if you need it in your app
  Future<void> _initDeviceRegistration() async {
    final userId = state.user.idOrNull;
    if (userId == null) {
      return;
    }
    try {
      final _ = await _deviceRepository.register(userId);
    } catch (err, stacktrace) {
      _logger.e(err, stackTrace: stacktrace);
      _logger.e('''
          ❌ Your device seems not to be registered.
          Check that you correctly setup a device registration API
          see: `lib/modules/notifications/api/device_api.dart`
        ''');
    }
  }

  /// This function is called when the device token is updated
  /// It will update the token in the database
  Future<void> _onUpdateToken(Device device) async {
    await _deviceRepository.updateToken(device.token);
  }

  /// Set Sentry user context for error tracking (production only)
  Future<void> _setSentryUser(User user) async {
    if (ref.read(environmentProvider) is! ProdEnvironment) return;
    final authenticatedUser = user as AuthenticatedUserData;
    final locationStatus = await Permission.locationWhenInUse.status;
    final notificationStatus = await Permission.notification.status;
    Sentry.configureScope((scope) {
      scope.setUser(SentryUser(
        id: authenticatedUser.id,
        email: authenticatedUser.email,
        username: authenticatedUser.name,
      ));
      scope.setTag('gpt_connected', authenticatedUser.hasCompletedGptOauth.toString());
      scope.setTag('is_beta', authenticatedUser.isBeta.toString());
      scope.setTag('onboarded', authenticatedUser.onboarded.toString());
      scope.setTag('location_permission', locationStatus.name);
      scope.setTag('notification_permission', notificationStatus.name);
    });
  }

  /// Clear Sentry user context on logout (production only)
  void _clearSentryUser() {
    if (ref.read(environmentProvider) is! ProdEnvironment) return;
    Sentry.configureScope((scope) {
      scope.setUser(null);
    });
  }
}
