import 'package:flutter/material.dart';

class WeatherDisplayModel {
  final String day;
  final String tempMax;
  final String tempMin;
  final int weatherCode;
  final IconData weatherIcon;
  final String weatherDescription;

  WeatherDisplayModel({
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
