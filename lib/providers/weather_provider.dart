import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clear_weather/models/weather_model.dart';
import 'package:clear_weather/models/weather_display_model.dart';
import 'package:clear_weather/utils/formatters.dart';
import 'package:clear_weather/utils/weather_utils.dart';
import 'package:clear_weather/providers/service_providers.dart';
import 'package:clear_weather/providers/weather_repo_provider.dart';
import 'package:clear_weather/providers/settings_provider.dart';

final weatherDataProvider =
    FutureProvider<
      ({
        CurrentWeatherDisplayModel currentDisplay,
        List<DailyDisplayModel> dailyDisplay,
        List<HourlyDisplayModel> hourlyDisplay,
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
      final current = weatherData.currentWeather;
      final now = weatherData.referenceTime;
      final settings = ref.watch(settingsProvider);

      final List<DailyDisplayModel> formattedDailyWeather = weatherData
          .dailyWeather
          .map((day) {
            return DailyDisplayModel(
              day: Formatters.toDayofWeek(day.time),
              tempMax: settings.isMetric
                  ? Formatters.toCelciusPlain(day.temperatureMax.toDouble())
                  : Formatters.toFahrenheitPlain(day.temperatureMax.toDouble()),
              tempMin: settings.isMetric
                  ? Formatters.toCelciusPlain(day.temperatureMin.toDouble())
                  : Formatters.toFahrenheitPlain(day.temperatureMin.toDouble()),
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
            final sunriseForDay = weatherData.sunrise.firstWhere(
              (sunrise) =>
                  sunrise.day == hour.time.day &&
                  sunrise.month == hour.time.month,
              orElse: () => weatherData.sunrise.first,
            );
            final sunsetForDay = weatherData.sunset.firstWhere(
              (sunset) =>
                  sunset.day == hour.time.day &&
                  sunset.month == hour.time.month,
              orElse: () => weatherData.sunset.first,
            );
            final bool isDay =
                hour.time.isAfter(sunriseForDay) &&
                hour.time.isBefore(sunsetForDay);
            return HourlyDisplayModel(
              time: isNow ? 'NOW' : Formatters.toHour(hour.time),
              temperature: settings.isMetric
                  ? Formatters.toCelcius(hour.temperature.toDouble())
                  : Formatters.toFahrenheit(hour.temperature.toDouble()),
              precipitation: isPrecipitating
                  ? Formatters.toPercentage(hour.precipitation.toDouble())
                  : '',
              weatherIcon: WeatherUtils.getWeatherIcon(
                hour.weatherCode,
                isDay: isDay,
              ),
              weatherDescription: WeatherUtils.getWeatherDescription(
                hour.weatherCode,
              ),
              isNow: isNow,
            );
          })
          .toList();

      final currentDisplayModel = CurrentWeatherDisplayModel(
        temperature: settings.isMetric
            ? Formatters.toCelcius(current.temperature.toDouble())
            : Formatters.toFahrenheit(current.temperature.toDouble()),
        feelsLike: settings.isMetric
            ? Formatters.toCelcius(current.feelsLike.toDouble())
            : Formatters.toFahrenheit(current.feelsLike.toDouble()),
        precipitation: Formatters.toPercentage(
          current.precipitation.toDouble(),
        ),
        humidity: Formatters.toPercentage(current.humidity.toDouble()),
        windSpeed: settings.isMetric
            ? Formatters.toKmh(current.windSpeed.toDouble())
            : Formatters.toMph(current.windSpeed.toDouble()),
        cityName: cityName,
        weatherDescription: WeatherUtils.getWeatherDescription(
          current.weatherCode,
        ),
        currentWeatherIcon: WeatherUtils.getWeatherIcon(
          current.weatherCode,
          isDay: current.isDay == 1,
        ),
        formattedTime: Formatters.toRelativeTime(now),
        referenceTime: now,
      );

      return (
        dailyDisplay: formattedDailyWeather,
        hourlyDisplay: formattedHourlyWeather,
        currentDisplay: currentDisplayModel,
      );
    });
