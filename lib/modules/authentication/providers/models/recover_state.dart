import 'package:apparence_kit/modules/authentication/providers/models/email.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recover_state.freezed.dart';

@freezed
sealed class RecoverState with _$RecoverState {
  /// Initial state - enter email
  const factory RecoverState({
    required Email email,
    String? error,
  }) = RecoverStateData;

  /// Sending forgot password request
  const factory RecoverState.sending({
    required Email email,
  }) = RecoverStateSending;

  /// Code sent - enter 6-digit code and new password
  const factory RecoverState.codeEntry({
    required Email email,
    @Default('') String code,
    @Default('') String password,
    @Default('') String passwordConfirmation,
    @Default(false) bool isLoading,
    String? error,
  }) = RecoverStateCodeEntry;

  /// Password reset successful
  const factory RecoverState.success() = RecoverStateSuccess;

  const RecoverState._();
}
