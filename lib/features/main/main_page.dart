import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:momo_flutter/features/main/calendar/calendar_page.dart';
import 'package:momo_flutter/features/main/home/home_page.dart';
import 'package:momo_flutter/features/main/my_group/my_group_page.dart';
import 'package:momo_flutter/features/main/mypage/mypage.dart';
import 'package:momo_flutter/features/main/search/search_page.dart';
import 'package:momo_flutter/resources/resources.dart';

final bottomTabIndexProvider = StateProvider<int>((ref) => 0);

DateTime? backbuttonpressedTime;

class MainPage extends StatelessWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  static const routeName = 'MainPage';

  final _pages = const [
    HomePage(),
    SearchPage(),
    CalendarPage(),
    MyGroupPage(),
    Mypage(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Consumer(
        builder: (context, ref, child) {
          final _index = ref.watch(bottomTabIndexProvider);
          return _pages[_index];
        },
      ),
    );
  }

  Future<bool> _onWillPop() async {
    DateTime currentTime = DateTime.now();

    final backButton =
        backbuttonpressedTime == null || currentTime.difference(backbuttonpressedTime!) > const Duration(seconds: 1);

    if (backButton) {
      backbuttonpressedTime = currentTime;
      Fluttertoast.showToast(
        msg: AppStrings.backButtomInformation,
        backgroundColor: AppColors.purple,
        textColor: AppColors.gray0,
        fontSize: 16,
      );
      return false;
    }
    return true;
  }
}
