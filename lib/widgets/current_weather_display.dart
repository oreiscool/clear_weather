import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clear_weather/providers/text_styles_provider.dart';
import 'package:clear_weather/models/weather_model.dart';
import 'package:clear_weather/models/weather_display_model.dart';

class CurrentWeatherDisplay extends ConsumerWidget {
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

  const CurrentWeatherDisplay({super.key, required this.data});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyles = ref.watch(textStylesProvider);
    final currentWeather = data.weather.currentWeather;
    final cityName = data.cityName;
    final description = data.weatherDescription;
    final icon = data.currentWeatherIcon;
    final lastUpdated = data.formattedTime;
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
                  'Last Updated: $lastUpdated',
                  style: textStyles.captionBold,
                ),
                Text(cityName, style: textStyles.location),
                Row(
                  children: [
                    Text(
                      '${currentWeather.temperature}°',
                      style: textStyles.temperature,
                    ),
                    Icon(icon, size: 48),
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
                Text(description, style: textStyles.condition),
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
  }
}
