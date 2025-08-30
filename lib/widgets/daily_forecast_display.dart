import 'package:flutter/material.dart';
import 'package:clear_weather/widgets/daily_forecast_item.dart';
import 'package:clear_weather/models/weather_model.dart';
import 'package:clear_weather/models/weather_display_model.dart';

class DailyForecastDisplay extends StatelessWidget {
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

  const DailyForecastDisplay({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final dailyWeather = data.dailyDisplay;
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: dailyWeather.length,
      itemBuilder: (context, index) {
        return DailyForecastItem(dailyWeather[index]);
      },
    );
  }
}
