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

  /// Typography scale (tight):
  /// - Title: 20-22px
  /// - Primary action: 18px
  /// - Body: 14-16px
  /// - Secondary: 12-13px
  ///
  /// Weights: Regular (400), Medium (500), Semibold (600)
  /// No italic, no playful weights, no decorative fonts
  TextTheme textTheme({
    required ApparenceKitColors colors,
    required ApparenceKitTextTheme defaultTextStyle,
  }) =>
      TextTheme(
        // Display styles (large titles, rarely used)
        displayLarge: defaultTextStyle.primary.copyWith(
          fontSize: 28,
          color: colors.onBackground,
          fontWeight: FontWeight.w600,
        ),
        displayMedium: defaultTextStyle.primary.copyWith(
          fontSize: 24,
          color: colors.onBackground,
          fontWeight: FontWeight.w600,
        ),
        displaySmall: defaultTextStyle.primary.copyWith(
          fontSize: 22,
          color: colors.onBackground,
          fontWeight: FontWeight.w600,
        ),
        // Headline styles (section headers)
        headlineLarge: defaultTextStyle.primary.copyWith(
          fontSize: 22,
          color: colors.onBackground,
          fontWeight: FontWeight.w600,
        ),
        headlineMedium: defaultTextStyle.primary.copyWith(
          fontSize: 20,
          color: colors.onBackground,
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: defaultTextStyle.primary.copyWith(
          fontSize: 18,
          color: colors.onBackground,
          fontWeight: FontWeight.w600,
        ),
        // Title styles (card titles, list items)
        titleLarge: defaultTextStyle.primary.copyWith(
          fontSize: 20,
          color: colors.onBackground,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: defaultTextStyle.primary.copyWith(
          fontSize: 18,
          color: colors.onBackground,
          fontWeight: FontWeight.w500,
        ),
        titleSmall: defaultTextStyle.primary.copyWith(
          fontSize: 16,
          color: colors.onBackground,
          fontWeight: FontWeight.w500,
        ),
        // Body styles (main content)
        bodyLarge: defaultTextStyle.primary.copyWith(
          fontSize: 16,
          color: colors.onBackground,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: defaultTextStyle.primary.copyWith(
          fontSize: 14,
          color: colors.onBackground,
          fontWeight: FontWeight.w400,
        ),
        bodySmall: defaultTextStyle.primary.copyWith(
          fontSize: 13,
          color: colors.onBackground,
          fontWeight: FontWeight.w400,
        ),
        // Label styles (buttons, captions)
        labelLarge: defaultTextStyle.primary.copyWith(
          fontSize: 16,
          color: colors.onBackground,
          fontWeight: FontWeight.w500,
        ),
        labelMedium: defaultTextStyle.primary.copyWith(
          fontSize: 13,
          color: colors.onBackground,
          fontWeight: FontWeight.w500,
        ),
        labelSmall: defaultTextStyle.primary.copyWith(
          fontSize: 12,
          color: colors.onBackground,
          fontWeight: FontWeight.w500,
        ),
      );
}
