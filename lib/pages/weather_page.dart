import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clear_weather/widgets/current_weather_display.dart';
import 'package:clear_weather/widgets/hourly_forecast_display.dart';
import 'package:clear_weather/widgets/daily_forecast_display.dart';
import 'package:clear_weather/widgets/settings_modal.dart';
import 'package:clear_weather/providers/weather_provider.dart';

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
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(weatherDataProvider);
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 250, child: CurrentWeatherDisplay()),
                  const SizedBox(height: 16),
                  Divider(
                    height: 48,
                    color: theme.colorScheme.surfaceContainerHighest,
                  ),
                  const SizedBox(height: 200, child: HourlyForecastDisplay()),
                  Divider(
                    height: 48,
                    color: theme.colorScheme.surfaceContainerHighest,
                  ),
                  const SizedBox(height: 32),
                  const SizedBox(height: 150, child: DailyForecastDisplay()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
