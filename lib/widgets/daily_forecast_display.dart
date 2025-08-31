import 'package:flutter/material.dart';
import 'package:clear_weather/widgets/daily_forecast_item.dart';
import 'package:clear_weather/models/weather_display_model.dart';

class DailyForecastDisplay extends StatelessWidget {
  final List<DailyDisplayModel> data;

  const DailyForecastDisplay({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: data.length,
      itemBuilder: (context, index) {
        return DailyForecastItem(data[index]);
      },
    );
  }
}
