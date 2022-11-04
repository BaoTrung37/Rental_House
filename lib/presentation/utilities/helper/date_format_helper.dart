import 'package:intl/intl.dart';

class DateFormatHelper {
  static final secondsIn59Seconds = const Duration(seconds: 59).inSeconds;

  static final secondsIn59Minutes59Seconds =
      const Duration(minutes: 59, seconds: 59).inSeconds;

  static final secondsIn23Hours59Minutes59Seconds =
      const Duration(hours: 23, minutes: 59, seconds: 59).inSeconds;

  static final secondsIn6Days23Hours59Minutes59Seconds =
      const Duration(days: 6, hours: 23, minutes: 59, seconds: 59).inSeconds;

  static final millisecondsIn59Minutes59Seconds =
      DateFormatHelper.secondsIn59Minutes59Seconds * 1000;

  static String getPublishDatePastFormatString(
    DateTime postDate,
  ) {
    final compareDate = DateTime.now();
    final differenceDuration = compareDate.difference(postDate).abs();
    final differenceSeconds = differenceDuration.inSeconds;

    if (differenceSeconds <= secondsIn59Seconds) {
      return 'Bây giờ';
    }

    if (differenceSeconds <= secondsIn59Minutes59Seconds) {
      return '${differenceDuration.inMinutes} phút trước';
    }

    if (differenceSeconds <= secondsIn23Hours59Minutes59Seconds) {
      return '${differenceDuration.inHours} giờ trước';
    }

    return DateFormat('yyyy/MM/dd').format(postDate);
  }
}

extension DateTimeFormat on DateTime {
  String get getPublishDatePastFormatString {
    return DateFormatHelper.getPublishDatePastFormatString(this);
  }
}
