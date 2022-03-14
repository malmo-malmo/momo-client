import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:momo_flutter/resources/resources.dart';

Widget calendarDowBuilder(
  BuildContext context,
  DateTime date, {
  TextStyle? dowTextStyle,
}) {
  var cur = DateFormat('EEEE').format(date);
  if (cur == 'Sunday') {
    return Center(
      child: Text(
        cur.substring(0, 3),
        style: dowTextStyle ??
            AppStyles.regular12.copyWith(
              color: Colors.red,
            ),
      ),
    );
  } else if (cur == 'Saturday') {
    return Center(
      child: Text(
        cur.substring(0, 3),
        style: dowTextStyle ??
            AppStyles.regular12.copyWith(
              color: Colors.blue,
            ),
      ),
    );
  }
  return Center(
    child: Text(
      cur.substring(0, 3),
      style: dowTextStyle ??
          AppStyles.regular12.copyWith(
            color: AppColors.gray6,
          ),
    ),
  );
}
