import 'package:apparence_kit/core/data/models/user.dart';
import 'package:apparence_kit/core/states/user_state_notifier.dart';
import 'package:apparence_kit/modules/authentication/providers/models/email_verification_state.dart';
import 'package:apparence_kit/modules/authentication/repositories/authentication_repository.dart';
import 'package:apparence_kit/modules/authentication/repositories/exceptions/authentication_exceptions.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'email_verification_notifier.g.dart';

@Riverpod(keepAlive: false)
class EmailVerificationNotifier extends _$EmailVerificationNotifier {
  AuthenticationRepository get _authRepository =>
      ref.read(authRepositoryProvider);

  @override
  EmailVerificationState build() {
    final userState = ref.read(userStateNotifierProvider);
    final email = switch (userState.user) {
      AuthenticatedUserData(:final email) => email,
      _ => '',
    };
    return EmailVerificationState(email: email);
  }

  Future<void> sendCode() async {
    if (state is EmailVerificationVerified) return;
    final currentState = state as EmailVerificationStateData;
    state = currentState.copyWith(isLoading: true, error: null);
    try {
      await _authRepository.sendEmailVerification();
      state = currentState.copyWith(isLoading: false, codeSent: true, error: null);
    } on EmailVerificationException catch (e) {
      debugPrint('Error sending verification code: $e');
      state = currentState.copyWith(isLoading: false, error: e.message);
    } catch (e) {
      debugPrint('Error sending verification code: $e');
      state = currentState.copyWith(isLoading: false, error: '$e');
    }
  }

  Future<bool> verifyCode(String code) async {
    if (state is EmailVerificationVerified) return true;
    final currentState = state as EmailVerificationStateData;
    state = currentState.copyWith(isLoading: true, error: null);
    try {
      await _authRepository.verifyEmail(code);
      state = const EmailVerificationState.verified();
      return true;
    } on EmailVerificationException catch (e) {
      debugPrint('Error verifying code: $e');
      state = currentState.copyWith(isLoading: false, error: e.message);
      return false;
    } catch (e) {
      debugPrint('Error verifying code: $e');
      state = currentState.copyWith(isLoading: false, error: '$e');
      return false;
    }
  }
}
