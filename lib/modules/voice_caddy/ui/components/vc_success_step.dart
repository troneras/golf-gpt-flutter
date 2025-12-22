import 'package:apparence_kit/core/data/api/analytics_api.dart';
import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/i18n/translations.g.dart';
import 'package:apparence_kit/modules/onboarding/ui/widgets/onboarding_background.dart';
import 'package:apparence_kit/modules/voice_caddy/providers/voice_caddy_provider.dart';
import 'package:apparence_kit/modules/voice_caddy/ui/widgets/vc_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Screen 6: Success - Connection complete with next steps
class VcSuccessStep extends ConsumerWidget {
  final VoidCallback onStartRound;
  final VoidCallback onGoHome;

  const VcSuccessStep({
    super.key,
    required this.onStartRound,
    required this.onGoHome,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tr = Translations.of(context).voice_caddy.success;

    // Mark flow as completed and track analytics
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(analyticsApiProvider).logEvent('gpt_setup_completed', {});
      ref.read(analyticsApiProvider).setSuperProperty('gpt_connected', true);
      ref.read(voiceCaddyProvider.notifier).completeFlow();
    });

    return OnboardingBackground(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const VcProgress(value: 1.0),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Animate(
                effects: const [
                  FadeEffect(
                    delay: Duration(milliseconds: 200),
                    duration: Duration(milliseconds: 300),
                  ),
                  ScaleEffect(
                    begin: Offset(0.8, 0.8),
                    end: Offset(1, 1),
                    delay: Duration(milliseconds: 200),
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  ),
                ],
                child: Icon(
                  Icons.check_circle,
                  size: 80,
                  color: context.colors.primary,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Animate(
                effects: const [
                  FadeEffect(
                    delay: Duration(milliseconds: 300),
                    duration: Duration(milliseconds: 200),
                  ),
                  MoveEffect(
                    delay: Duration(milliseconds: 300),
                    duration: Duration(milliseconds: 450),
                    begin: Offset(0, 30),
                    end: Offset.zero,
                  ),
                ],
                child: Text(
                  tr.title,
                  textAlign: TextAlign.center,
                  style: context.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Animate(
                effects: const [
                  FadeEffect(
                    delay: Duration(milliseconds: 350),
                    duration: Duration(milliseconds: 200),
                  ),
                ],
                child: Text(
                  tr.subtitle,
                  textAlign: TextAlign.center,
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: context.colors.onBackground.withOpacity(0.7),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Animate(
                effects: const [
                  FadeEffect(
                    delay: Duration(milliseconds: 400),
                    duration: Duration(milliseconds: 200),
                  ),
                  MoveEffect(
                    delay: Duration(milliseconds: 400),
                    duration: Duration(milliseconds: 450),
                    begin: Offset(0, 30),
                    end: Offset.zero,
                  ),
                ],
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: context.colors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.headphones,
                        size: 40,
                        color: context.colors.primary,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        tr.tip,
                        textAlign: TextAlign.center,
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: context.colors.onBackground,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48),
              child: Animate(
                effects: const [
                  FadeEffect(
                    delay: Duration(milliseconds: 450),
                    duration: Duration(milliseconds: 200),
                  ),
                ],
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: context.colors.surface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: context.colors.onBackground.withOpacity(0.1),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.chat_bubble_outline,
                        size: 24,
                        color: context.colors.primary,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          tr.example,
                          style: context.textTheme.bodySmall?.copyWith(
                            fontStyle: FontStyle.italic,
                            color: context.colors.onBackground.withOpacity(0.8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Animate(
                effects: const [
                  FadeEffect(
                    delay: Duration(milliseconds: 500),
                    duration: Duration(milliseconds: 200),
                  ),
                ],
                child: ElevatedButton(
                  onPressed: onStartRound,
                  child: Text(tr.cta_primary),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Animate(
                effects: const [
                  FadeEffect(
                    delay: Duration(milliseconds: 550),
                    duration: Duration(milliseconds: 200),
                  ),
                ],
                child: TextButton(
                  onPressed: onGoHome,
                  child: Text(tr.cta_secondary),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
