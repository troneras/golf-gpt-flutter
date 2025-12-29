import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:apparence_kit/core/widgets/shooting_stars.dart';
import 'package:flutter/material.dart';

/// Reusable background widget with golf course image, vignette effect,
/// gradient overlay, and shooting stars animation.
class AppBackground extends StatelessWidget {
  /// The content to display on top of the background
  final Widget child;

  /// Whether to show the shooting stars effect
  final bool showShootingStars;

  /// Height of the shooting stars area
  final double shootingStarsHeight;

  /// Background image asset path
  final String backgroundImage;

  const AppBackground({
    super.key,
    required this.child,
    this.showShootingStars = true,
    this.shootingStarsHeight = 200,
    this.backgroundImage = 'assets/images/background-2.jpg',
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = context.colors.background;

    return Stack(
      children: [
        // Background image - full screen
        Positioned.fill(
          child: Image.asset(
            backgroundImage,
            fit: BoxFit.cover,
          ),
        ),
        // Vignette/inset shadow effect around edges
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
        // Dark gradient overlay from bottom for readability
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
        // Shooting stars in the night sky
        if (showShootingStars)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ShootingStars(
              height: shootingStarsHeight,
              spawnInterval: const Duration(seconds: 3),
              maxStars: 2,
            ),
          ),
        // Main content
        child,
      ],
    );
  }
}
