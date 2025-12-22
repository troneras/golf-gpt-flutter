import 'package:apparence_kit/core/states/user_state_notifier.dart';
import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/i18n/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class VoiceCaddySettingsTile extends ConsumerWidget {
  const VoiceCaddySettingsTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userStateNotifierProvider);
    final tr = Translations.of(context).voice_caddy.settings;

    final isConnected = userState.user.isGptConnected;

    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: isConnected
              ? context.colors.primary.withOpacity(0.1)
              : context.colors.onBackground.withOpacity(0.05),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          Icons.headphones,
          color: isConnected
              ? context.colors.primary
              : context.colors.onBackground.withOpacity(0.6),
          size: 20,
        ),
      ),
      title: Text(
        tr.title,
        style: context.textTheme.bodyLarge,
      ),
      subtitle: Text(
        isConnected ? tr.connected : tr.not_connected,
        style: context.textTheme.bodySmall?.copyWith(
          color: isConnected
              ? context.colors.primary
              : context.colors.onBackground.withOpacity(0.6),
        ),
      ),
      trailing: Icon(
        isConnected ? Icons.check_circle : Icons.arrow_forward_ios,
        color: isConnected
            ? context.colors.primary
            : context.colors.onBackground.withOpacity(0.3),
        size: isConnected ? 24 : 16,
      ),
      onTap: isConnected
          ? null
          : () {
              context.push('/voice-caddy-setup');
            },
    );
  }
}
