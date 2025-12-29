import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

/// Dark-themed onboarding background following the design system.
///
/// Onboarding screens are "Emotional" type = High glass level.
/// Uses dark background with subtle gradient and vignette effect.
class OnboardingBackground extends StatelessWidget {
  final Widget child;
  final String? bgImagePath;
  final double bgImageOpacity;

  const OnboardingBackground({
    super.key,
    required this.child,
    this.bgImagePath,
    this.bgImageOpacity = .2,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        // Base dark background
        Positioned.fill(
          child: ColoredBox(
            color: colors.background,
          ),
        ),
        // Optional background image with low opacity
        if (bgImagePath != null)
          Positioned.fill(
            child: Opacity(
              opacity: bgImageOpacity,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(bgImagePath!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        // Subtle primary color gradient from top
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.center,
                colors: [
                  colors.primary.withValues(alpha: 0.08),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
        // Vignette effect (per design system)
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
        // Content
        Positioned.fill(
          child: child,
        ),
      ],
    );
  }
}
