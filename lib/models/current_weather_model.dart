class CurrentWeatherModel {
  final DateTime time;
  final int temperature;
  final int feelsLike;
  final int humidity;
  final int precipitation;
  final int windSpeed;
  final int weatherCode;

  CurrentWeatherModel({
    required this.time,
    required this.temperature,
    required this.feelsLike,
    required this.humidity,
    required this.precipitation,
    required this.windSpeed,
    required this.weatherCode,
  });
}

class HourlyWeatherModel {
  final DateTime time;
  final int temperature;
  final int precipitation;
  final int weatherCode;

  HourlyWeatherModel({
    required this.time,
    required this.temperature,
    required this.precipitation,
    required this.weatherCode,
  });
}

class DailyWeatherModel {
  final DateTime time;
  final int temperatureMax;
  final int temperatureMin;
  final int weatherCode;

  DailyWeatherModel({
    required this.time,
    required this.temperatureMax,
    required this.temperatureMin,
    required this.weatherCode,
  });
}

class WeatherPackage {
  final CurrentWeatherModel currentWeather;
  final List<HourlyWeatherModel> hourlyWeather;
  final List<DailyWeatherModel> dailyWeather;

  WeatherPackage({
    required this.currentWeather,
    required this.hourlyWeather,
    required this.dailyWeather,
  });
}
