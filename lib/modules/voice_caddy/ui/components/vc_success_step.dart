import 'package:apparence_kit/core/data/api/analytics_api.dart';
import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/i18n/translations.g.dart';
import 'package:apparence_kit/modules/onboarding/ui/widgets/onboarding_background.dart';
import 'package:apparence_kit/modules/voice_caddy/providers/voice_caddy_provider.dart';
import 'package:apparence_kit/modules/voice_caddy/ui/widgets/vc_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Screen 4: Success - Connection complete
class VcSuccessStep extends ConsumerWidget {
  final VoidCallback onContinue;

  const VcSuccessStep({
    super.key,
    required this.onContinue,
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
                  size: 100,
                  color: context.colors.primary,
                ),
              ),
            ),
            const SizedBox(height: 32),
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
                    fontWeight: FontWeight.w600,
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
                    delay: Duration(milliseconds: 400),
                    duration: Duration(milliseconds: 200),
                  ),
                ],
                child: ElevatedButton(
                  onPressed: onContinue,
                  child: Text(tr.cta),
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
