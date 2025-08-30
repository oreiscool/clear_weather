import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clear_weather/data/services/weather_service.dart';
import 'package:clear_weather/data/services/location_service.dart';

final weatherServiceProvider = Provider<WeatherService>((ref) {
  return WeatherService();
});

final locationServiceProvider = Provider<LocationService>((ref) {
  return LocationService();
});
