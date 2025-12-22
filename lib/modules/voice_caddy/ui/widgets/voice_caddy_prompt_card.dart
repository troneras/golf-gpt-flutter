import 'package:apparence_kit/core/states/user_state_notifier.dart';
import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/i18n/translations.g.dart';
import 'package:apparence_kit/modules/voice_caddy/providers/voice_caddy_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class VoiceCaddyPromptCard extends ConsumerWidget {
  const VoiceCaddyPromptCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userStateNotifierProvider);
    final tr = Translations.of(context).voice_caddy.home_card;

    final isConnected = userState.user.isGptConnected;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isConnected
              ? context.colors.primary.withOpacity(0.3)
              : context.colors.onBackground.withOpacity(0.1),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: isConnected
                  ? context.colors.primary.withOpacity(0.1)
                  : context.colors.onBackground.withOpacity(0.05),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              isConnected ? Icons.headphones : Icons.mic_none,
              color: isConnected
                  ? context.colors.primary
                  : context.colors.onBackground.withOpacity(0.6),
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isConnected ? tr.connected_title : tr.not_connected_title,
                  style: context.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  isConnected ? tr.connected_subtitle : tr.not_connected_subtitle,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.colors.onBackground.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          if (isConnected)
            TextButton(
              onPressed: () {
                ref.read(voiceCaddyProvider.notifier).openChatGPT();
              },
              child: Text(tr.connected_cta),
            )
          else
            FilledButton.tonal(
              onPressed: () {
                context.push('/voice-caddy-setup');
              },
              child: Text(tr.not_connected_cta),
            ),
        ],
      ),
    );
  }
}
