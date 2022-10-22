import 'package:intl/intl.dart';

class DateFormatHelper {
  static String getPublishDatePastFormatString(DateTime date) {
    return DateFormat('yyyy/MM/dd HH:mm').format(date);
  }
}

extension DateTimeFormat on DateTime {
  String get getPublishDatePastFormatString {
    return DateFormatHelper.getPublishDatePastFormatString(this);
  }
}
