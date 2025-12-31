import 'package:apparence_kit/core/data/api/analytics_api.dart';
import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/core/widgets/glow_button.dart';
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

    final backgroundColor = colors.background;

    return Stack(
      fit: StackFit.expand,
      children: [
        // Full-screen starry background
        Positioned.fill(
          child: Image.asset(
            'assets/images/onboarding/bg1.jpg',
            fit: BoxFit.cover,
          ),
        ),
        // Blue stellar tint overlay
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: const Color(0xFF2C2C2C).withValues(alpha: 0.4),
            ),
          ),
        ),
        // Vignette effect (same as login)
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                radius: 1.0,
                colors: [
                  Colors.transparent,
                  Colors.transparent,
                  Colors.black.withValues(alpha: 0.25),
                  Colors.black.withValues(alpha: 0.45),
                ],
                stops: const [0.0, 0.45, 0.75, 1.0],
              ),
            ),
          ),
        ),
        // Dark gradient overlay from bottom (same as login)
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.0, 0.3, 0.6, 1.0],
                colors: [
                  backgroundColor.withValues(alpha: 0.3),
                  backgroundColor.withValues(alpha: 0.1),
                  backgroundColor.withValues(alpha: 0.6),
                  backgroundColor.withValues(alpha: 0.95),
                ],
              ),
            ),
          ),
        ),
        // Content
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                const Spacer(flex: 2),
                // App name - prominent with glow
                Animate(
                  effects: const [
                    FadeEffect(
                      delay: Duration(milliseconds: 200),
                      duration: Duration(milliseconds: 400),
                    ),
                  ],
                  child: Text(
                    tr.app_name,
                    textAlign: TextAlign.center,
                    style: context.textTheme.displayLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: colors.onBackground,
                      letterSpacing: 2.0,
                      fontSize: 42,
                      shadows: [
                        Shadow(
                          color: colors.primary.withValues(alpha: 0.5),
                          blurRadius: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                // Tagline
                Animate(
                  effects: const [
                    FadeEffect(
                      delay: Duration(milliseconds: 300),
                      duration: Duration(milliseconds: 400),
                    ),
                  ],
                  child: Text(
                    tr.tagline,
                    textAlign: TextAlign.center,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: colors.textTertiary,
                    ),
                  ),
                ),
                const Spacer(flex: 2),
                // Main headline
                Animate(
                  effects: const [
                    FadeEffect(
                      delay: Duration(milliseconds: 400),
                      duration: Duration(milliseconds: 400),
                    ),
                    MoveEffect(
                      delay: Duration(milliseconds: 400),
                      duration: Duration(milliseconds: 500),
                      begin: Offset(0, 30),
                      end: Offset.zero,
                    ),
                  ],
                  child: Text(
                    tr.headline,
                    textAlign: TextAlign.center,
                    style: context.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: colors.onBackground,
                      height: 1.3,
                    ),
                  ),
                ),
                const Spacer(flex: 3),
                // Features row
                Animate(
                  effects: const [
                    FadeEffect(
                      delay: Duration(milliseconds: 600),
                      duration: Duration(milliseconds: 400),
                    ),
                  ],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        tr.feature_1,
                        style: context.textTheme.bodySmall?.copyWith(
                          color: colors.textTertiary,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          '·',
                          style: context.textTheme.bodySmall?.copyWith(
                            color: colors.textTertiary,
                          ),
                        ),
                      ),
                      Text(
                        tr.feature_2,
                        style: context.textTheme.bodySmall?.copyWith(
                          color: colors.textTertiary,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          '·',
                          style: context.textTheme.bodySmall?.copyWith(
                            color: colors.textTertiary,
                          ),
                        ),
                      ),
                      Text(
                        tr.feature_3,
                        style: context.textTheme.bodySmall?.copyWith(
                          color: colors.textTertiary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                // CTA Button with glow (same as login)
                Animate(
                  effects: const [
                    FadeEffect(
                      delay: Duration(milliseconds: 700),
                      duration: Duration(milliseconds: 400),
                    ),
                  ],
                  child: GlowButton(
                    text: tr.action,
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed(widget.nextRoute);
                    },
                  ),
                ),
                const SizedBox(height: 48),
              ],
            ),
          ),
        ),
      ],
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

    final backgroundColor = colors.background;

    return Stack(
      fit: StackFit.expand,
      children: [
        // Full-screen milky way background
        Positioned.fill(
          child: Image.asset(
            'assets/images/onboarding/bg2.jpg',
            fit: BoxFit.cover,
          ),
        ),
        // Blue stellar tint overlay
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: const Color(0xFF2C2C2C).withValues(alpha: 0.4),
            ),
          ),
        ),
        // Vignette effect (same as login)
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                radius: 1.0,
                colors: [
                  Colors.transparent,
                  Colors.transparent,
                  Colors.black.withValues(alpha: 0.25),
                  Colors.black.withValues(alpha: 0.45),
                ],
                stops: const [0.0, 0.45, 0.75, 1.0],
              ),
            ),
          ),
        ),
        // Dark gradient overlay from bottom (same as login)
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.0, 0.3, 0.6, 1.0],
                colors: [
                  backgroundColor.withValues(alpha: 0.3),
                  backgroundColor.withValues(alpha: 0.1),
                  backgroundColor.withValues(alpha: 0.6),
                  backgroundColor.withValues(alpha: 0.95),
                ],
              ),
            ),
          ),
        ),
        // Content
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 48),
                // Headline
                Animate(
                  effects: const [
                    FadeEffect(
                      delay: Duration(milliseconds: 200),
                      duration: Duration(milliseconds: 400),
                    ),
                  ],
                  child: Text(
                    tr.headline,
                    textAlign: TextAlign.center,
                    style: context.textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: colors.onBackground,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                // Subtitle
                Animate(
                  effects: const [
                    FadeEffect(
                      delay: Duration(milliseconds: 300),
                      duration: Duration(milliseconds: 400),
                    ),
                  ],
                  child: Text(
                    tr.subtitle,
                    textAlign: TextAlign.center,
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: colors.textSecondary,
                    ),
                  ),
                ),
                const SizedBox(height: 48),
                // Feature cards
                Animate(
                  effects: const [
                    FadeEffect(
                      delay: Duration(milliseconds: 400),
                      duration: Duration(milliseconds: 400),
                    ),
                    MoveEffect(
                      delay: Duration(milliseconds: 400),
                      duration: Duration(milliseconds: 500),
                      begin: Offset(0, 30),
                      end: Offset.zero,
                    ),
                  ],
                  child: _FeatureCard(
                    iconPath: 'assets/images/onboarding/ic_gps.png',
                    title: tr.feature_1_title,
                    description: tr.feature_1_desc,
                  ),
                ),
                const SizedBox(height: 12),
                Animate(
                  effects: const [
                    FadeEffect(
                      delay: Duration(milliseconds: 500),
                      duration: Duration(milliseconds: 400),
                    ),
                    MoveEffect(
                      delay: Duration(milliseconds: 500),
                      duration: Duration(milliseconds: 500),
                      begin: Offset(0, 30),
                      end: Offset.zero,
                    ),
                  ],
                  child: _FeatureCard(
                    iconPath: 'assets/images/onboarding/ic_mic.png',
                    title: tr.feature_2_title,
                    description: tr.feature_2_desc,
                  ),
                ),
                const SizedBox(height: 12),
                Animate(
                  effects: const [
                    FadeEffect(
                      delay: Duration(milliseconds: 600),
                      duration: Duration(milliseconds: 400),
                    ),
                    MoveEffect(
                      delay: Duration(milliseconds: 600),
                      duration: Duration(milliseconds: 500),
                      begin: Offset(0, 30),
                      end: Offset.zero,
                    ),
                  ],
                  child: _FeatureCard(
                    iconPath: 'assets/images/onboarding/ic_sync.png',
                    title: tr.feature_3_title,
                    description: tr.feature_3_desc,
                  ),
                ),
                const Spacer(),
                // CTA Button with glow (same as login)
                Animate(
                  effects: const [
                    FadeEffect(
                      delay: Duration(milliseconds: 700),
                      duration: Duration(milliseconds: 400),
                    ),
                  ],
                  child: GlowButton(
                    text: tr.action,
                    onPressed: _completeOnboarding,
                  ),
                ),
                const SizedBox(height: 48),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// Glass feature card for onboarding
class _FeatureCard extends StatelessWidget {
  final String iconPath;
  final String title;
  final String description;

  const _FeatureCard({
    required this.iconPath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        // Glass background
        color: colors.glassBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colors.glassBorder,
        ),
      ),
      child: Row(
        children: [
          // Icon with deep blue glow
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF2C2C2C).withValues(alpha: 0.8),
                  blurRadius: 16,
                  spreadRadius: 2,
                ),
                BoxShadow(
                  color: colors.primary.withValues(alpha: 0.3),
                  blurRadius: 12,
                ),
              ],
            ),
            child: Image.asset(
              iconPath,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 16),
          // Text content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colors.onBackground,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: colors.textTertiary,
                  ),
                ),
              ],
            ),
          ),
        ],
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
      bgImagePath: 'assets/images/onboarding/bg2.jpg',
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
                child: GlowButton(
                  text: tr.action,
                  onPressed: () => _requestPermission(context),
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
