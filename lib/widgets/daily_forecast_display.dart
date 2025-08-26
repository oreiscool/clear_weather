import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clear_weather/widgets/daily_forecast_item.dart';
import 'package:clear_weather/providers/weather_provider.dart';

class DailyForecastDisplay extends ConsumerWidget {
  const DailyForecastDisplay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherPackage = ref.watch(weatherDataProvider);
    return weatherPackage.when(
      data: (data) {
        final dailyWeather = data.dailyWeather;
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: dailyWeather.length,
          itemBuilder: (context, index) {
            return DailyForecastItem(dailyWeather[index], index);
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
