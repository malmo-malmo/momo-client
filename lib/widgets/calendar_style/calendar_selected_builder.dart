import 'package:flutter/material.dart';
import 'package:momo_flutter/resources/resources.dart';

Widget? calendarSelectedBuilder(
  DateTime date,
  DateTime selectedDay, {
  double? radius,
  TextStyle? selectTextStyle,
}) {
  if (date == selectedDay) {
    return Center(
      child: CircleAvatar(
        foregroundColor: Colors.transparent,
        backgroundColor: AppColors.purple,
        radius: radius ?? 14,
        child: Text(
          '${date.day}',
          style: selectTextStyle ?? AppStyles.regular12,
        ),
      ),
    );
  }
  return null;
}
