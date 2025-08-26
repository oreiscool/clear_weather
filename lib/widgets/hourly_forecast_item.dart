import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:clear_weather/providers/text_styles_provider.dart';
import 'package:clear_weather/models/current_weather_model.dart';

class HourlyForecastItem extends ConsumerWidget {
  const HourlyForecastItem(this.item, this.index, {super.key});
  final HourlyWeatherModel item;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyles = ref.watch(textStylesProvider);
    final String timeText = index == 0 ? 'NOW' : '${item.time.hour}:00';
    final bool isNow = index == 0;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(timeText, style: textStyles.hourlyTime),
          SizedBox(height: 8),
          isNow
              ? Text('', style: textStyles.hourlyPrecip)
              : Text('${item.precipitation}%', style: textStyles.hourlyPrecip),
          SizedBox(height: 8),
          const Icon(LucideIcons.cloudy, size: 32),
          SizedBox(height: 4),
          Text('${item.temperature}°', style: textStyles.hourlyTemp),
        ],
      ),
    );
  }
}
