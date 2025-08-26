import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clear_weather/services/weather_service.dart';
import 'package:clear_weather/models/current_weather_model.dart';

final weatherServiceProvider = Provider<WeatherService>((ref) {
  return WeatherService();
});

final weatherDataProvider = FutureProvider<WeatherPackage>((ref) async {
  final weatherService = ref.watch(weatherServiceProvider);
  final weatherData = await weatherService.getWeather(
    latitude: 34.8,
    longitude: 51.5074,
  );
  return weatherData;
});
