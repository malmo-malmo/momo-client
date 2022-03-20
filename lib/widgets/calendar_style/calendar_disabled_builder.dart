import 'package:flutter/material.dart';
import 'package:momo_flutter/resources/resources.dart';

Widget calendarDisabledBuilder(
  BuildContext context,
  DateTime day,
  DateTime focusedDay, {
  TextStyle? defaultTextStyle,
}) {
  return Center(
    child: Text(
      '${day.day}',
      style: defaultTextStyle ??
          AppStyles.regular12.copyWith(
            color: AppColors.gray4,
          ),
    ),
  );
}
