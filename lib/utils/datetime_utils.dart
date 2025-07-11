import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  /// Format yMd
  ///
  /// result
  /// ```
  /// -> 7/10/1996
  /// -> 7-10-1996  // result with separator '-'
  /// ```
  String yMd([String? separator, String locale = 'id']) => separator != null
      ? DateFormat.yMd(locale).format(this).replaceAll('/', separator)
      : DateFormat.yMd(locale).format(this);

  /// Format yMMMd
  ///
  /// result
  /// ```
  /// -> 7 Okt 1996
  /// ```
  String yMMMd([String locale = 'id']) => DateFormat.yMMMd(locale).format(this);

  /// Format yMMMMd
  ///
  /// result
  /// ```
  /// -> 7 Oktober 1996
  /// ```
  String yMMMMd([String locale = 'id']) => DateFormat.yMMMMd(locale).format(this);

  // a hour is force using locale 'en' because it using ':' separator
  // beside it for 'id' it using '.'
  // vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv

  /// Format hm
  ///
  /// result
  /// ```
  /// -> 17:08 // force 24 hour time
  /// ```
  String hm([String locale = 'en']) => DateFormat.Hm(locale).format(this);

  /// Format hms
  ///
  /// result
  /// ```
  /// -> 17:08:01 // force 24 hour time
  /// ```
  String hms([String locale = 'en']) => DateFormat.Hms(locale).format(this);

  /// Format jm
  ///
  /// result
  /// ```
  /// -> 5:08 PM
  /// ```
  String jm([String locale = 'en']) => DateFormat.jm(locale).format(this);

  /// Format jms
  ///
  /// result
  /// ```
  /// -> 5:08:01 PM
  /// ```
  String jms([String locale = 'en']) => DateFormat.jms(locale).format(this);

  /// Format dbTime
  ///
  /// result
  /// ```
  /// // Ussualy this used for Database time format
  /// -> 17:08:01
  /// ```
  String dbTime() => DateFormat('HH:mm:ss').format(this);

  /// Format dbDate
  ///
  /// result
  /// ```
  /// // Ussualy this used for Database date format
  /// -> 1996-10-07
  /// ```
  String dbDate() => DateFormat('yyyy-MM-dd').format(this);

  /// Format dbDateTime
  ///
  /// result
  /// ```
  /// // Ussualy this used for Database date time format
  /// -> 1996-10-07 17:08:01
  /// ```
  String dbDateTime() => DateFormat('yyyy-MM-dd HH:mm:ss').format(this);

  /// Format custom
  ///
  /// locale = 'id' | 'en'
  ///
  /// Example
  /// ```
  /// 'yyyy-MM-dd'             -> 1996-10-07 (Database format)
  /// 'd-MM-yyyy'              -> 7-10-1996
  /// 'd MMM yyyy' | 'yMMMd'   -> 7 Okt 1996
  /// 'd MMMM yyyy' | 'yMMMMd' -> 7 Oktober 1996
  /// 'E, d MMM yyyy'          -> Sel, 7 Okt 1996
  /// 'EEEE, d MMM yyyy'       -> Selasa, 7 Okt 1996
  /// 'HH:mm'                  -> 17:08
  /// 'HH:mm:ss'               -> 17:08:01
  /// 'hh:mm a'                -> 05:08 PM
  /// 'hh:mm:ss a'             -> 05:08:01 PM
  /// ```
  String custom(String pattern, [String locale = 'id']) => DateFormat(pattern, locale).format(this);

  /// Format dMYHm
  ///
  /// result
  /// ```
  /// 'd-MM-yyyy HH:mm' -> 7-10-1996 17:08
  /// ```
  String dMYHm() => DateFormat('d-MM-yyyy HH:mm').format(this);

  /// Format dMYHms
  ///
  /// result
  /// ```
  /// 'd-MM-yyyy HH:mm:ss' -> 7-10-1996 17:08:01
  /// ```
  String dMYHms() => DateFormat('d-MM-yyyy HH:mm:ss').format(this);

  String toTimeStamp() => DateFormat('yyyy-MM-dd HH:mm:ss').format(this);

  int tzOffset() => DateTime.now().timeZoneOffset.inHours;

  DateTime toLocalZ() {
    int offset = DateTime.now().timeZoneOffset.inHours;
    return add(Duration(hours: offset));
  }

  /// The [weekday] may be 0 for Sunday, 1 for Monday, etc. up to 7 for Sunday.
  DateTime mostRecentWeekday(DateTime date, int weekday) =>
      DateTime(date.year, date.month, date.day - (date.weekday - weekday) % 7);

  String weekdayName([int? weekday, String locale = 'id']) {
    dynamic dayDataEn = {
      "1": "Monday",
      "2": "Tuesday",
      "3": "Wednesday",
      "4": "Thrusday",
      "5": "Friday",
      "6": "Saturday",
      "7": "Sunday"
    };
    dynamic dayDataId = {
      "1": "Senin",
      "2": "Selasa",
      "3": "Rabu",
      "4": "Kamis",
      "5": "Jum'at",
      "6": "Sabtu",
      "7": "Minggu"
    };
    if (weekday != null) {
      if (locale == 'id') {
        return dayDataId[weekday.toString()];
      }
      return dayDataEn[weekday.toString()];
    }
    return DateFormat.EEEE(locale).format(this);
  }

  String timeFormat({int? hour, String format = 'hh:mm a'}) => copyWith(hour: hour, minute: 0).custom(format);
}

extension TimeOfDayExtension on TimeOfDay {
  bool isBefore(TimeOfDay other) {
    if (hour < other.hour) return true;
    if (hour == other.hour) {
      if (minute < other.minute) return true;
    }
    return false;
  }

  bool isAfter(TimeOfDay other) {
    if (hour > other.hour) return true;
    if (hour == other.hour) {
      if (minute > other.minute) return true;
    }
    return false;
  }

  String encode() {
    int hour = this.hour;
    int minute = this.minute;
    return '$hour:$minute';
  }

  String formatAMPM() {
    String time = '${hourOfPeriod.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
    return period == DayPeriod.am ? '$time AM' : '$time PM';
  }

  String format24() {
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }
}

extension DateTimeConversion on int {
  DateTime toDateTime() => DateTime.fromMillisecondsSinceEpoch(this * 1000);
}

extension StringConversionDateTime on String {
  DateTime toTime() {
    final items = split(':');
    if (items.isNotEmpty) {
      final hour = int.tryParse(items[0]);
      final minute = int.tryParse(items[1]);
      final second = items.length > 2 ? int.tryParse(items[2]) : 0;

      return DateTime.now().copyWith(hour: hour, minute: minute, second: second);
    }
    return DateTime.now();
  }

  DateTime toDateTime([String? format]) {
    if (format != null) {
      return DateFormat(format).parse(this);
    }
    return DateTime.parse(this);
  }
}

extension DurationExtension on Duration {
  String toHHNNSS() {
    String hh = inHours.toString().padLeft(2, "0");
    String nn = inMinutes.remainder(60).toString().padLeft(2, "0");
    String ss = inSeconds.remainder(60).toString().padLeft(2, "0");
    return '$hh:$nn:$ss';
  }
}
