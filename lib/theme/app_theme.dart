import 'package:flutter/material.dart';
import 'package:clear_weather/constants/colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColors.accent,
      scaffoldBackgroundColor: AppColors.background,
      cardColor: AppColors.surface,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.accent,
        secondary: AppColors.accentMuted,
        surface: AppColors.surface,
        onSurface: AppColors.textPrimary,
        onSurfaceVariant: AppColors.textSecondary,
        error: AppColors.error,
        onError: AppColors.textPrimary,
        tertiary: AppColors.textTertiary,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: AppColors.textPrimary),
        bodyMedium: TextStyle(color: AppColors.textSecondary),
        bodySmall: TextStyle(color: AppColors.textTertiary),
      ),
    );
  }
}

class AppTextStyles {
  AppTextStyles._();

  static const TextStyle lastUpdated = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );
  static const TextStyle location = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );
  static const TextStyle temperature = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );
  static const TextStyle feelsLike = TextStyle(
    fontSize: 20,
    color: AppColors.textPrimary,
  );
  static const TextStyle condition = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );
  static const TextStyle secondaryDetails = TextStyle(
    fontSize: 20,
    color: AppColors.textPrimary,
  );
  static const TextStyle hourlyTime = TextStyle(
    fontSize: 20,
    color: AppColors.textSecondary,
  );
  static const TextStyle hourlyPrecip = TextStyle(
    fontSize: 20,
    color: AppColors.accent,
  );
  static const TextStyle hourlyTemp = TextStyle(
    fontSize: 20,
    color: AppColors.textPrimary,
  );
  static const TextStyle dailyDay = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );
  static const TextStyle dailyTemp = TextStyle(
    fontSize: 20,
    color: AppColors.textPrimary,
  );
}
