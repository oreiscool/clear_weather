import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clear_weather/services/weather_service.dart';
import 'package:clear_weather/models/weather_model.dart';
import 'package:clear_weather/providers/location_provider.dart';
import 'package:clear_weather/models/weather_display_model.dart';
import 'package:clear_weather/utils/formatters.dart';
import 'package:clear_weather/utils/weather_utils.dart';

final weatherServiceProvider = Provider<WeatherService>((ref) {
  return WeatherService();
});

final weatherDataProvider =
    FutureProvider<
      ({
        WeatherPackage weather,
        List<WeatherDisplayModel> dailyDisplay,
        List<HourlyDisplayModel> hourlyDisplay,
        String cityName,
        String weatherDescription,
        IconData currentWeatherIcon,
        String formattedTime,
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
      final String weatherDescription = WeatherUtils.getWeatherDescription(
        weatherData.currentWeather.weatherCode,
      );
      final IconData currentWeatherIcon = WeatherUtils.getWeatherIcon(
        weatherData.currentWeather.weatherCode,
      );
      final String formattedTime = Formatters.toHour(
        weatherData.currentWeather.time,
      );
      final now = weatherData.referenceTime;

      final List<WeatherDisplayModel> formattedDailyWeather = weatherData
          .dailyWeather
          .map((day) {
            return WeatherDisplayModel(
              day: Formatters.toDayofWeek(day.time),
              tempMax: '${day.temperatureMax.round()}°',
              tempMin: '${day.temperatureMin.round()}°',
              weatherCode: day.weatherCode,
              weatherDescription: WeatherUtils.getWeatherDescription(
                day.weatherCode,
              ),
              weatherIcon: WeatherUtils.getWeatherIcon(day.weatherCode),
            );
          })
          .toList();

      final List<HourlyDisplayModel> formattedHourlyWeather = weatherData
          .hourlyWeather
          .map((hour) {
            final isNow = hour.time.hour == now.hour;
            return HourlyDisplayModel(
              time: isNow ? 'NOW' : Formatters.toHour(hour.time),
              temperature: '${hour.temperature.round()}°',
              precipitation: '${(hour.precipitation)}%',
              weatherIcon: WeatherUtils.getWeatherIcon(hour.weatherCode),
              weatherDescription: WeatherUtils.getWeatherDescription(
                hour.weatherCode,
              ),
              isNow: isNow,
            );
          })
          .toList();

      return (
        weather: weatherData,
        dailyDisplay: formattedDailyWeather,
        hourlyDisplay: formattedHourlyWeather,
        cityName: cityName,
        weatherDescription: weatherDescription,
        currentWeatherIcon: currentWeatherIcon,
        formattedTime: formattedTime,
      );
    });
