import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clear_weather/widgets/daily_forecast_item.dart';

class DailyForecastDisplay extends ConsumerWidget {
  const DailyForecastDisplay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 7,
      itemBuilder: (context, index) {
        return const DailyForecastItem();
      },
    );
  }
}
