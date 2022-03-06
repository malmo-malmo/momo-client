import 'package:flutter/material.dart';
import 'package:momo_flutter/features/main/main_bottom_navigation_bar.dart';

class MyGroupPage extends StatelessWidget {
  const MyGroupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('내 모임'),
      ),
      bottomNavigationBar: MainBottomNavigationBar(),
    );
  }
}
