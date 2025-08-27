import 'package:flutter/material.dart';
import 'package:open_meteo/open_meteo.dart';
import 'package:clear_weather/models/weather_model.dart';

class WeatherService {
  final WeatherApi _weatherApi = WeatherApi(
    userAgent: 'clear_weather_app',
    temperatureUnit: TemperatureUnit.celsius,
    windspeedUnit: WindspeedUnit.kmh,
  );

  Future<WeatherPackage> getWeather({
    required double latitude,
    required double longitude,
  }) async {
    try {
      final now = DateTime.now().toUtc();
      final sevenDaysLater = now.add(const Duration(days: 7));
      final response = await _weatherApi.request(
        latitude: latitude,
        longitude: longitude,
        hourly: {
          WeatherHourly.temperature_2m,
          WeatherHourly.relative_humidity_2m,
          WeatherHourly.apparent_temperature,
          WeatherHourly.precipitation_probability,
          WeatherHourly.weather_code,
          WeatherHourly.wind_speed_10m,
        },
        daily: {
          WeatherDaily.temperature_2m_max,
          WeatherDaily.temperature_2m_min,
          WeatherDaily.weather_code,
        },
        startDate: now,
        endDate: sevenDaysLater,
      );

      final hourlyData = response.hourlyData;
      final tempMap = hourlyData[WeatherHourly.temperature_2m]!;
      final feelsMap = hourlyData[WeatherHourly.apparent_temperature]!;
      final humidMap = hourlyData[WeatherHourly.relative_humidity_2m]!;
      final precipMap = hourlyData[WeatherHourly.precipitation_probability]!;
      final windMap = hourlyData[WeatherHourly.wind_speed_10m]!;
      final codeMap = hourlyData[WeatherHourly.weather_code]!;
      final times = tempMap.values.keys.toList();
      int index = times.indexWhere((t) => !t.isBefore(now));
      if (index == -1) {
        index = times.isNotEmpty ? times.length - 1 : 0;
      }
      final currentTime = times[index];

      final currentWeather = CurrentWeatherModel(
        time: currentTime.toLocal(),
        temperature: tempMap.values[currentTime]!.round(),
        feelsLike: feelsMap.values[currentTime]!.round(),
        humidity: humidMap.values[currentTime]!.toInt(),
        precipitation: precipMap.values[currentTime]!.toInt(),
        windSpeed: windMap.values[currentTime]!.round(),
        weatherCode: codeMap.values[currentTime]!.toInt(),
      );

      final List<HourlyWeatherModel> hourlyWeather = [];
      for (var i = 0; i < times.length; i++) {
        final time = times[i];
        if (i >= index && hourlyWeather.length < 24) {
          hourlyWeather.add(
            HourlyWeatherModel(
              time: time.toLocal(),
              temperature: hourlyData[WeatherHourly.temperature_2m]!
                  .values[time]!
                  .round(),
              precipitation:
                  hourlyData[WeatherHourly.precipitation_probability]!
                      .values[time]!
                      .toInt(),
              weatherCode: hourlyData[WeatherHourly.weather_code]!.values[time]!
                  .toInt(),
            ),
          );
        }
      }

      final List<DailyWeatherModel> dailyWeather = [];
      final dailyData = response.dailyData;
      final dailyTimes = dailyData[WeatherDaily.temperature_2m_max]!.values.keys
          .toList();
      for (final time in dailyTimes) {
        dailyWeather.add(
          DailyWeatherModel(
            time: time,
            temperatureMax: dailyData[WeatherDaily.temperature_2m_max]!
                .values[time]!
                .round(),
            temperatureMin: dailyData[WeatherDaily.temperature_2m_min]!
                .values[time]!
                .round(),
            weatherCode: dailyData[WeatherDaily.weather_code]!.values[time]!
                .toInt(),
          ),
        );
      }

      return WeatherPackage(
        currentWeather: currentWeather,
        hourlyWeather: hourlyWeather,
        dailyWeather: dailyWeather,
      );
    } catch (e) {
      debugPrint('Error fetching weather data: $e');
      rethrow;
    }
  }
}
