import 'package:freezed_annotation/freezed_annotation.dart';

part 'voice_caddy_state.freezed.dart';

@freezed
sealed class VoiceCaddyState with _$VoiceCaddyState {
  const factory VoiceCaddyState({
    /// Whether the user has completed GPT OAuth
    @Default(false) bool isConnected,
    /// Last interaction with the GPT
    DateTime? lastInteraction,
    /// Whether we're currently checking connection status
    @Default(false) bool isChecking,
    /// Whether we're currently polling for connection
    @Default(false) bool isPolling,
    /// Whether the user has skipped the flow
    @Default(false) bool hasSkippedFlow,
    /// Whether the user has completed the flow
    @Default(false) bool hasCompletedFlow,
    /// Error message if any
    String? error,
  }) = VoiceCaddyStateData;

  const VoiceCaddyState._();
}
