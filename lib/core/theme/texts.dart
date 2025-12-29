import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Typography configuration following Material + iOS guidelines
/// Font: Inter (Android/Web) / SF Pro (iOS - system default)
/// Weights: Regular (400), Medium (500), Semibold (600)
/// No italic, no decorative fonts
class ApparenceKitTextTheme extends ThemeExtension<ApparenceKitTextTheme> {
  final TextStyle primary;

  const ApparenceKitTextTheme({
    required this.primary,
  });

  /// Get the base text style with Inter font (or system font on iOS)
  static TextStyle _baseTextStyle() {
    // On iOS, use system font (SF Pro) for native feel
    // On other platforms, use Inter
    if (Platform.isIOS) {
      return const TextStyle(
        fontFamily: '.SF Pro Text',
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Color(0xFF000000),
      );
    }
    return GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF000000),
    );
  }

  factory ApparenceKitTextTheme.build() => ApparenceKitTextTheme(
        primary: _baseTextStyle(),
      );

  @override
  ThemeExtension<ApparenceKitTextTheme> copyWith({
    TextStyle? primary,
  }) {
    return ApparenceKitTextTheme(
      primary: primary ?? this.primary,
    );
  }

  @override
  ThemeExtension<ApparenceKitTextTheme> lerp(
    covariant ThemeExtension<ApparenceKitTextTheme>? other,
    double t,
  ) {
    if (other is! ApparenceKitTextTheme) {
      return this;
    }
    return ApparenceKitTextTheme(
      primary: TextStyle.lerp(primary, other.primary, t)!,
    );
  }
}
