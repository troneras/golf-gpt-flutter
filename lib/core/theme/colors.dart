import 'package:flutter/material.dart';

/// TalkCaddy Color System
///
/// Design principles:
/// - Dark mode by default (premium, focus, battery-friendly)
/// - Cool blue-tinted blacks (never pure black)
/// - Contained golf green (not saturated)
/// - Blue as AI/action accent
/// - Never pure white in dark mode
///
/// Visual philosophy:
/// - The button calls attention
/// - Everything else accompanies
/// - The background wraps
class ApparenceKitColors extends ThemeExtension<ApparenceKitColors> {
  // Primary accent (AI blue - for actions)
  final Color primary;
  final Color onPrimary;

  // Secondary accent (Golf green - for success/brand)
  final Color accent;
  final Color accentSoft;

  // Backgrounds (cool blue-tinted in dark mode)
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color elevated;

  // Glass effect (for cards/overlays)
  final Color glassBg;
  final Color glassBorder;

  // Text hierarchy (never pure white in dark mode)
  final Color textSecondary;
  final Color textTertiary;
  final Color textDisabled;

  // Status colors
  final Color error;
  final Color warning;
  final Color success;

  // CTA gradient colors
  final Color ctaGradientStart;
  final Color ctaGradientEnd;
  final Color ctaGlow;

  // Legacy tokens (for backwards compatibility)
  final Color divider;
  final Color textInverse;
  final Color grey1;
  final Color grey2;
  final Color grey3;

  const ApparenceKitColors({
    required this.primary,
    required this.onPrimary,
    required this.accent,
    required this.accentSoft,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.elevated,
    required this.glassBg,
    required this.glassBorder,
    required this.textSecondary,
    required this.textTertiary,
    required this.textDisabled,
    required this.error,
    required this.warning,
    required this.success,
    required this.ctaGradientStart,
    required this.ctaGradientEnd,
    required this.ctaGlow,
    required this.divider,
    required this.textInverse,
    required this.grey1,
    required this.grey2,
    required this.grey3,
  });

  /// Light mode - elegant, secondary
  factory ApparenceKitColors.light() => const ApparenceKitColors(
        // Accents
        primary: Color(0xFF2563EB),       // AI blue
        onPrimary: Color(0xFFFFFFFF),
        accent: Color(0xFF3DAF7E),         // Golf green
        accentSoft: Color(0xFF2E8B65),
        // Backgrounds
        background: Color(0xFFF7F9FC),
        onBackground: Color(0xFF0F172A),
        surface: Color(0xFFFFFFFF),
        onSurface: Color(0xFF0F172A),
        elevated: Color(0xFFEEF2F8),
        // Glass effect
        glassBg: Color(0x0F000000),        // 6% black
        glassBorder: Color(0x1F000000),    // 12% black
        // Text hierarchy
        textSecondary: Color(0xFF334155),
        textTertiary: Color(0xFF64748B),
        textDisabled: Color(0xFF94A3B8),
        // Status
        error: Color(0xFFDC2626),
        warning: Color(0xFFD97706),
        success: Color(0xFF3DAF7E),
        // CTA gradient (less glow in light mode)
        ctaGradientStart: Color(0xFF2563EB),
        ctaGradientEnd: Color(0xFF3DAF7E),
        ctaGlow: Color(0x4D2563EB),        // 30% blue
        // Legacy
        divider: Color(0xFFE2E8F0),
        textInverse: Color(0xFFFFFFFF),
        grey1: Color(0xFFE2E8F0),
        grey2: Color(0xFF64748B),
        grey3: Color(0xFF0F172A),
      );

