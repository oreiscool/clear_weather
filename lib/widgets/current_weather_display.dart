import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:clear_weather/providers/text_styles_provider.dart';

class CurrentWeatherDisplay extends ConsumerWidget {
  const CurrentWeatherDisplay({super.key});

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
                Text('Last Updated: Now', style: textStyles.lastUpdated),
                Text('Location', style: textStyles.location),
                Row(
                  children: [
                    Text('25°', style: textStyles.temperature),
                    Icon(LucideIcons.cloudy, size: 48),
                  ],
                ),
                Text('Feels like 27°', style: textStyles.feelsLike),
                SizedBox(height: 24),
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('Cloudy', style: textStyles.condition),
                SizedBox(height: 8),
                Text('Precip: 30%', style: textStyles.secondaryDetails),
                Text('Humidity: 90%', style: textStyles.secondaryDetails),
                Text('Wind: 8 km/h', style: textStyles.secondaryDetails),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
