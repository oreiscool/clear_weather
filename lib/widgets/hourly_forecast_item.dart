import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:clear_weather/theme/app_theme.dart';

class HourlyForecastItem extends StatelessWidget {
  const HourlyForecastItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // TODO: Conditionally hide precipitation for the first item (index 0).
          Text('NOW', style: AppTextStyles.hourlyTime),
          SizedBox(height: 8),
          Text('30%', style: AppTextStyles.hourlyPrecip),
          SizedBox(height: 8),
          Icon(LucideIcons.cloudy, size: 32),
          SizedBox(height: 4),
          Text('25°', style: AppTextStyles.hourlyTemp),
        ],
      ),
    );
  }
}
