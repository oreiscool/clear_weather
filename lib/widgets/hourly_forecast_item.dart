import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:clear_weather/providers/text_styles_provider.dart';

class HourlyForecastItem extends ConsumerWidget {
  const HourlyForecastItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyles = ref.watch(textStylesProvider);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // TODO: Conditionally hide precipitation for the first item (index 0).
          Text('NOW', style: textStyles.hourlyTime),
          SizedBox(height: 8),
          Text('30%', style: textStyles.hourlyPrecip),
          SizedBox(height: 8),
          Icon(LucideIcons.cloudy, size: 32),
          SizedBox(height: 4),
          Text('25°', style: textStyles.hourlyTemp),
        ],
      ),
    );
  }
}
