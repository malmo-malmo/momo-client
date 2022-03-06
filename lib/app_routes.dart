import 'package:flutter/material.dart';
import 'package:momo_flutter/features/main/main_page.dart';
import 'package:momo_flutter/features/onboard/onboard_page.dart';

abstract class AppRoutes {
  static Route<dynamic>? onGenerateRoute(settings) {
    late Widget _page;

    switch (settings.name) {
      case OnboardPage.routeName:
        _page = const OnboardPage();
        break;
      case MainPage.routeName:
        _page = const MainPage();
        break;
      default:
        break;
    }
    return MaterialPageRoute(
      builder: (context) => _page,
    );
  }
}
