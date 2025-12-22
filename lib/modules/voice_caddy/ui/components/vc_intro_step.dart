import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/i18n/translations.g.dart';
import 'package:apparence_kit/modules/onboarding/ui/widgets/onboarding_background.dart';
import 'package:apparence_kit/modules/voice_caddy/ui/widgets/vc_bullet_point.dart';
import 'package:apparence_kit/modules/voice_caddy/ui/widgets/vc_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// Screen 1: Introduction - Voice Caddy overview
class VcIntroStep extends StatelessWidget {
  final String nextRoute;
  final bool allowSkip;
  final VoidCallback? onSkip;

  const VcIntroStep({
    super.key,
    required this.nextRoute,
    this.allowSkip = true,
    this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    final tr = Translations.of(context).voice_caddy.intro;
    return OnboardingBackground(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const VcProgress(value: 0.17),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Animate(
                effects: const [
                  FadeEffect(
                    delay: Duration(milliseconds: 200),
                    duration: Duration(milliseconds: 200),
                  ),
                  MoveEffect(
                    delay: Duration(milliseconds: 200),
                    duration: Duration(milliseconds: 450),
                    begin: Offset(0, 50),
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
            const SizedBox(height: 16),
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
                    begin: Offset(0, 50),
                    end: Offset.zero,
                  ),
                ],
                child: Text(
                  tr.subtitle,
                  textAlign: TextAlign.center,
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: context.colors.onBackground.withOpacity(0.7),
                    height: 1.5,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Animate(
                effects: const [
                  FadeEffect(
                    delay: Duration(milliseconds: 350),
                    duration: Duration(milliseconds: 200),
                  ),
                  MoveEffect(
                    delay: Duration(milliseconds: 350),
                    duration: Duration(milliseconds: 450),
                    begin: Offset(0, 50),
                    end: Offset.zero,
                  ),
                ],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VcBulletPoint(
                      icon: Icons.mic,
                      text: tr.bullet_1,
                    ),
                    const SizedBox(height: 20),
                    VcBulletPoint(
                      icon: Icons.touch_app_outlined,
                      text: tr.bullet_2,
                    ),
                    const SizedBox(height: 20),
                    VcBulletPoint(
                      icon: Icons.sports_golf,
                      text: tr.bullet_3,
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Animate(
                effects: const [
                  FadeEffect(
                    delay: Duration(milliseconds: 100),
                    duration: Duration(milliseconds: 200),
                  ),
                ],
                child: Icon(
                  Icons.headphones,
                  size: 120,
                  color: context.colors.primary.withOpacity(0.3),
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
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(nextRoute);
                  },
                  child: Text(tr.cta),
                ),
              ),
            ),
            if (allowSkip) ...[
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Animate(
                  effects: const [
                    FadeEffect(
                      delay: Duration(milliseconds: 450),
                      duration: Duration(milliseconds: 200),
                    ),
                  ],
                  child: TextButton(
                    onPressed: onSkip,
                    child: Text(tr.skip),
                  ),
                ),
              ),
            ],
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
