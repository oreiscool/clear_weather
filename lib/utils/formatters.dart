import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

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

  static String toKmh(double speed) {
    return '${speed.round()} km/h';
  }

  static String toMph(double speed) {
    return '${(speed * 0.621371).round()} mph';
  }

  static String toPercentage(double value) {
    return '${value.round()}%';
  }

  static String toRelativeTime(DateTime time) {
    timeago.setLocaleMessages('en_short', MyShortMessages());
    return timeago.format(time, locale: 'en_short');
  }
}

class MyShortMessages implements timeago.LookupMessages {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => '';
  @override
  String suffixAgo() => '';
  @override
  String suffixFromNow() => ' from now';
  @override
  String lessThanOneMinute(int seconds) => 'Now';
  @override
  String aboutAMinute(int minutes) => '1m ago';
  @override
  String minutes(int minutes) => '${minutes}m ago';
  @override
  String aboutAnHour(int minutes) => '1h ago';
  @override
  String hours(int hours) => '${hours}h ago';
  @override
  String aDay(int hours) => '1d ago';
  @override
  String days(int days) => '${days}d ago';
  @override
  String aboutAMonth(int days) => '1mo ago';
  @override
  String months(int months) => '${months}mo ago';
  @override
  String aboutAYear(int year) => '1y ago';
  @override
  String years(int years) => '${years}y ago';
  @override
  String wordSeparator() => ' ';
}
