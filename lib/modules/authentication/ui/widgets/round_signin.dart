import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef SocialSigninCallback = void Function();

class SocialSigninButton extends StatelessWidget {
  final Image iconImage;
  final SocialSigninCallback? onPressed;
  final String? label;

  const SocialSigninButton({
    super.key,
    required this.iconImage,
    required this.onPressed,
    this.label,
  });

  factory SocialSigninButton.google(SocialSigninCallback onPressed) {
    return SocialSigninButton(
      iconImage: Image.asset("assets/icons/google.png", width: 24),
      onPressed: onPressed,
    );
  }

  factory SocialSigninButton.googleWithText(
    SocialSigninCallback onPressed, {
    required String label,
  }) {
    return SocialSigninButton(
      iconImage: Image.asset("assets/icons/google.png", width: 24),
      onPressed: onPressed,
      label: label,
    );
  }

  factory SocialSigninButton.googlePlayGames(SocialSigninCallback onPressed) {
    return SocialSigninButton(
      iconImage: Image.asset("assets/icons/google_play_games.png", width: 24),
      onPressed: onPressed,
    );
  }

  factory SocialSigninButton.facebook(SocialSigninCallback onPressed) {
    return SocialSigninButton(
      iconImage: Image.asset("assets/icons/facebook.png", width: 24),
      onPressed: onPressed,
    );
  }

  factory SocialSigninButton.apple(SocialSigninCallback onPressed) {
    return SocialSigninButton(
      iconImage: Image.asset("assets/icons/apple.png", width: 24),
      onPressed: onPressed,
    );
  }

  factory SocialSigninButton.twitter(SocialSigninCallback onPressed) {
    return SocialSigninButton(
      iconImage: Image.asset("assets/icons/twitter.png", width: 24),
      onPressed: onPressed,
    );
  }

  factory SocialSigninButton.microsoft(SocialSigninCallback onPressed) {
    return SocialSigninButton(
      iconImage: Image.asset("assets/icons/microsoft.png", width: 24),
      onPressed: onPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    if (label != null) {
      return _GlassSocialButton(
        iconImage: iconImage,
        label: label!,
        onPressed: onPressed,
      );
    }
    return Container(
      width: 56,
      decoration: BoxDecoration(
        color: colors.glassBg,
        border: Border.all(color: colors.glassBorder),
        shape: BoxShape.circle,
      ),
      child: RawMaterialButton(
        elevation: 0,
        onPressed: () {
          HapticFeedback.mediumImpact();
          onPressed?.call();
        },
        shape: const CircleBorder(),
        fillColor: Colors.transparent,
        padding: const EdgeInsets.all(16),
        child: iconImage,
      ),
    );
  }
}

/// Transparent social sign-in button
class _GlassSocialButton extends StatelessWidget {
  final Image iconImage;
  final String label;
  final SocialSigninCallback? onPressed;

  const _GlassSocialButton({
    required this.iconImage,
    required this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.2),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            HapticFeedback.mediumImpact();
            onPressed?.call();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              iconImage,
              const SizedBox(width: 12),
              Text(
                label,
                style: context.textTheme.titleMedium?.copyWith(
                  color: colors.onBackground,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
