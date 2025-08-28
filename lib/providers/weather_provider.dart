import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clear_weather/services/weather_service.dart';
import 'package:clear_weather/models/weather_model.dart';
import 'package:clear_weather/providers/location_provider.dart';
import 'package:clear_weather/models/weather_display_model.dart';
import 'package:clear_weather/utils/formatters.dart';

final weatherServiceProvider = Provider<WeatherService>((ref) {
  return WeatherService();
});

final weatherDataProvider =
    FutureProvider<
      ({
        WeatherPackage weather,
        List<WeatherDisplayModel> dailyDisplay,
        String cityName,
      })
    >((ref) async {
      final weatherService = ref.watch(weatherServiceProvider);
      final locationService = ref.watch(locationServiceProvider);
      final position = await locationService.getCurrentLocation();
      final cityName = await locationService.getCityName(position);
      final weatherData = await weatherService.getWeather(
        latitude: position.latitude,
        longitude: position.longitude,
      );

      final List<WeatherDisplayModel> formattedDailyWeather = weatherData
          .dailyWeather
          .map((day) {
            return WeatherDisplayModel(
              day: Formatters.toDayofWeek(day.time),
              tempMax: '${day.temperatureMax.round()}°',
              tempMin: '${day.temperatureMin.round()}°',
            );
          })
          .toList();

      return (
        weather: weatherData,
        dailyDisplay: formattedDailyWeather,
        cityName: cityName,
      );
    });
