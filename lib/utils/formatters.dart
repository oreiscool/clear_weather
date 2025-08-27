import 'package:intl/intl.dart';

class Formatters {
  static String toDayofWeek(DateTime date) {
    return DateFormat.E().format(date);
  }
}
