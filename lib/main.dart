import 'package:flutter/material.dart';
import 'package:clear_weather/pages/weather_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clear_weather/theme/app_theme.dart';
import 'package:clear_weather/providers/theme_provider.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      home: const WeatherPage(),
    );
  }
}
