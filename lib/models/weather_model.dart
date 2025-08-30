class CurrentWeatherModel {
  final DateTime time;
  final int temperature;
  final int feelsLike;
  final int humidity;
  final int precipitation;
  final int windSpeed;
  final int weatherCode;
  final int isDay;

  CurrentWeatherModel({
    required this.time,
    required this.temperature,
    required this.feelsLike,
    required this.humidity,
    required this.precipitation,
    required this.windSpeed,
    required this.weatherCode,
    required this.isDay,
  });

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherModel(
      time: DateTime.parse(json['time']),
      temperature: json['temperature'],
      feelsLike: json['feelsLike'],
      humidity: json['humidity'],
      precipitation: json['precipitation'],
      windSpeed: json['windSpeed'],
      weatherCode: json['weatherCode'],
      isDay: json['isDay'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time.toIso8601String(),
      'temperature': temperature,
      'feelsLike': feelsLike,
      'humidity': humidity,
      'precipitation': precipitation,
      'windSpeed': windSpeed,
      'weatherCode': weatherCode,
      'isDay': isDay,
    };
  }
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

  factory HourlyWeatherModel.fromJson(Map<String, dynamic> json) {
    return HourlyWeatherModel(
      time: DateTime.parse(json['time']),
      temperature: json['temperature'],
      precipitation: json['precipitation'],
      weatherCode: json['weatherCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time.toIso8601String(),
      'temperature': temperature,
      'precipitation': precipitation,
      'weatherCode': weatherCode,
    };
  }
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

  factory DailyWeatherModel.fromJson(Map<String, dynamic> json) {
    return DailyWeatherModel(
      time: DateTime.parse(json['time']),
      temperatureMax: json['temperatureMax'],
      temperatureMin: json['temperatureMin'],
      weatherCode: json['weatherCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time.toIso8601String(),
      'temperatureMax': temperatureMax,
      'temperatureMin': temperatureMin,
      'weatherCode': weatherCode,
    };
  }
}

class WeatherPackage {
  final CurrentWeatherModel currentWeather;
  final List<HourlyWeatherModel> hourlyWeather;
  final List<DailyWeatherModel> dailyWeather;
  final DateTime referenceTime;

  WeatherPackage({
    required this.currentWeather,
    required this.hourlyWeather,
    required this.dailyWeather,
    required this.referenceTime,
  });

  factory WeatherPackage.fromJson(Map<String, dynamic> json) {
    return WeatherPackage(
      currentWeather: CurrentWeatherModel.fromJson(json['currentWeather']),
      hourlyWeather: (json['hourlyWeather'] as List)
          .map((item) => HourlyWeatherModel.fromJson(item))
          .toList(),
      dailyWeather: (json['dailyWeather'] as List)
          .map((item) => DailyWeatherModel.fromJson(item))
          .toList(),
      referenceTime: DateTime.parse(json['referenceTime']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'currentWeather': currentWeather.toJson(),
      'hourlyWeather': hourlyWeather.map((item) => item.toJson()).toList(),
      'dailyWeather': dailyWeather.map((item) => item.toJson()).toList(),
      'referenceTime': referenceTime.toIso8601String(),
    };
  }
}
