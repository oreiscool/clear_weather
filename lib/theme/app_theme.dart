import 'package:flutter/material.dart';
import 'package:clear_weather/constants/dark_colors.dart';
import 'package:clear_weather/constants/light_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppDarkColors.accent,
      scaffoldBackgroundColor: AppDarkColors.background,
      cardColor: AppDarkColors.surface,
      colorScheme: const ColorScheme.dark(
        primary: AppDarkColors.accent,
        onPrimary: AppDarkColors.textPrimary,
        secondary: AppDarkColors.accentMuted,
        onSecondary: AppDarkColors.textPrimary,
        surface: AppDarkColors.surface,
        onSurface: AppDarkColors.textPrimary,
        onSurfaceVariant: AppDarkColors.textSecondary,
        error: AppDarkColors.error,
        onError: AppDarkColors.textPrimary,
        tertiary: AppDarkColors.textTertiary,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: AppDarkColors.textPrimary),
        bodyMedium: TextStyle(color: AppDarkColors.textSecondary),
        bodySmall: TextStyle(color: AppDarkColors.textTertiary),
      ),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppLightColors.accent,
      scaffoldBackgroundColor: AppLightColors.background,
      cardColor: AppLightColors.surface,
      colorScheme: const ColorScheme.light(
        primary: AppLightColors.accent,
        onPrimary: AppLightColors.textPrimary,
        secondary: AppLightColors.accentMuted,
        onSecondary: AppLightColors.textPrimary,
        surface: AppLightColors.surface,
        onSurface: AppLightColors.textPrimary,
        onSurfaceVariant: AppLightColors.textSecondary,
        error: AppLightColors.error,
        onError: AppLightColors.textPrimary,
        tertiary: AppLightColors.textTertiary,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: AppLightColors.textPrimary),
        bodyMedium: TextStyle(color: AppLightColors.textSecondary),
        bodySmall: TextStyle(color: AppLightColors.textTertiary),
      ),
    );
  }
}

class AppTextStyles {
  final Color accent;
  final Color accentMuted;
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;

  AppTextStyles({
    required this.accent,
    required this.accentMuted,
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
  });

  TextStyle get lastUpdated => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: textSecondary,
  );
  TextStyle get location =>
      TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: textPrimary);
  TextStyle get temperature =>
      TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: textPrimary);
  TextStyle get feelsLike => TextStyle(fontSize: 20, color: textPrimary);
  TextStyle get condition =>
      TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: textPrimary);
  TextStyle get secondaryDetails => TextStyle(fontSize: 20, color: textPrimary);
  TextStyle get hourlyTime => TextStyle(fontSize: 20, color: textSecondary);
  TextStyle get hourlyPrecip => TextStyle(fontSize: 20, color: accent);
  TextStyle get hourlyTemp => TextStyle(fontSize: 20, color: textPrimary);
  TextStyle get dailyDay =>
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: textPrimary);
  TextStyle get dailyTemp => TextStyle(fontSize: 20, color: textPrimary);
}
