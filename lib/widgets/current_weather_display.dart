import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:clear_weather/providers/text_styles_provider.dart';
import 'package:clear_weather/providers/weather_provider.dart';

class CurrentWeatherDisplay extends ConsumerWidget {
  const CurrentWeatherDisplay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherPackage = ref.watch(weatherDataProvider);
    final textStyles = ref.watch(textStylesProvider);
    return weatherPackage.when(
      data: (data) {
        final currentWeather = data.currentWeather;
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Last Updated: ${currentWeather.time.hour}:${currentWeather.time.minute.toString().padLeft(2, '0')}',
                      style: textStyles.lastUpdated,
                    ),
                    Text('Location', style: textStyles.location),
                    Row(
                      children: [
                        Text(
                          '${currentWeather.temperature}°',
                          style: textStyles.temperature,
                        ),
                        Icon(LucideIcons.cloudy, size: 48),
                      ],
                    ),
                    Text(
                      'Feels like ${currentWeather.feelsLike}°',
                      style: textStyles.feelsLike,
                    ),
                    SizedBox(height: 24),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Cloudy', style: textStyles.condition),
                    SizedBox(height: 8),
                    Text(
                      'Precip: ${currentWeather.precipitation}%',
                      style: textStyles.secondaryDetails,
                    ),
                    Text(
                      'Humidity: ${currentWeather.humidity}%',
                      style: textStyles.secondaryDetails,
                    ),
                    Text(
                      'Wind: ${currentWeather.windSpeed} km/h',
                      style: textStyles.secondaryDetails,
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
      error: (err, stack) => Center(child: Text('Error: $err')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