  /// Dark mode - main identity (premium, AI-first)
  factory ApparenceKitColors.dark() => const ApparenceKitColors(
        // Accents
        primary: Color(0xFF5AA9FF),        // AI blue
        onPrimary: Color(0xFFFFFFFF),
        accent: Color(0xFF6BCF9B),          // Golf green premium
        accentSoft: Color(0xFF4FAF82),
        // Backgrounds (cool blue-tinted, never pure black)
        background: Color(0xFF0B0F14),
        onBackground: Color(0xFFE6EAF0),   // Never pure white
        surface: Color(0xFF111826),
        onSurface: Color(0xFFE6EAF0),
        elevated: Color(0xFF162033),
        // Glass effect (for frosted cards)
        glassBg: Color(0x0FFFFFFF),        // 6% white
        glassBorder: Color(0x1FFFFFFF),    // 12% white
        // Text hierarchy (elegant, never pure white)
        textSecondary: Color(0xFFB5BCC9),
        textTertiary: Color(0xFF8A93A3),
        textDisabled: Color(0xFF5F6776),
        // Status
        error: Color(0xFFF87171),
        warning: Color(0xFFFBBF24),
        success: Color(0xFF4ADE80),
        // CTA gradient (blue → green with glow)
        ctaGradientStart: Color(0xFF5AA9FF),
        ctaGradientEnd: Color(0xFF6BCF9B),
        ctaGlow: Color(0x735AA9FF),        // 45% blue glow
        // Legacy
        divider: Color(0xFF1E293B),
        textInverse: Color(0xFF0B0F14),
        grey1: Color(0xFF1E293B),
        grey2: Color(0xFFB5BCC9),
        grey3: Color(0xFFE6EAF0),
      );

  @override
  ThemeExtension<ApparenceKitColors> copyWith({
    Color? primary,
    Color? onPrimary,
    Color? accent,
    Color? accentSoft,
    Color? background,
    Color? onBackground,
    Color? surface,
    Color? onSurface,
    Color? elevated,
    Color? glassBg,
    Color? glassBorder,
    Color? textSecondary,
    Color? textTertiary,
    Color? textDisabled,
    Color? error,
    Color? warning,
    Color? success,
    Color? ctaGradientStart,
    Color? ctaGradientEnd,
    Color? ctaGlow,
    Color? divider,
    Color? textInverse,
    Color? grey1,
    Color? grey2,
    Color? grey3,
  }) {
    return ApparenceKitColors(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      accent: accent ?? this.accent,
      accentSoft: accentSoft ?? this.accentSoft,
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
      elevated: elevated ?? this.elevated,
      glassBg: glassBg ?? this.glassBg,
      glassBorder: glassBorder ?? this.glassBorder,
      textSecondary: textSecondary ?? this.textSecondary,
      textTertiary: textTertiary ?? this.textTertiary,
      textDisabled: textDisabled ?? this.textDisabled,
      error: error ?? this.error,
      warning: warning ?? this.warning,
      success: success ?? this.success,
      ctaGradientStart: ctaGradientStart ?? this.ctaGradientStart,
      ctaGradientEnd: ctaGradientEnd ?? this.ctaGradientEnd,
      ctaGlow: ctaGlow ?? this.ctaGlow,
      divider: divider ?? this.divider,
      textInverse: textInverse ?? this.textInverse,
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
      accent: Color.lerp(accent, other.accent, t)!,
      accentSoft: Color.lerp(accentSoft, other.accentSoft, t)!,
      background: Color.lerp(background, other.background, t)!,
      onBackground: Color.lerp(onBackground, other.onBackground, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      elevated: Color.lerp(elevated, other.elevated, t)!,
      glassBg: Color.lerp(glassBg, other.glassBg, t)!,
      glassBorder: Color.lerp(glassBorder, other.glassBorder, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textTertiary: Color.lerp(textTertiary, other.textTertiary, t)!,
      textDisabled: Color.lerp(textDisabled, other.textDisabled, t)!,
      error: Color.lerp(error, other.error, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      success: Color.lerp(success, other.success, t)!,
      ctaGradientStart: Color.lerp(ctaGradientStart, other.ctaGradientStart, t)!,
      ctaGradientEnd: Color.lerp(ctaGradientEnd, other.ctaGradientEnd, t)!,
      ctaGlow: Color.lerp(ctaGlow, other.ctaGlow, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
      textInverse: Color.lerp(textInverse, other.textInverse, t)!,
      grey1: Color.lerp(grey1, other.grey1, t)!,
      grey2: Color.lerp(grey2, other.grey2, t)!,
      grey3: Color.lerp(grey3, other.grey3, t)!,
    );
  }

  /// Helper to get CTA gradient
  LinearGradient get ctaGradient => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [ctaGradientStart, ctaGradientEnd],
      );

  /// Helper for glass decoration
  BoxDecoration get glassDecoration => BoxDecoration(
        color: glassBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: glassBorder, width: 1),
      );
}
