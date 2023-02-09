part of '../utils.dart';

class DateUtils {
  static const List<String> normalFullFormat = [
    HH,
    ':',
    nn,
    ' - ',
    dd,
    '/',
    mm,
    '/',
    yyyy
  ];

  static const List<String> transactionFormat = [
    HH,
    ':',
    nn,
    ' - ',
    dd,
    ' thg ',
    mm,
    ', ',
    yyyy
  ];

  static const List<String> normalDateFormat = [dd, '/', mm, '/', yyyy];

  static const List<String> dateOfWeekFormat = [
    D,
    ', ',
    dd,
    ' thg ',
    mm,
    ', ',
    yyyy
  ];

  static const List<String> normalUTCFormat = [yyyy, '/', mm, '/', dd];

  static const List<String> vnDateOnly = [dd, ' tháng ', mm, ', ', yyyy];
}

extension DateUtilsExtention on DateTime {
  String serverToTransaction() {
    return formatDate(
      toLocal(),
      DateUtils.transactionFormat,
    );
  }

  String serverToNormalDateFormat() {
    return formatDate(
      toLocal(),
      DateUtils.normalDateFormat,
    );
  }

  String toNormalDateFormat() {
    return formatDate(
      this,
      DateUtils.normalDateFormat,
    );
  }

  String serverToNormalFullFormat() {
    return formatDate(
      toLocal(),
      DateUtils.normalFullFormat,
    );
  }

  String serverToDateOfWeek() {
    return formatDate(
      toLocal(),
      DateUtils.dateOfWeekFormat,
    );
  }

  String serverToVnDateOnly() {
    return formatDate(
      toLocal(),
      DateUtils.vnDateOnly,
    );
  }

  String toServerNormalUTCFormat() {
    return formatDate(
      toUtc(),
      DateUtils.normalUTCFormat,
    );
  }
}
