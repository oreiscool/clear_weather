import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clear_weather/theme/app_theme.dart';
import 'package:clear_weather/providers/service_providers.dart';

final themeProvider = NotifierProvider<ThemeNotifier, ThemeMode>(
  ThemeNotifier.new,
);

final activeThemeProvider = Provider<ThemeData>((ref) {
  final themeMode = ref.watch(themeProvider);
  switch (themeMode) {
    case ThemeMode.dark:
      return AppTheme.darkTheme;
    default:
      return AppTheme.lightTheme;
  }
});

class ThemeNotifier extends Notifier<ThemeMode> {
  static const _themePrefKey = 'themeMode';

  @override
  ThemeMode build() {
    _loadTheme();
    return ThemeMode.light;
  }

  Future<void> _loadTheme() async {
    final prefs = await ref.watch(sharedPreferencesProvider.future);
    final themeIndex = prefs.getInt(_themePrefKey) ?? 1;
    state = ThemeMode.values[themeIndex];
  }

  Future<void> _saveTheme(ThemeMode mode) async {
    final prefs = await ref.watch(sharedPreferencesProvider.future);
    await prefs.setInt(_themePrefKey, mode.index);
  }

  void toggleTheme() {
    final newTheme = state == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
    state = newTheme;
    _saveTheme(state);
  }
}
