import 'package:apparence_kit/core/data/api/analytics_api.dart';
import 'package:apparence_kit/i18n/translations.g.dart';
import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
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
    return OnboardingBackground(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            OnboardingProgress(value: 0.5),
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
                    color: context.colors.primary,
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
                    color: context.colors.onBackground.withOpacity(0.5),
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
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(widget.nextRoute);
                  },
                  child: Text(tr.action),
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
    return OnboardingBackground(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            OnboardingProgress(value: 1.0),
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
                    color: context.colors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _KeyMessageItem(text: tr.key_message_1),
                      const SizedBox(height: 12),
                      _KeyMessageItem(text: tr.key_message_2, isHighlighted: true),
                      const SizedBox(height: 12),
                      _KeyMessageItem(text: tr.key_message_3),
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
                  onPressed: _completeOnboarding,
                  child: Text(tr.action),
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
    return OnboardingBackground(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            OnboardingProgress(value: 1.0),
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
                ],
                child: Text(
                  tr.description,
                  textAlign: TextAlign.center,
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: context.colors.onBackground.withOpacity(0.7),
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
                    color: context.colors.onBackground.withOpacity(0.5),
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
                child: ElevatedButton(
                  onPressed: () => _requestPermission(context),
                  child: Text(tr.action),
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
                  onPressed: _skipPermission,
                  child: Text(tr.skip),
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

class _BulletPoint extends StatelessWidget {
  final IconData icon;
  final String text;

  const _BulletPoint({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 28,
          color: context.colors.primary,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            text,
            style: context.textTheme.bodyLarge?.copyWith(
              height: 1.3,
            ),
          ),
        ),
      ],
    );
  }
}

class _KeyMessageItem extends StatelessWidget {
  final String text;
  final bool isHighlighted;

  const _KeyMessageItem({
    required this.text,
    this.isHighlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 6,
          height: 6,
          margin: const EdgeInsets.only(top: 7),
          decoration: BoxDecoration(
            color: context.colors.primary,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: isHighlighted ? FontWeight.w600 : FontWeight.normal,
              color: context.colors.primary,
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}
