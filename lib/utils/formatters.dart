import 'package:intl/intl.dart';

class Formatters {
  static String toDayofWeek(DateTime date) {
    return DateFormat.E().format(date);
  }

  static String toHour(DateTime time) {
    return DateFormat.Hm().format(time);
  }

  static String toCelcius(double temperature) {
    return '${temperature.round()}°';
  }

  static String toFahrenheit(double temperature) {
    return '${((temperature * 9 / 5) + 32).round()}°';
  }
}
