import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clear_weather/providers/text_styles_provider.dart';
import 'package:clear_weather/models/weather_display_model.dart';

class HourlyForecastItem extends ConsumerWidget {
  const HourlyForecastItem(this.item, {super.key});
  final HourlyDisplayModel item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyles = ref.watch(textStylesProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(item.time, style: textStyles.hourlyTime),
          SizedBox(height: 8),
          Text(item.precipitation, style: textStyles.hourlyPrecip),
          SizedBox(height: 8),
          Icon(item.weatherIcon, size: 32),
          SizedBox(height: 4),
          Text(item.weatherDescription, style: textStyles.captionBold),
          SizedBox(height: 4),
          Text('${item.temperature}°', style: textStyles.hourlyTemp),
        ],
      ),
    );
  }
}
