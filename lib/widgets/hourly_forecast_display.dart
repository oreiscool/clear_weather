import 'package:flutter/material.dart';
import 'package:clear_weather/widgets/hourly_forecast_item.dart';
import 'package:clear_weather/models/weather_display_model.dart';

class HourlyForecastDisplay extends StatelessWidget {
  final List<HourlyDisplayModel> data;
  const HourlyForecastDisplay({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: data.length,
      itemBuilder: (context, index) {
        return HourlyForecastItem(data[index]);
      },
    );
  }
}
