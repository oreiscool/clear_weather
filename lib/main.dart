import 'package:flutter/material.dart';
import 'package:clear_weather/pages/weather_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clear_weather/providers/theme_provider.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeTheme = ref.watch(activeThemeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: activeTheme,
      home: const WeatherPage(),
    );
  }
}
