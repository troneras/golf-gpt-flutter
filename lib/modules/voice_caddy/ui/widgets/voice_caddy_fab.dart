import 'package:apparence_kit/core/data/api/analytics_api.dart';
import 'package:apparence_kit/core/states/user_state_notifier.dart';
import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/i18n/translations.g.dart';
import 'package:apparence_kit/modules/voice_caddy/providers/voice_caddy_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// A floating action button for quick access to the voice caddy (ChatGPT).
///
/// Shows a headphones icon when connected, mic icon when not connected.
/// Tapping opens ChatGPT directly if connected, or navigates to setup flow.
class VoiceCaddyFab extends ConsumerWidget {
  const VoiceCaddyFab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userStateNotifierProvider);
    final tr = Translations.of(context).voice_caddy.fab;
    final isConnected = userState.user.isGptConnected;

    return FloatingActionButton(
      onPressed: () => _onTap(context, ref, isConnected),
      tooltip: isConnected ? tr.tooltip_connected : tr.tooltip_not_connected,
      backgroundColor: isConnected
          ? context.colors.primary
          : context.colors.surface,
      foregroundColor: isConnected
          ? Colors.white
          : context.colors.onSurface,
      elevation: 4,
      child: Icon(
        isConnected ? Icons.headphones : Icons.mic_none,
        size: 28,
      ),
    );
  }

  Future<void> _onTap(
    BuildContext context,
    WidgetRef ref,
    bool isConnected,
  ) async {
    // Read providers synchronously before async operations to avoid
    // using ref after the widget may have been unmounted
    final analyticsApi = ref.read(analyticsApiProvider);
    final voiceCaddyNotifier = ref.read(voiceCaddyProvider.notifier);

    if (isConnected) {
      await analyticsApi.logEvent('voice_caddy_fab_opened', {
        'source': 'round_in_progress',
      });
      await voiceCaddyNotifier.openChatGPT();
    } else {
      await analyticsApi.logEvent('voice_caddy_fab_setup', {
        'source': 'round_in_progress',
      });
      if (context.mounted) {
        context.push('/voice-caddy-setup');
      }
    }
  }
}
