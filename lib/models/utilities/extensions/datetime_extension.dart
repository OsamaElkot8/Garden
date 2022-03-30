import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String yearMonthNameDayTwelveHours() {
    return DateFormat('yyyy MMMM d hh:mm a').format(this);
  }
}
