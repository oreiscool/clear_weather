import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clear_weather/widgets/current_weather_display.dart';
import 'package:clear_weather/widgets/hourly_forecast_display.dart';
import 'package:clear_weather/widgets/daily_forecast_display.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(flex: 4, child: CurrentWeatherDisplay()),
              const SizedBox(height: 24),
              const Expanded(flex: 4, child: HourlyForecastDisplay()),
              const SizedBox(height: 24),
              const Expanded(flex: 2, child: DailyForecastDisplay()),
            ],
          ),
        ),
      ),
    );
  }
}
