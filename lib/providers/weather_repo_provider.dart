import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clear_weather/data/repos/weather_repo.dart';
import 'package:clear_weather/providers/service_providers.dart';

final weatherRepoProvider = Provider<WeatherRepository>((ref) {
  final weatherService = ref.watch(weatherServiceProvider);
  final sharedPreferences = ref.watch(sharedPreferencesProvider).asData!.value;

  return WeatherRepository(
    weatherService: weatherService,
    prefs: sharedPreferences,
  );
});
