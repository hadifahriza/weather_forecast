import 'package:intl/intl.dart';

class DatetimeConverter {
  const DatetimeConverter._();

  static int maxEpochDigits = 13; // maximum Sat Nov 20 2286 17:46:39 UTC

  static DateTime epochToDateTime(int millisecondsSinceEpoch, {bool isUtc = false}) {
    final epochDigits = millisecondsSinceEpoch.toString().length;
    if (epochDigits < maxEpochDigits) {
      int multiplier = 1;

      for (var _ in List.generate(maxEpochDigits - epochDigits, (index) => index)) {
        multiplier = multiplier * 10;
      }

      return DateTime.fromMillisecondsSinceEpoch(
        millisecondsSinceEpoch * multiplier,
        isUtc: isUtc,
      );
    } else {
      return DateTime.fromMillisecondsSinceEpoch(
        millisecondsSinceEpoch,
        isUtc: isUtc,
      );
    }
  }

  static String formattedDateTime(DateTime dateTime) {
    final dateFormatter = DateFormat("yyyy-MM-ddTHH:mm:ss.0000");
    return dateFormatter.format(dateTime);
  }

  static String formattedDate(DateTime dateTime) {
    final dateFormatter = DateFormat("yyyy-MM-dd");
    return dateFormatter.format(dateTime);
  }

  static String hourMinuteOnly(DateTime dateTime) {
    final dateFormatter = DateFormat("hh:mm");
    return dateFormatter.format(dateTime);
  }

  static String dateMonthOnly(DateTime dateTime) {
    final dateFormatter = DateFormat("E MMMM dd");
    return dateFormatter.format(dateTime);
  }

  static String dateNameOnly(DateTime dateTime) {
    final dateFormatter = DateFormat("E");
    return dateFormatter.format(dateTime);
  }

  static String dateOnly(DateTime dateTime) {
    final dateFormatter = DateFormat("dd");
    return dateFormatter.format(dateTime);
  }

  static String monthOnly(DateTime dateTime) {
    final dateFormatter = DateFormat("MMMM");
    return dateFormatter.format(dateTime);
  }
}

/*
Notes
- 9999999999999 (13 digits) means Sat Nov 20 2286 17:46:39 UTC
- 999999999999 (12 digits) means Sun Sep 09 2001 01:46:39 UTC
- 99999999999 (11 digits) means Sat Mar 03 1973 09:46:39 UTC
*/
