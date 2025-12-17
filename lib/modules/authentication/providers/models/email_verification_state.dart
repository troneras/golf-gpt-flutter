import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_verification_state.freezed.dart';

@freezed
sealed class EmailVerificationState with _$EmailVerificationState {
  const factory EmailVerificationState({
    @Default(false) bool isLoading,
    @Default(false) bool codeSent,
    @Default('') String email,
    String? error,
  }) = EmailVerificationStateData;

  const factory EmailVerificationState.verified() = EmailVerificationVerified;

  const EmailVerificationState._();
}
