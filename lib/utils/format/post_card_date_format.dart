import 'package:momo_flutter/utils/format/time_format.dart';

String postCardDateFormat(String dateTime) {
  final date = DateTime.parse(dateTime);
  final time = timeFormat(date.hour, date.minute);

  return '${date.year}년 ${date.month}월 ${date.day}일 $time';
}
