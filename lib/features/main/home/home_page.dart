import 'package:flutter/material.dart';
import 'package:momo_flutter/features/main/main_bottom_navigation_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('홈페이지'),
      ),
      bottomNavigationBar: MainBottomNavigationBar(),
    );
  }
}
