import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clear_weather/widgets/current_weather_display.dart';
import 'package:clear_weather/widgets/hourly_forecast_display.dart';
import 'package:clear_weather/widgets/daily_forecast_display.dart';
import 'package:clear_weather/widgets/settings_modal.dart';
import 'package:clear_weather/providers/weather_provider.dart';
import 'package:clear_weather/data/exceptions/exceptions.dart';

class WeatherPage extends ConsumerWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final weatherPackage = ref.watch(weatherDataProvider);
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
          return await ref.read(weatherDataProvider.future);
        },
        child: weatherPackage.when(
          data: (data) {
            final currentDisplayData = data.currentDisplay;
            final hourlyDisplayData = data.hourlyDisplay;
            final dailyDisplayData = data.dailyDisplay;
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 250,
                        child: CurrentWeatherDisplay(data: currentDisplayData),
                      ),
                      const SizedBox(height: 16),
                      Divider(
                        height: 48,
                        color: theme.colorScheme.surfaceContainerHighest,
                      ),
                      SizedBox(
                        height: 200,
                        child: HourlyForecastDisplay(data: hourlyDisplayData),
                      ),
                      Divider(
                        height: 48,
                        color: theme.colorScheme.surfaceContainerHighest,
                      ),
                      const SizedBox(height: 32),
                      SizedBox(
                        height: 150,
                        child: DailyForecastDisplay(data: dailyDisplayData),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          error: (err, stack) {
            String errorMessage = "Something went wrong.";
            if (err is NetworkException) {
              errorMessage =
                  "No internet connection. Please check your network and pull to refresh.";
            } else if (err is NoNetworkException) {
              errorMessage =
                  "Couldn't update weather. Please check your internet connection.";
            }
            return Center(
              child: Text(errorMessage, textAlign: TextAlign.center),
            );
          },
          loading: () {
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
