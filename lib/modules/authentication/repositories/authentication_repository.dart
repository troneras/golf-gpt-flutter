import 'package:apparence_kit/core/data/api/base_api_exceptions.dart';
import 'package:apparence_kit/core/data/api/http_client.dart';
import 'package:apparence_kit/core/data/api/user_api.dart';
import 'package:apparence_kit/core/data/entities/user_entity.dart';
import 'package:apparence_kit/core/security/secured_storage.dart';
import 'package:apparence_kit/modules/authentication/api/authentication_api.dart';
import 'package:apparence_kit/modules/authentication/api/authentication_api_interface.dart';
import 'package:apparence_kit/modules/authentication/repositories/exceptions/authentication_exceptions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final authRepositoryProvider = Provider<AuthenticationRepository>(
  (Ref ref) => HttpAuthenticationRepository(
    logger: Logger(),
    authenticationApi: ref.read(authenticationApiProvider),
    storage: ref.read(authSecuredStorageProvider),
    userApi: ref.read(userApiProvider),
    httpClient: ref.read(httpClientProvider),
  ),
);

abstract class AuthenticationRepository {
  /// Signup a user with [email] and [password]
  /// The user is signed in automatically
  /// We SHOULD NOT store the password in the database
  /// We stores the token in the secured storage
  /// [locale] is the user's preferred locale (e.g., 'es', 'en')
  /// throws [SignupException] if an error occurs
  Future<void> signup(String email, String password, {String? locale});

  /// Signin a user with [email] and [password]
  /// The user is signed in automatically
  /// We SHOULD NOT store the password in the database
  /// We stores the token in the secured storage
  /// throws [SigninException] if an error occurs
  Future<void> signin(String email, String password);

  /// Get the current user or null if not connected
  Future<Credentials?> get();

  /// Logout the current user
  /// We clear the token from the secured storage
  Future<void> logout();

  /// Signin with Google account
  /// [locale] is the user's preferred locale (e.g., 'es', 'en')
  Future<void> signinWithGoogle({String? locale});

  /// Signin with Google Play Games account on Android
  Future<void> signinWithGooglePlayGames();

  /// Signin with Facebook account
  Future<void> signinWithFacebook();

  /// Signin with Apple account
  Future<void> signinWithApple();

  /// Request a 6-digit password reset code
  /// throws [PasswordResetException] if an error occurs
  Future<void> forgotPassword(String email);

  /// Reset password with 6-digit code
  /// throws [PasswordResetException] if an error occurs
  Future<void> resetPassword({
    required String email,
    required String code,
    required String password,
    required String passwordConfirmation,
  });

  /// Send email verification code to the current user
  /// throws [EmailVerificationException] if an error occurs
  Future<void> sendEmailVerification();

  /// Verify email with the provided code
  /// Updates stored credentials with emailVerified = true
  /// throws [EmailVerificationException] if an error occurs
  Future<void> verifyEmail(String code);

  /// Check if current user's email is verified
  Future<bool> isEmailVerified();

  /// Request a verification code to be sent to the provided phone number
  /// Returns a verification id that will be used to verify the code
  Future<String> signinWithPhone(String phoneNumber);

  /// Verify the phone number with the code sent to the user
  /// The user is signed in automatically if the verification is successful
  /// We store the token in the secured storage
  /// throws [PhoneAuthException] if an error occurs
  Future<void> verifyPhoneAuth(String verificationId, String otp);

  /// Update the phone number of the current user
  /// The user is signed in automatically if the verification is successful
  /// We store the token in the secured storage
  /// throws [PhoneAuthException] if an error occurs
  Future<String> updateAuthPhone(String phoneNumber);

  /// Confirm the link of a phone number to the current user
  /// The user is signed in automatically if the verification is successful
  /// We store the token in the secured storage
  /// throws [PhoneAuthException] if an error occurs
  Future<void> confirmLinkPhoneAuth(String verificationId, String otp);
}

/// this is an example on how to create an authentication repository using firebase
class HttpAuthenticationRepository implements AuthenticationRepository {
  final Logger _logger;
  final AuthenticationApi _authenticationApi;
  final AuthSecuredStorage _storage;
  // ignore: unused_field
  final UserApi _userApi;
  final HttpClient _httpClient;

