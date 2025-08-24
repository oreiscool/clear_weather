import 'package:flutter/material.dart';
import 'package:clear_weather/pages/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clear_weather/theme/app_theme.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const HomePage(),
    );
  }
}
