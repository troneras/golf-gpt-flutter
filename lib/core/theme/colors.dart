import 'package:flutter/material.dart';

/// TalkCaddy Color System
///
/// Design principles:
/// - One accent only (Caddie Green)
/// - High contrast for outdoor readability
/// - No gradients, no playful hues
/// - Color communicates state, not emotion
///
/// Dark mode = equipment (primary, default)
/// Light mode = paperwork (secondary)
class ApparenceKitColors extends ThemeExtension<ApparenceKitColors> {
  // Accent (single, sacred - only for primary CTA, mic affordance, active indicator)
  final Color primary;
  final Color onPrimary;

  // Backgrounds
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color elevated;
  final Color divider;

  // Text hierarchy
  final Color textSecondary;
  final Color textDisabled;
  final Color textInverse;

  // Status colors (muted, professional)
  final Color error;
  final Color warning;
  final Color success;

  // Legacy grey tokens (for backwards compatibility)
  final Color grey1;
  final Color grey2;
  final Color grey3;

  const ApparenceKitColors({
    required this.primary,
    required this.onPrimary,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.elevated,
    required this.divider,
    required this.textSecondary,
    required this.textDisabled,
    required this.textInverse,
    required this.error,
    required this.warning,
    required this.success,
    required this.grey1,
    required this.grey2,
    required this.grey3,
  });

  /// Light mode - clinical and calm (Apple Health, Garmin Connect style)
  factory ApparenceKitColors.light() => const ApparenceKitColors(
        // Accent (darker green for outdoor contrast)
        primary: Color(0xFF128C43),
        onPrimary: Color(0xFFFFFFFF),
        // Backgrounds
        background: Color(0xFFFFFFFF),
        onBackground: Color(0xFF111111),
        surface: Color(0xFFF6F6F6),
        onSurface: Color(0xFF111111),
        elevated: Color(0xFFEEEEEE),
        divider: Color(0xFFDDDDDD),
        // Text
        textSecondary: Color(0xFF555555),
        textDisabled: Color(0xFF9E9E9E),
        textInverse: Color(0xFFFFFFFF),
        // Status (muted, serious)
        error: Color(0xFFB00020),
        warning: Color(0xFFB59F3B),
        success: Color(0xFF128C43),
        // Legacy greys mapped to new system
        grey1: Color(0xFFDDDDDD),
        grey2: Color(0xFF555555),
        grey3: Color(0xFF111111),
      );

  /// Dark mode - main identity (default, equipment mode)
  factory ApparenceKitColors.dark() => const ApparenceKitColors(
        // Accent (Caddie Green)
        primary: Color(0xFF1DB954),
        onPrimary: Color(0xFF0E0E0E),
        // Backgrounds
        background: Color(0xFF0E0E0E),
        onBackground: Color(0xFFFFFFFF),
        surface: Color(0xFF161616),
        onSurface: Color(0xFFFFFFFF),
        elevated: Color(0xFF1E1E1E),
        divider: Color(0xFF242424),
        // Text
        textSecondary: Color(0xFFB3B3B3),
        textDisabled: Color(0xFF6F6F6F),
        textInverse: Color(0xFF0E0E0E),
        // Status (muted, professional)
        error: Color(0xFFCF6679),
        warning: Color(0xFFC9B458),
        success: Color(0xFF1DB954),
        // Legacy greys mapped to new system
        grey1: Color(0xFF242424),
        grey2: Color(0xFFB3B3B3),
        grey3: Color(0xFFFFFFFF),
      );

  @override
  ThemeExtension<ApparenceKitColors> copyWith({
    Color? primary,
    Color? onPrimary,
    Color? background,
    Color? onBackground,
    Color? surface,
    Color? onSurface,
    Color? elevated,
    Color? divider,
    Color? textSecondary,
    Color? textDisabled,
    Color? textInverse,
    Color? error,
    Color? warning,
    Color? success,
    Color? grey1,
    Color? grey2,
    Color? grey3,
  }) {
    return ApparenceKitColors(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
      elevated: elevated ?? this.elevated,
      divider: divider ?? this.divider,
      textSecondary: textSecondary ?? this.textSecondary,
      textDisabled: textDisabled ?? this.textDisabled,
      textInverse: textInverse ?? this.textInverse,
      error: error ?? this.error,
      warning: warning ?? this.warning,
      success: success ?? this.success,
      grey1: grey1 ?? this.grey1,
      grey2: grey2 ?? this.grey2,
      grey3: grey3 ?? this.grey3,
    );
  }

  @override
  ThemeExtension<ApparenceKitColors> lerp(
    covariant ThemeExtension<ApparenceKitColors>? other,
    double t,
  ) {
    if (other == null || other is! ApparenceKitColors) return this;

    return ApparenceKitColors(
      primary: Color.lerp(primary, other.primary, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      background: Color.lerp(background, other.background, t)!,
      onBackground: Color.lerp(onBackground, other.onBackground, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      elevated: Color.lerp(elevated, other.elevated, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textDisabled: Color.lerp(textDisabled, other.textDisabled, t)!,
      textInverse: Color.lerp(textInverse, other.textInverse, t)!,
      error: Color.lerp(error, other.error, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      success: Color.lerp(success, other.success, t)!,
      grey1: Color.lerp(grey1, other.grey1, t)!,
      grey2: Color.lerp(grey2, other.grey2, t)!,
      grey3: Color.lerp(grey3, other.grey3, t)!,
    );
  }
}
