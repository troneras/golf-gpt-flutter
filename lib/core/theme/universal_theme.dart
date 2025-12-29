import 'package:apparence_kit/core/theme/colors.dart';
import 'package:apparence_kit/core/theme/texts.dart';
import 'package:apparence_kit/core/theme/theme_data/theme_data.dart';
import 'package:apparence_kit/core/theme/theme_data/theme_data_factory.dart';
import 'package:flutter/material.dart';

/// This is a uniform theme
/// But you can use it to create multiple themes for iOS, Android, Web, Desktop...
class UniversalThemeFactory extends ApparenceKitThemeDataFactory {
  const UniversalThemeFactory();

  @override
  ApparenceKitThemeData build({
    required ApparenceKitColors colors,
    required ApparenceKitTextTheme defaultTextStyle,
  }) {
    return ApparenceKitThemeData(
      colors: colors,
      defaultTextTheme: defaultTextStyle,
      materialTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: colors.primary).copyWith(
          surface: colors.surface,
          onSurface: colors.onSurface,
          primary: colors.primary,
          onPrimary: colors.onPrimary,
          error: colors.error,
        ),
        elevatedButtonTheme: elevatedButtonTheme(
          colors: colors,
          textTheme: defaultTextStyle,
        ),
        inputDecorationTheme: inputDecorationTheme(
          colors: colors,
          textTheme: defaultTextStyle,
        ),
        textTheme: textTheme(
          colors: colors,
          defaultTextStyle: defaultTextStyle,
        ),
        navigationRailTheme: navigationRailThemeData(
          colors: colors,
          textTheme: defaultTextStyle,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: colors.surface,
          foregroundColor: colors.onSurface,
          elevation: 0,
        ),
      ),
    );
  }

  NavigationRailThemeData navigationRailThemeData({
    required ApparenceKitColors colors,
    required ApparenceKitTextTheme textTheme,
  }) =>
      NavigationRailThemeData(
        backgroundColor: colors.surface,
        elevation: 0,
        selectedIconTheme: IconThemeData(
          color: colors.primary,
        ),
        unselectedIconTheme: IconThemeData(
          color: colors.grey2,
        ),
        selectedLabelTextStyle: textTheme.primary.copyWith(
          color: colors.primary,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelTextStyle: textTheme.primary.copyWith(
          color: colors.onSurface,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      );

  ElevatedButtonThemeData elevatedButtonTheme({
    required ApparenceKitColors colors,
    required ApparenceKitTextTheme textTheme,
  }) =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(200, 48),
          foregroundColor: colors.onPrimary,
          backgroundColor: colors.primary,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 2,
              color: colors.primary.withValues(alpha:.8),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          // Primary action: 18px, Semibold (600)
          textStyle: textTheme.primary.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: colors.onPrimary,
          ),
          elevation: 0,
        ),
      );

  InputDecorationTheme inputDecorationTheme({
    required ApparenceKitColors colors,
    required ApparenceKitTextTheme textTheme,
  }) =>
      InputDecorationTheme(
        fillColor: colors.surface,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: colors.grey1.withValues(alpha:.15),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: colors.primary,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: colors.error,
            width: 2,
          ),
        ),
        filled: true,
        // Body: 16px, Regular (400)
        hintStyle: textTheme.primary.copyWith(
          color: colors.grey2,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        labelStyle: textTheme.primary.copyWith(
          color: colors.grey2,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            color: colors.grey2,
          ),
        ),
      );

  PageTransitionsTheme get pageTransitionsTheme => const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      );

  /// TalkCaddy Typography Scale
  ///
  /// Font: Inter (SF Pro on iOS)
  /// Principles: Modern, legible outdoors, good medium weight
  ///
  /// Scale:
  /// - H1/Hero: 28-32, weight 600, line 1.2
  /// - H2: 22-24, weight 600
  /// - H3: 18-20, weight 500
  /// - Body Large: 16, weight 400, line 1.5
  /// - Body: 14, weight 400
  /// - Hint/Microcopy: 13, weight 400
  /// - CTA: 16-17, weight 600
  TextTheme textTheme({
    required ApparenceKitColors colors,
    required ApparenceKitTextTheme defaultTextStyle,
  }) =>
      TextTheme(
        // H1 / Hero - Home title "TalkCaddy"
        displayLarge: defaultTextStyle.primary.copyWith(
          fontSize: 32,
          color: colors.onBackground,
          fontWeight: FontWeight.w600,
          height: 1.2,
        ),
        // H2 - Section titles
        displayMedium: defaultTextStyle.primary.copyWith(
          fontSize: 24,
          color: colors.onBackground,
          fontWeight: FontWeight.w600,
          height: 1.2,
        ),
        displaySmall: defaultTextStyle.primary.copyWith(
          fontSize: 22,
          color: colors.onBackground,
          fontWeight: FontWeight.w600,
          height: 1.2,
        ),
        // H2 variants
        headlineLarge: defaultTextStyle.primary.copyWith(
          fontSize: 24,
          color: colors.onBackground,
          fontWeight: FontWeight.w600,
          height: 1.2,
        ),
        headlineMedium: defaultTextStyle.primary.copyWith(
          fontSize: 22,
          color: colors.onBackground,
          fontWeight: FontWeight.w600,
          height: 1.25,
        ),
        // H3 - Subsections
        headlineSmall: defaultTextStyle.primary.copyWith(
          fontSize: 20,
          color: colors.onBackground,
          fontWeight: FontWeight.w500,
          height: 1.3,
        ),
        // Title styles (card titles, navigation)
        titleLarge: defaultTextStyle.primary.copyWith(
          fontSize: 20,
          color: colors.onBackground,
          fontWeight: FontWeight.w500,
          height: 1.3,
        ),
        titleMedium: defaultTextStyle.primary.copyWith(
          fontSize: 18,
          color: colors.onBackground,
          fontWeight: FontWeight.w500,
          height: 1.35,
        ),
        titleSmall: defaultTextStyle.primary.copyWith(
          fontSize: 16,
          color: colors.onBackground,
          fontWeight: FontWeight.w500,
          height: 1.4,
        ),
        // Body Large - main content
        bodyLarge: defaultTextStyle.primary.copyWith(
          fontSize: 16,
          color: colors.onBackground,
          fontWeight: FontWeight.w400,
          height: 1.5,
        ),
        // Body - secondary content
        bodyMedium: defaultTextStyle.primary.copyWith(
          fontSize: 14,
          color: colors.onBackground,
          fontWeight: FontWeight.w400,
          height: 1.5,
        ),
        // Hint / Microcopy (key for AI suggestion card)
        bodySmall: defaultTextStyle.primary.copyWith(
          fontSize: 13,
          color: colors.textTertiary,
          fontWeight: FontWeight.w400,
          height: 1.4,
        ),
        // CTA / Button text
        labelLarge: defaultTextStyle.primary.copyWith(
          fontSize: 17,
          color: colors.onBackground,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
          height: 1.2,
        ),
        // Secondary labels
        labelMedium: defaultTextStyle.primary.copyWith(
          fontSize: 14,
          color: colors.onBackground,
          fontWeight: FontWeight.w500,
          height: 1.3,
        ),
        // Captions
        labelSmall: defaultTextStyle.primary.copyWith(
          fontSize: 12,
          color: colors.textTertiary,
          fontWeight: FontWeight.w400,
          height: 1.3,
        ),
      );
}
