import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clear_weather/providers/clock_provider.dart';
import 'package:clear_weather/providers/weather_provider.dart';
import 'package:clear_weather/utils/formatters.dart';

final relativeTimeProvider = Provider<String>((ref) {
  ref.watch(clockProvider);
  final weatherData = ref.watch(weatherDataProvider).asData!.value;
  final fetchTime = weatherData.currentDisplay.referenceTime;

  return Formatters.toRelativeTime(fetchTime);
});
