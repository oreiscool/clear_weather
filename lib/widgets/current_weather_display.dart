import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clear_weather/providers/text_styles_provider.dart';
import 'package:clear_weather/models/weather_display_model.dart';

class CurrentWeatherDisplay extends ConsumerWidget {
  final CurrentWeatherDisplayModel data;

  const CurrentWeatherDisplay({super.key, required this.data});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyles = ref.watch(textStylesProvider);

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
                  'Last Updated: ${data.formattedTime}',
                  style: textStyles.captionBold,
                ),
                Text(data.cityName, style: textStyles.location),
                Row(
                  children: [
                    Text(data.temperature, style: textStyles.temperature),
                    SizedBox(width: 8),
                    Icon(data.currentWeatherIcon, size: 48),
                  ],
                ),
                Text(
                  'Feels like ${data.feelsLike}',
                  style: textStyles.feelsLike,
                ),
                SizedBox(height: 24),
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(data.weatherDescription, style: textStyles.condition),
                SizedBox(height: 8),
                Text(
                  'Precip: ${data.precipitation}',
                  style: textStyles.secondaryDetails,
                ),
                Text(
                  'Humidity: ${data.humidity}',
                  style: textStyles.secondaryDetails,
                ),
                Text(
                  'Wind: ${data.windSpeed}',
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
