import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String yearMonthNameDayTwelveHours() {
    return DateFormat('yyyy MMMM d hh:mm a').format(this);
  }

  String defaultFormat() {
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(this);
  }
}