  HttpAuthenticationRepository({
    required Logger logger,
    required AuthenticationApi authenticationApi,
    required AuthSecuredStorage storage,
    required UserApi userApi,
    required HttpClient httpClient,
  })  : _logger = logger,
        _httpClient = httpClient,
        _userApi = userApi,
        _authenticationApi = authenticationApi,
        _storage = storage;

  @override
  Future<void> signup(String email, String password, {String? locale}) async {
    try {
      _logger.d('Signing up with $email');
      final credentials = await _authenticationApi.signup(email, password, locale: locale);
      await _storage.write(value: credentials);
      _httpClient.authToken = credentials.token;
    } on ApiError catch (e) {
      throw SignupException.fromApiError(e);
    } catch (e) {
      throw SignupException(
        code: 0,
        message: 'Unknown error $e',
      );
    }
  }

  @override
  Future<void> signin(String email, String password) async {
    try {
      _logger.d('Signing in with $email');
      final credentials = await _authenticationApi.signin(email, password);
      _httpClient.authToken = credentials.token;
      // Fetch email verification status if not included in response
      bool emailVerified = credentials.emailVerified;
      if (!emailVerified) {
        try {
          emailVerified = await _authenticationApi.getEmailVerificationStatus();
        } catch (_) {
          // If status check fails, use the value from signin response
        }
      }
      await _storage.write(
        value: Credentials(
          id: credentials.id,
          token: credentials.token,
          emailVerified: emailVerified,
        ),
      );
    } on ApiError catch (e) {
      throw SigninException.fromApiError(e);
    } catch (e) {
      throw SigninException(
        code: 0,
        message: '$e',
      );
    }
  }

  @override
  Future<void> forgotPassword(String email) async {
    try {
      _logger.d('Requesting password reset for $email');
      await _authenticationApi.forgotPassword(email);
    } on ApiError catch (e) {
      throw PasswordResetException.fromApiError(e);
    } catch (e) {
      throw PasswordResetException(
        code: 0,
        message: '$e',
      );
    }
  }

  @override
  Future<void> resetPassword({
    required String email,
    required String code,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      _logger.d('Resetting password for $email');
      await _authenticationApi.resetPassword(
        email: email,
        code: code,
        password: password,
        passwordConfirmation: passwordConfirmation,
      );
    } on ApiError catch (e) {
      throw PasswordResetException.fromApiError(e);
    } catch (e) {
      throw PasswordResetException(
        code: 0,
        message: '$e',
      );
    }
  }

  @override
  Future<void> sendEmailVerification() async {
    try {
      _logger.d('Sending email verification code');
      await _authenticationApi.sendEmailVerification();
    } on ApiError catch (e) {
      throw EmailVerificationException.fromApiError(e);
    } catch (e) {
      throw EmailVerificationException(
        code: 0,
        message: '$e',
      );
    }
  }

  @override
  Future<void> verifyEmail(String code) async {
    try {
      _logger.d('Verifying email with code');
      await _authenticationApi.verifyEmail(code);
      // Update local storage with emailVerified = true
      final credentials = await _storage.read();
      if (credentials != null) {
        await _storage.write(
          value: Credentials(
            id: credentials.id,
            token: credentials.token,
            emailVerified: true,
          ),
        );
      }
    } on ApiError catch (e) {
      throw EmailVerificationException.fromApiError(e);
    } catch (e) {
      throw EmailVerificationException(
        code: 0,
        message: '$e',
      );
    }
  }

  @override
  Future<bool> isEmailVerified() async {
    final credentials = await _storage.read();
    return credentials?.emailVerified ?? false;
  }

