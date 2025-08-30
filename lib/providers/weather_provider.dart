import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clear_weather/models/weather_model.dart';
import 'package:clear_weather/models/weather_display_model.dart';
import 'package:clear_weather/utils/formatters.dart';
import 'package:clear_weather/utils/weather_utils.dart';
import 'package:clear_weather/providers/service_providers.dart';
import 'package:clear_weather/providers/weather_repo_provider.dart';

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
      await ref.watch(sharedPreferencesProvider.future);
      final weatherRepo = ref.watch(weatherRepoProvider);
      final locationService = ref.watch(locationServiceProvider);
      final position = await locationService.getCurrentLocation();
      final cityName = await locationService.getCityName(position);
      final weatherData = await weatherRepo.getWeather(
        latitude: position.latitude,
        longitude: position.longitude,
      );
      final String weatherDescription = WeatherUtils.getWeatherDescription(
        weatherData.currentWeather.weatherCode,
      );
      final IconData currentWeatherIcon = WeatherUtils.getWeatherIcon(
        weatherData.currentWeather.weatherCode,
        isDay: weatherData.currentWeather.isDay == 1,
      );
      final String formattedTime = Formatters.toRelativeTime(
        weatherData.referenceTime,
      );

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
          .asMap()
          .entries
          .map((entry) {
            final int index = entry.key;
            final HourlyWeatherModel hour = entry.value;
            final bool isNow = index == 0;
            final int weatherCode = hour.weatherCode;
            final bool isPrecipitating = weatherCode >= 51 && weatherCode <= 99;
            return HourlyDisplayModel(
              time: isNow ? 'NOW' : Formatters.toHour(hour.time),
              temperature: Formatters.toCelcius(hour.temperature.toDouble()),
              precipitation: isPrecipitating
                  ? Formatters.toPercentage(hour.precipitation.toDouble())
                  : '',
              weatherIcon: WeatherUtils.getWeatherIcon(
                hour.weatherCode,
                isDay: hour.time.hour >= 6 && hour.time.hour < 18,
              ),
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
