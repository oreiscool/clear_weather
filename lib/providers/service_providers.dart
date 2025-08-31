import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clear_weather/data/services/weather_service.dart';
import 'package:clear_weather/data/services/location_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

final weatherServiceProvider = Provider<WeatherService>((ref) {
  return WeatherService();
});

final locationServiceProvider = Provider<LocationService>((ref) {
  return LocationService();
});

final sharedPreferencesProvider = FutureProvider<SharedPreferences>((ref) {
  return SharedPreferences.getInstance();
});
