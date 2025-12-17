import 'package:apparence_kit/modules/authentication/providers/models/email.dart';
import 'package:apparence_kit/modules/authentication/providers/models/recover_state.dart';
import 'package:apparence_kit/modules/authentication/repositories/authentication_repository.dart';
import 'package:apparence_kit/modules/authentication/repositories/exceptions/authentication_exceptions.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recover_provider.g.dart';

@Riverpod(keepAlive: false)
class RecoverStateNotifier extends _$RecoverStateNotifier {
  AuthenticationRepository get authRepository =>
      ref.read(authRepositoryProvider);

  @override
  RecoverState build() {
    return RecoverState(email: Email(''));
  }

  void setEmail(String? value) {
    final email = Email(value ?? '');
    if (state is RecoverStateData) {
      state = (state as RecoverStateData).copyWith(email: email);
    }
  }

  void setCode(String value) {
    if (state is RecoverStateCodeEntry) {
      state = (state as RecoverStateCodeEntry).copyWith(code: value);
    }
  }

  void setPassword(String value) {
    if (state is RecoverStateCodeEntry) {
      state = (state as RecoverStateCodeEntry).copyWith(password: value);
    }
  }

  void setPasswordConfirmation(String value) {
    if (state is RecoverStateCodeEntry) {
      state = (state as RecoverStateCodeEntry).copyWith(passwordConfirmation: value);
    }
  }

  Future<void> requestCode() async {
    if (state is! RecoverStateData) return;
    final currentState = state as RecoverStateData;
    try {
      currentState.email.validate();
      state = RecoverState.sending(email: currentState.email);
      await authRepository.forgotPassword(currentState.email.value);
      state = RecoverState.codeEntry(email: currentState.email);
    } on EmailException catch (e) {
      debugPrint('Email validation error: $e');
      state = currentState.copyWith(error: e.message);
    } on PasswordResetException catch (e) {
      debugPrint('Error requesting password reset: $e');
      // Don't show error to prevent email enumeration
      // Backend always returns success
      state = RecoverState.codeEntry(email: currentState.email);
    } catch (e, trace) {
      debugPrint('Error requesting password reset: $e, $trace');
      state = RecoverState.codeEntry(email: currentState.email);
    }
  }

  Future<bool> resetPassword() async {
    if (state is! RecoverStateCodeEntry) return false;
    final currentState = state as RecoverStateCodeEntry;
    if (currentState.code.length != 6) {
      state = currentState.copyWith(error: 'Code must be 6 digits');
      return false;
    }
    if (currentState.password.isEmpty) {
      state = currentState.copyWith(error: 'Password is required');
      return false;
    }
    if (currentState.password != currentState.passwordConfirmation) {
      state = currentState.copyWith(error: 'Passwords do not match');
      return false;
    }
    state = currentState.copyWith(isLoading: true, error: null);
    try {
      await authRepository.resetPassword(
        email: currentState.email.value,
        code: currentState.code,
        password: currentState.password,
        passwordConfirmation: currentState.passwordConfirmation,
      );
      state = const RecoverState.success();
      return true;
    } on PasswordResetException catch (e) {
      debugPrint('Error resetting password: $e');
      state = currentState.copyWith(isLoading: false, error: e.message);
      return false;
    } catch (e, trace) {
      debugPrint('Error resetting password: $e, $trace');
      state = currentState.copyWith(isLoading: false, error: '$e');
      return false;
    }
  }

  void reset() {
    state = RecoverState(email: Email(''));
  }
}
