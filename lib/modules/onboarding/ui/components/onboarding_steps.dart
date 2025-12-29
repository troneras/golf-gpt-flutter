import 'package:apparence_kit/core/data/api/analytics_api.dart';
import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/i18n/translations.g.dart';
import 'package:apparence_kit/modules/onboarding/ui/widgets/onboarding_background.dart';
import 'package:apparence_kit/modules/onboarding/ui/widgets/onboarding_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

/// Screen 1: Welcome - Voice Caddie intro
class OnboardingWelcomeStep extends ConsumerStatefulWidget {
  final String nextRoute;

  const OnboardingWelcomeStep({
    super.key,
    required this.nextRoute,
  });

  @override
  ConsumerState<OnboardingWelcomeStep> createState() =>
      _OnboardingWelcomeStepState();
}

class _OnboardingWelcomeStepState extends ConsumerState<OnboardingWelcomeStep> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final analytics = ref.read(analyticsApiProvider);
      analytics.logEvent('onboarding_started', {});
      analytics.logEvent('onboarding_screen_viewed', {
        'screen_name': 'welcome',
        'screen_index': 0,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final tr = Translations.of(context).onboarding.welcome;
    final colors = context.colors;

    return OnboardingBackground(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const OnboardingProgress(value: 0.5),
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
                    fontWeight: FontWeight.w600,
                    color: colors.onBackground,
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
                    color: colors.textSecondary,
                    height: 1.5,
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
                    delay: Duration(milliseconds: 400),
                    duration: Duration(milliseconds: 200),
                  ),
                  MoveEffect(
                    delay: Duration(milliseconds: 400),
                    duration: Duration(milliseconds: 450),
                    begin: Offset(0, 50),
                    end: Offset.zero,
                  ),
                ],
                child: Text(
                  tr.chatgpt_info,
                  textAlign: TextAlign.center,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: colors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Expanded(
              child: Animate(
                effects: const [
                  FadeEffect(
                    delay: Duration(milliseconds: 100),
                    duration: Duration(milliseconds: 200),
                  ),
                  MoveEffect(
                    delay: Duration(milliseconds: 100),
                    duration: Duration(milliseconds: 450),
                    begin: Offset(0, 50),
                    end: Offset.zero,
                  ),
                ],
                child: Image.asset(
                  'assets/images/onboarding/ilustracion-golfista-caminando.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Animate(
                effects: const [
                  FadeEffect(
                    delay: Duration(milliseconds: 450),
                    duration: Duration(milliseconds: 200),
                  ),
                ],
                child: Text(
                  tr.setup_time,
                  textAlign: TextAlign.center,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: colors.textTertiary,
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
                    delay: Duration(milliseconds: 500),
                    duration: Duration(milliseconds: 200),
                  ),
                ],
                child: _OnboardingCTAButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(widget.nextRoute);
                  },
                  text: tr.action,
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

/// Screen 2: App Purpose - What the app does
class OnboardingAppPurposeStep extends ConsumerStatefulWidget {
  final String nextRoute;

  const OnboardingAppPurposeStep({
    super.key,
    required this.nextRoute,
  });

  @override
  ConsumerState<OnboardingAppPurposeStep> createState() =>
      _OnboardingAppPurposeStepState();
}

class _OnboardingAppPurposeStepState
    extends ConsumerState<OnboardingAppPurposeStep> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(analyticsApiProvider).logEvent('onboarding_screen_viewed', {
        'screen_name': 'app_purpose',
        'screen_index': 1,
      });
    });
  }

  void _completeOnboarding() {
    final analytics = ref.read(analyticsApiProvider);
    analytics.logEvent('onboarding_completed', {});
    analytics.setUserProperties({'onboarded': true});
    Navigator.of(context).pushReplacementNamed(widget.nextRoute);
  }

  @override
  Widget build(BuildContext context) {
    final tr = Translations.of(context).onboarding.app_purpose;
    final colors = context.colors;

    return OnboardingBackground(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const OnboardingProgress(value: 1.0),
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
                    fontWeight: FontWeight.w600,
                    color: colors.onBackground,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _BulletPoint(icon: Icons.location_on, text: tr.bullet_1),
                    const SizedBox(height: 20),
                    _BulletPoint(icon: Icons.straighten, text: tr.bullet_2),
                    const SizedBox(height: 20),
                    _BulletPoint(icon: Icons.psychology, text: tr.bullet_3),
                  ],
                ),
              ),
            ),
            const Spacer(),
            // Key messages card with Level 3 Showcase Glass
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Animate(
                effects: const [
                  FadeEffect(
                    delay: Duration(milliseconds: 400),
                    duration: Duration(milliseconds: 200),
                  ),
                ],
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF141A24).withValues(alpha: 0.90),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.08),
                    ),
                  ),
                  child: Stack(
                    children: [
                      // Inset shadow overlay for glass depth
                      Positioned.fill(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.black.withValues(alpha: 0.2),
                                Colors.black.withValues(alpha: 0.05),
                                Colors.transparent,
                              ],
                              stops: const [0.0, 0.3, 0.6],
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _KeyMessageItem(text: tr.key_message_1),
                          const SizedBox(height: 12),
                          _KeyMessageItem(text: tr.key_message_2, isHighlighted: true),
                          const SizedBox(height: 12),
                          _KeyMessageItem(text: tr.key_message_3),
                        ],
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
                child: _OnboardingCTAButton(
                  onPressed: _completeOnboarding,
                  text: tr.action,
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

/// Screen 3: Location Permission (kept for reuse in home page)
class OnboardingLocationPermissionStep extends ConsumerStatefulWidget {
  final String nextRoute;

  const OnboardingLocationPermissionStep({
    super.key,
    required this.nextRoute,
  });

  @override
  ConsumerState<OnboardingLocationPermissionStep> createState() =>
      _OnboardingLocationPermissionStepState();
}

class _OnboardingLocationPermissionStepState
    extends ConsumerState<OnboardingLocationPermissionStep> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(analyticsApiProvider).logEvent('onboarding_screen_viewed', {
        'screen_name': 'location_permission',
        'screen_index': 2,
      });
    });
  }

  Future<void> _requestPermission(BuildContext context) async {
    final analytics = ref.read(analyticsApiProvider);
    await analytics.logEvent('permission_requested', {
      'permission_type': 'location',
    });

    final status = await Permission.locationWhenInUse.request();

    if (status.isGranted) {
      // Check if precise location is granted
      final preciseStatus = await Permission.locationWhenInUse.serviceStatus;
      await analytics.logEvent('permission_granted', {
        'permission_type': 'location',
        'precision': preciseStatus == ServiceStatus.enabled ? 'precise' : 'approximate',
      });
    } else if (status.isDenied || status.isPermanentlyDenied) {
      await analytics.logEvent('permission_denied', {
        'permission_type': 'location',
      });
    }

    await analytics.logEvent('onboarding_completed', {});
    await analytics.setUserProperties({'onboarded': true});

    if (context.mounted) {
      Navigator.of(context).pushReplacementNamed(widget.nextRoute);
    }
  }

  void _skipPermission() {
    final analytics = ref.read(analyticsApiProvider);
    analytics.logEvent('onboarding_skipped', {
      'screen_name': 'location_permission',
    });
    analytics.logEvent('permission_denied', {
      'permission_type': 'location',
    });
    analytics.logEvent('onboarding_completed', {});
    analytics.setUserProperties({'onboarded': true});
    Navigator.of(context).pushReplacementNamed(widget.nextRoute);
  }

  @override
  Widget build(BuildContext context) {
    final tr = Translations.of(context).onboarding.location_permission;
    final colors = context.colors;

    return OnboardingBackground(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const OnboardingProgress(value: 1.0),
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
                    fontWeight: FontWeight.w600,
                    color: colors.onBackground,
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
                ],
                child: Text(
                  tr.description,
                  textAlign: TextAlign.center,
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: colors.textSecondary,
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
                    delay: Duration(milliseconds: 350),
                    duration: Duration(milliseconds: 200),
                  ),
                ],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _BulletPoint(icon: Icons.golf_course, text: tr.bullet_1),
                    const SizedBox(height: 16),
                    _BulletPoint(icon: Icons.straighten, text: tr.bullet_2),
                    const SizedBox(height: 16),
                    _BulletPoint(icon: Icons.sports_golf, text: tr.bullet_3),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            Expanded(
              child: Animate(
                effects: const [
                  FadeEffect(
                    delay: Duration(milliseconds: 100),
                    duration: Duration(milliseconds: 200),
                  ),
                ],
                child: Image.asset(
                  'assets/images/onboarding/ilustracion-golf-gps.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Animate(
                effects: const [
                  FadeEffect(
                    delay: Duration(milliseconds: 400),
                    duration: Duration(milliseconds: 200),
                  ),
                ],
                child: Text(
                  tr.reassurance,
                  textAlign: TextAlign.center,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: colors.textTertiary,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Animate(
                effects: const [
                  FadeEffect(
                    delay: Duration(milliseconds: 500),
                    duration: Duration(milliseconds: 200),
                  ),
                ],
                child: _OnboardingCTAButton(
                  onPressed: () => _requestPermission(context),
                  text: tr.action,
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
                child: _OnboardingGhostButton(
                  onPressed: _skipPermission,
                  text: tr.skip,
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

/// Bullet point widget for onboarding screens (dark theme).
class _BulletPoint extends StatelessWidget {
  final IconData icon;
  final String text;

  const _BulletPoint({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Row(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: colors.primary.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            size: 24,
            color: colors.primary,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            text,
            style: context.textTheme.bodyLarge?.copyWith(
              color: colors.onBackground,
              height: 1.3,
            ),
          ),
        ),
      ],
    );
  }
}

/// Key message item for onboarding glass card.
class _KeyMessageItem extends StatelessWidget {
  final String text;
  final bool isHighlighted;

  const _KeyMessageItem({
    required this.text,
    this.isHighlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 6,
          height: 6,
          margin: const EdgeInsets.only(top: 7),
          decoration: BoxDecoration(
            color: colors.primary,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: colors.primary.withValues(alpha: 0.4),
                blurRadius: 4,
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: isHighlighted ? FontWeight.w600 : FontWeight.normal,
              color: isHighlighted ? colors.primary : colors.textSecondary,
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}

/// Primary CTA button following design system.
/// Uses gradient background with glow effect.
class _OnboardingCTAButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const _OnboardingCTAButton({
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 52,
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
        child: Center(
          child: Text(
            text,
            style: context.textTheme.titleMedium?.copyWith(
              color: colors.onPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

/// Ghost/secondary button following design system.
class _OnboardingGhostButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const _OnboardingGhostButton({
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 44,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.15),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: context.textTheme.bodyLarge?.copyWith(
              color: colors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }
}