  @override
  Future<void> signinWithGoogle({String? locale}) async {
    try {
      _logger.d('Signing in with Google');
      final credentials = await _authenticationApi.signinWithGoogle(locale: locale);
      _httpClient.authToken = credentials.token;
      // Fetch email verification status if not included in response
      bool emailVerified = credentials.emailVerified;
      if (!emailVerified) {
        try {
          emailVerified = await _authenticationApi.getEmailVerificationStatus();
        } catch (_) {
          // If status check fails, use the value from signin response
        }
      }
      await _storage.write(
        value: Credentials(
          id: credentials.id,
          token: credentials.token,
          emailVerified: emailVerified,
        ),
      );
    } on ApiError catch (e) {
      throw SigninException.fromApiError(e);
    } catch (e) {
      throw SigninException(
        code: 0,
        message: '$e',
      );
    }
  }

  @override
  Future<void> signinWithGooglePlayGames() async {
    try {
      _logger.d('Signing in with Google play games');
      final credentials = await _authenticationApi.signinWithGooglePlay();
      await _storage.write(value: credentials);
      _httpClient.authToken = credentials.token;
    } on ApiError catch (e) {
      throw SigninException.fromApiError(e);
    } catch (e) {
      throw SigninException(
        code: 0,
        message: '$e',
      );
    }
  }

  @override
  Future<void> signinWithApple() async {
    try {
      _logger.d('Signing in with Apple');
      final credentials = await _authenticationApi.signinWithApple();
      await _storage.write(value: credentials);
      _httpClient.authToken = credentials.token;
    } on ApiError catch (e) {
      throw SigninException.fromApiError(e);
    } catch (e) {
      throw SigninException(
        code: 0,
        message: '$e',
      );
    }
  }

  @override
  Future<void> signinWithFacebook() async {
    try {
      _logger.d('Signing in with Facebook');
      final credentials = await _authenticationApi.signinWithFacebook();
      await _storage.write(value: credentials);
      _httpClient.authToken = credentials.token;
    } on ApiError catch (e) {
      throw SigninException.fromApiError(e);
    } catch (e) {
      throw SigninException(
        code: 0,
        message: '$e',
      );
    }
  }

  @override
  Future<void> logout() async {
    _logger.d('Logging out');
    _httpClient.authToken = null;
    await _authenticationApi.signout();
    await _storage.clear();
  }

  @override
  Future<Credentials?> get() async {
    final credentials = await _storage.read();
    if (credentials != null) {
      _httpClient.authToken = credentials.token;
    }
    return credentials;
  }

  @override
  Future<String> signinWithPhone(String phoneNumber) {
    try {
      _logger.d('Requesting phone authentication for $phoneNumber');
      return _authenticationApi.signinWithPhone(phoneNumber);
    } on ApiError catch (e) {
      throw PhoneAuthException.fromApiError(e);
    } catch (e) {
      throw PhoneAuthException(
        code: 0,
        message: 'Unknown error: $e',
      );
    }
  }

  @override
  Future<void> verifyPhoneAuth(String verificationId, String otp) async {
    try {
      _logger.d('Verifying phone code');
      final credentials = await _authenticationApi.verifyPhoneAuth(
        verificationId,
        otp,
      );

      await _storage.write(value: credentials);
      _httpClient.authToken = credentials.token;
    } on ApiError catch (e) {
      throw PhoneAuthException.fromApiError(e);
    } catch (e) {
      throw PhoneAuthException(
        code: 0,
        message: 'Unknown error: $e',
      );
    }
  }

  @override
  Future<String> updateAuthPhone(String phoneNumber) async {
    try {
      _logger.d('Updating phone number to $phoneNumber');
      return _authenticationApi.updateAuthPhone(phoneNumber);
    } on PhoneAlreadyLinkedException {
      rethrow;
    } on ApiError catch (e) {
      throw PhoneAuthException.fromApiError(e);
    } catch (e) {
      throw PhoneAuthException(
        code: 0,
        message: 'Unknown error: $e',
      );
    }
  }

  @override
  Future<void> confirmLinkPhoneAuth(String verificationId, String otp) async {
    try {
      _logger.d('Confirming link phone auth');
      await _authenticationApi.confirmLinkPhoneAuth(verificationId, otp);
    } on PhoneAlreadyLinkedException {
      rethrow;
    } on ApiError catch (e) {
      throw PhoneAuthException.fromApiError(e);
    } catch (e) {
      throw PhoneAuthException(
        code: 0,
        message: 'Unknown error: $e',
      );
    }
  }
}
