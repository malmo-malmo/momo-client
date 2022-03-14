import 'package:flutter/material.dart';
import 'package:momo_flutter/resources/resources.dart';

Widget? calendarTodayBuilder(
  BuildContext context,
  DateTime day,
  DateTime focusedDay,
) {
  if (day == focusedDay) {
    return Center(
      child: CircleAvatar(
        foregroundColor: Colors.transparent,
        backgroundColor: AppColors.purple,
        radius: 14,
        child: Text(
          '${day.day}',
          style: AppStyles.regular12,
        ),
      ),
    );
  }
  return null;
}
