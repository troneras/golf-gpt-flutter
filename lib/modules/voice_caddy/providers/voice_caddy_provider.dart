import 'dart:async';

import 'package:apparence_kit/core/states/user_state_notifier.dart';
import 'package:apparence_kit/modules/voice_caddy/providers/models/voice_caddy_state.dart';
import 'package:apparence_kit/modules/voice_caddy/repositories/voice_caddy_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:url_launcher/url_launcher.dart';

part 'voice_caddy_provider.g.dart';

/// Environment variable for the GPT ID
const _gptId = String.fromEnvironment('GPT_ID', defaultValue: 'PLACEHOLDER');

extension VoiceCaddyNotifierExt on WidgetRef {
  VoiceCaddyNotifier get voiceCaddyNotifier =>
      read(voiceCaddyProvider.notifier);

  VoiceCaddyState get voiceCaddyState$ => watch(voiceCaddyProvider);
}

@Riverpod(keepAlive: true)
class VoiceCaddyNotifier extends _$VoiceCaddyNotifier {
  Timer? _pollingTimer;
  static const _pollingInterval = Duration(seconds: 3);
  static const _maxPollingDuration = Duration(minutes: 5);

  Logger get _logger => Logger();

  @override
  VoiceCaddyState build() {
    ref.onDispose(() {
      _pollingTimer?.cancel();
    });
    return const VoiceCaddyState();
  }

  /// Check the current connection status from the backend API
  Future<void> checkConnectionStatus() async {
    final userState = ref.read(userStateNotifierProvider);
    if (!userState.user.isAuthenticated) return;

    state = state.copyWith(isChecking: true, error: null);

    try {
      final repository = ref.read(voiceCaddyRepositoryProvider);
      final status = await repository.checkConnectionStatus(
        userState.user.idOrThrow,
      );

      _logger.d('GPT connection status: ${status.isConnected}');

      state = state.copyWith(
        isConnected: status.isConnected,
        lastInteraction: status.lastInteraction,
        isChecking: false,
      );

      // If connected, also refresh user state to sync the flag
      if (status.isConnected) {
        await _refreshUserState();
      }
    } catch (e) {
      _logger.e('Error checking GPT connection: $e');
      state = state.copyWith(
        isChecking: false,
        error: e.toString(),
      );
    }
  }

  /// Start polling for connection status (used on waiting screen)
  void startPolling() {
    if (_pollingTimer != null) return;

    state = state.copyWith(isPolling: true);
    final startTime = DateTime.now();

    _pollingTimer = Timer.periodic(_pollingInterval, (_) async {
      // Stop polling after max duration
      if (DateTime.now().difference(startTime) > _maxPollingDuration) {
        stopPolling();
        return;
      }

      final userState = ref.read(userStateNotifierProvider);
      if (!userState.user.isAuthenticated) {
        stopPolling();
        return;
      }

      try {
        final repository = ref.read(voiceCaddyRepositoryProvider);
        final status = await repository.checkConnectionStatus(
          userState.user.idOrThrow,
        );

        if (status.isConnected) {
          stopPolling();
          state = state.copyWith(
            isConnected: true,
            lastInteraction: status.lastInteraction,
          );
          // Refresh user state so isGptConnected is updated everywhere
          await _refreshUserState();
        }
      } catch (_) {
        // Silently fail during polling
      }
    });
  }

  /// Refresh the user state to sync GPT connection flag
  Future<void> _refreshUserState() async {
    try {
      await ref.read(userStateNotifierProvider.notifier).refresh();
    } catch (e) {
      _logger.e('Error refreshing user state: $e');
    }
  }

  /// Stop polling
  void stopPolling() {
    _pollingTimer?.cancel();
    _pollingTimer = null;
    state = state.copyWith(isPolling: false);
  }

  /// Open ChatGPT with the custom GPT
  Future<bool> openChatGPT() async {
    const gptUrl = 'https://chat.openai.com/g/$_gptId';
    final uri = Uri.parse(gptUrl);

    try {
      final launched = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
      return launched;
    } catch (e) {
      state = state.copyWith(error: 'Could not open ChatGPT');
      return false;
    }
  }

  /// Mark the flow as skipped
  void skipFlow() {
    state = state.copyWith(hasSkippedFlow: true);
  }

  /// Mark the flow as completed
  void completeFlow() {
    state = state.copyWith(hasCompletedFlow: true);
  }

  /// Reset the flow state (for retrying)
  void resetFlow() {
    state = state.copyWith(
      hasSkippedFlow: false,
      hasCompletedFlow: false,
      error: null,
    );
  }

  /// Manual confirmation that user has connected (fallback button)
  Future<void> confirmConnection() async {
    await checkConnectionStatus();
  }
}
