import 'package:flutter/material.dart';
import 'package:momo_flutter/features/main/main_bottom_navigation_bar.dart';

class Mypage extends StatelessWidget {
  const Mypage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('마이페이지'),
      ),
      bottomNavigationBar: MainBottomNavigationBar(),
    );
  }
}
