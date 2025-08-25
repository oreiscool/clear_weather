import 'package:flutter/material.dart';
import 'package:clear_weather/providers/theme_provider.dart';
import 'package:clear_weather/theme/app_theme.dart';
import 'package:clear_weather/constants/light_colors.dart';
import 'package:clear_weather/constants/dark_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final textStylesProvider = Provider<AppTextStyles>((ref) {
  final themeMode = ref.watch(themeProvider);
  final isDarkMode = themeMode == ThemeMode.dark;

  return AppTextStyles(
    accent: isDarkMode ? AppDarkColors.accent : AppLightColors.accent,
    accentMuted: isDarkMode
        ? AppDarkColors.accentMuted
        : AppLightColors.accentMuted,
    textPrimary: isDarkMode
        ? AppDarkColors.textPrimary
        : AppLightColors.textPrimary,
    textSecondary: isDarkMode
        ? AppDarkColors.textSecondary
        : AppLightColors.textSecondary,
    textTertiary: isDarkMode
        ? AppDarkColors.textTertiary
        : AppLightColors.textTertiary,
  );
});
