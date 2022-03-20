import 'package:flutter/material.dart';

class AttendanceListPageArg {
  final int groupId;
  final int scheduleId;
  final bool isCheck;

  AttendanceListPageArg({
    required this.groupId,
    required this.scheduleId,
    required this.isCheck,
  });
}

class AttendanceListPage extends StatelessWidget {
  const AttendanceListPage(this.arg, {Key? key}) : super(key: key);

  static const routeName = 'AttendanceListPage';

  final AttendanceListPageArg arg;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
