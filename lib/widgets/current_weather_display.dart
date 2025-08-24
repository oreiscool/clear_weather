import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:clear_weather/theme/app_theme.dart';

class CurrentWeatherDisplay extends ConsumerWidget {
  const CurrentWeatherDisplay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Last Updated: Now', style: AppTextStyles.lastUpdated),
                Text('Location', style: AppTextStyles.location),
                Row(
                  children: [
                    Text('25°', style: AppTextStyles.temperature),
                    Icon(LucideIcons.cloudy, size: 48),
                  ],
                ),
                Text('Feels like 27°', style: AppTextStyles.feelsLike),
                SizedBox(height: 24),
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('Cloudy', style: AppTextStyles.condition),
                SizedBox(height: 8),
                Text('Precip: 30%', style: AppTextStyles.secondaryDetails),
                Text('Humidity: 90%', style: AppTextStyles.secondaryDetails),
                Text('Wind: 8 km/h', style: AppTextStyles.secondaryDetails),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
