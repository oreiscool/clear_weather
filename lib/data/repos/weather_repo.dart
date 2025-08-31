import 'dart:convert';
import 'package:clear_weather/models/weather_model.dart';
import 'package:clear_weather/data/services/weather_service.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:clear_weather/data/exceptions/exceptions.dart';

class WeatherRepository {
  final WeatherService weatherService;
  final SharedPreferences prefs;
  static const _weatherCacheKey = 'weather_cache';
  static final _cacheExpiration = Duration(minutes: 30);

  WeatherRepository({required this.weatherService, required this.prefs});

  Future<WeatherPackage> getWeather({
    required double latitude,
    required double longitude,
  }) async {
    try {
      final weatherData = await weatherService.getWeather(
        latitude: latitude,
        longitude: longitude,
      );
      final cacheData = {
        'timestamp': DateTime.now().millisecondsSinceEpoch,
        'weather': weatherData.toJson(),
      };
      await prefs.setString(_weatherCacheKey, jsonEncode(cacheData));
      return weatherData;
    } catch (e) {
      final cachedString = prefs.getString(_weatherCacheKey);
      if (cachedString != null) {
        try {
          final cachedData = jsonDecode(cachedString);
          final timestamp = DateTime.fromMillisecondsSinceEpoch(
            cachedData['timestamp'] as int,
          );
          final cacheAge = DateTime.now().difference(timestamp);
          if (cacheAge < _cacheExpiration) {
            return WeatherPackage.fromJson(cachedData['weather']);
          } else {
            throw NoNetworkException();
          }
        } catch (e) {
          if (kDebugMode) {
            print('Error fetching weather data: $e');
          }
          throw NoNetworkException();
        }
      } else {
        throw NetworkException();
      }
    }
  }
}
