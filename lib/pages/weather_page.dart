import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clear_weather/widgets/current_weather_display.dart';
import 'package:clear_weather/widgets/hourly_forecast_display.dart';
import 'package:clear_weather/widgets/daily_forecast_display.dart';
import 'package:clear_weather/widgets/settings_modal.dart';

class WeatherPage extends ConsumerWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface,
        actions: [
          IconButton(
            onPressed: () => showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              builder: (context) => const SettingsModal(),
            ),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(flex: 4, child: CurrentWeatherDisplay()),
              const SizedBox(height: 16),
              Divider(
                height: 48,
                color: theme.colorScheme.surfaceContainerHighest,
              ),
              const Expanded(flex: 3, child: HourlyForecastDisplay()),
              Divider(
                height: 48,
                color: theme.colorScheme.surfaceContainerHighest,
              ),
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
