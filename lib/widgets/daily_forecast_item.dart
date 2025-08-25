import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:clear_weather/providers/text_styles_provider.dart';

class DailyForecastItem extends ConsumerWidget {
  const DailyForecastItem({super.key});

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
            Text('28°/22°', style: textStyles.dailyTemp),
          ],
        ),
      ),
    );
  }
}
