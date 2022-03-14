import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:momo_flutter/resources/resources.dart';

Widget calendarDefaultBuilder(
  BuildContext context,
  DateTime day,
  DateTime focusedDay, {
  TextStyle? defaultTextStyle,
}) {
  var cur = DateFormat('EEEE').format(day);
  if (cur == 'Sunday') {
    return Center(
      child: Text(
        '${day.day}',
        style: defaultTextStyle ??
            AppStyles.regular12.copyWith(
              color: Colors.red,
            ),
      ),
    );
  } else if (cur == 'Saturday') {
    return Center(
      child: Text(
        '${day.day}',
        style: defaultTextStyle ??
            AppStyles.regular12.copyWith(
              color: Colors.blue,
            ),
      ),
    );
  } else {
    return Center(
      child: Text(
        '${day.day}',
        style: defaultTextStyle ?? AppStyles.regular12,
      ),
    );
  }
}
