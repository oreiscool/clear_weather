import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:clear_weather/providers/text_styles_provider.dart';
import 'package:clear_weather/models/current_weather_model.dart';

class DailyForecastItem extends ConsumerWidget {
  const DailyForecastItem(this.item, this.index, {super.key});
  final DailyWeatherModel item;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyles = ref.watch(textStylesProvider);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Sat', style: textStyles.dailyDay),
            SizedBox(height: 8),
            Icon(LucideIcons.cloudy, size: 32),
            SizedBox(height: 4),
            Text(
              '${item.temperatureMax}°/${item.temperatureMin}°',
              style: textStyles.dailyTemp,
            ),
          ],
        ),
      ),
    );
  }
}
