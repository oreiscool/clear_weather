import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class DailyForecastItem extends StatelessWidget {
  const DailyForecastItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sat',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Icon(LucideIcons.cloudy, size: 32),
            SizedBox(height: 4),
            Text('28°/22°', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
