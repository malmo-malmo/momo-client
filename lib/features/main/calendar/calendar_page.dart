import 'package:flutter/material.dart';
import 'package:momo_flutter/features/main/main_bottom_navigation_bar.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('캘린더 페이지'),
      ),
      bottomNavigationBar: MainBottomNavigationBar(),
    );
  }
}
