import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clear_weather/widgets/current_weather_display.dart';
import 'package:clear_weather/widgets/hourly_forecast_display.dart';
import 'package:clear_weather/widgets/daily_forecast_display.dart';
import 'package:clear_weather/constants/colors.dart';

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
              const SizedBox(height: 16),
              const Divider(height: 48, color: AppColors.surfaceVariant),
              const Expanded(flex: 3, child: HourlyForecastDisplay()),
              const Divider(height: 48, color: AppColors.surfaceVariant),
              const SizedBox(height: 32),
              const Expanded(flex: 2, child: DailyForecastDisplay()),
              const Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}
