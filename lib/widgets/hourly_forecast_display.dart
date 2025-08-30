import 'package:flutter/material.dart';
import 'package:clear_weather/widgets/hourly_forecast_item.dart';
import 'package:clear_weather/models/weather_model.dart';
import 'package:clear_weather/models/weather_display_model.dart';

class HourlyForecastDisplay extends StatelessWidget {
  final ({
    WeatherPackage weather,
    List<WeatherDisplayModel> dailyDisplay,
    List<HourlyDisplayModel> hourlyDisplay,
    String cityName,
    String weatherDescription,
    IconData currentWeatherIcon,
    String formattedTime,
  })
  data;
  const HourlyForecastDisplay({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final hourlyDisplayList = data.hourlyDisplay;
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: hourlyDisplayList.length,
      itemBuilder: (context, index) {
        return HourlyForecastItem(hourlyDisplayList[index]);
      },
    );
  }
}
