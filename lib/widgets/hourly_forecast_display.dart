import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clear_weather/widgets/hourly_forecast_item.dart';
import 'package:clear_weather/providers/weather_provider.dart';

class HourlyForecastDisplay extends ConsumerWidget {
  const HourlyForecastDisplay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherPackage = ref.watch(weatherDataProvider);
    return weatherPackage.when(
      data: (data) {
        final hourlyWeather = data.weather.hourlyWeather;
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: hourlyWeather.length,
          itemBuilder: (context, index) {
            return HourlyForecastItem(hourlyWeather[index], index);
          },
        );
      },
      error: (err, stack) {
        return Center(child: Text('Error: $err'));
      },
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
