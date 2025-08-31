import 'package:flutter/material.dart';

class DailyDisplayModel {
  final String day;
  final String tempMax;
  final String tempMin;
  final int weatherCode;
  final IconData weatherIcon;
  final String weatherDescription;

  DailyDisplayModel({
    required this.day,
    required this.tempMax,
    required this.tempMin,
    required this.weatherCode,
    required this.weatherDescription,
    required this.weatherIcon,
  });
}

class HourlyDisplayModel {
  final String time;
  final String precipitation;
  final String temperature;
  final IconData weatherIcon;
  final String weatherDescription;
  final bool isNow;

  HourlyDisplayModel({
    required this.time,
    required this.precipitation,
    required this.temperature,
    required this.weatherIcon,
    required this.weatherDescription,
    required this.isNow,
  });
}

class CurrentWeatherDisplayModel {
  final String temperature;
  final String feelsLike;
  final String precipitation;
  final String humidity;
  final String windSpeed;
  final String cityName;
  final String weatherDescription;
  final IconData currentWeatherIcon;
  final String formattedTime;
  final DateTime referenceTime;

  CurrentWeatherDisplayModel({
    required this.temperature,
    required this.feelsLike,
    required this.precipitation,
    required this.humidity,
    required this.windSpeed,
    required this.cityName,
    required this.weatherDescription,
    required this.currentWeatherIcon,
    required this.formattedTime,
    required this.referenceTime,
  });
}
