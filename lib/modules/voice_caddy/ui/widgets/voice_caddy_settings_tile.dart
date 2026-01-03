import 'package:apparence_kit/core/states/user_state_notifier.dart';
import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/i18n/translations.g.dart';
import 'package:apparence_kit/modules/voice_caddy/providers/voice_caddy_provider.dart';
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
              ? context.colors.primary.withValues(alpha: 0.1)
              : context.colors.onBackground.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          Icons.headphones,
          color: isConnected
              ? context.colors.primary
              : context.colors.onBackground.withValues(alpha: 0.6),
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
              : context.colors.onBackground.withValues(alpha: 0.6),
        ),
      ),
      trailing: Icon(
        isConnected ? Icons.check_circle : Icons.arrow_forward_ios,
        color: isConnected
            ? context.colors.primary
            : context.colors.onBackground.withValues(alpha: 0.3),
        size: isConnected ? 24 : 16,
      ),
      onTap: isConnected
          ? () => _showDisconnectDialog(context, ref)
          : () => context.push('/voice-caddy-setup'),
    );
  }

  void _showDisconnectDialog(BuildContext context, WidgetRef ref) {
    final tr = Translations.of(context).voice_caddy.settings;
    final colors = context.colors;

    showDialog(
      context: context,
      builder: (dialogContext) {
        return Dialog(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF3A3A3A).withValues(alpha: 0.90),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.08),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.4),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.link_off_rounded,
                    size: 48,
                    color: colors.primary,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    tr.disconnect_title,
                    style: context.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colors.onSurface,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    tr.disconnect_subtitle,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: colors.onSurface.withValues(alpha: 0.7),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.15),
                            ),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () => Navigator.of(dialogContext).pop(),
                              borderRadius: BorderRadius.circular(12),
                              child: Center(
                                child: Text(
                                  tr.disconnect_cancel,
                                  style: context.textTheme.titleSmall?.copyWith(
                                    color: colors.onSurface.withValues(alpha: 0.7),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Container(
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                colors.primary.withValues(alpha: 0.9),
                                colors.primary,
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: colors.primary.withValues(alpha: 0.3),
                                blurRadius: 12,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(dialogContext).pop();
                                _performDisconnect(context, ref);
                              },
                              borderRadius: BorderRadius.circular(12),
                              child: Center(
                                child: Text(
                                  tr.disconnect_confirm,
                                  style: context.textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _performDisconnect(BuildContext context, WidgetRef ref) async {
    final tr = Translations.of(context).voice_caddy.settings;
    final success = await ref.read(voiceCaddyProvider.notifier).disconnect();

    if (!context.mounted) return;

    if (!success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(tr.disconnect_error),
          backgroundColor: Colors.red.shade700,
        ),
      );
    }
  }
}
