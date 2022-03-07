import 'package:flutter/material.dart';
import 'package:momo_flutter/features/intro/intro_category_page.dart';
import 'package:momo_flutter/features/intro/intro_profile_page.dart';
import 'package:momo_flutter/features/intro/terms_page.dart';
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
      case TermsPage.routeName:
        _page = const TermsPage();
        break;
      case IntroCategoryPage.routeName:
        _page = const IntroCategoryPage();
        break;
      case IntroProfilePage.routeName:
        _page = const IntroProfilePage();
        break;
      default:
        break;
    }
    return MaterialPageRoute(
      builder: (context) => _page,
    );
  }
}
