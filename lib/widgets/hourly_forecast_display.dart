import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clear_weather/widgets/hourly_forecast_item.dart';

class HourlyForecastDisplay extends ConsumerWidget {
  const HourlyForecastDisplay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 24,
      itemBuilder: (context, index) {
        return const HourlyForecastItem();
      },
    );
  }
}
