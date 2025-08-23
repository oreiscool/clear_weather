import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class HourlyForecastItem extends StatelessWidget {
  const HourlyForecastItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('NOW', style: TextStyle(fontSize: 20)),
          SizedBox(height: 8),
          Text('30%', style: TextStyle(fontSize: 20, color: Colors.blue)),
          SizedBox(height: 8),
          Icon(LucideIcons.cloudy, size: 32),
          SizedBox(height: 4),
          Text('25°', style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
