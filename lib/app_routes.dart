import 'package:flutter/material.dart';
import 'package:momo_flutter/data/models/user/user_update_request.dart';
import 'package:momo_flutter/features/gallery/gallery_page.dart';
import 'package:momo_flutter/features/intro/terms_page.dart';
import 'package:momo_flutter/features/main/main_page.dart';
import 'package:momo_flutter/features/onboard/onboard_page.dart';
import 'package:momo_flutter/features/post/manage_post_page.dart';
import 'package:momo_flutter/features/post/post_detail_page.dart';
import 'package:momo_flutter/features/profile/edit_category_page.dart';
import 'package:momo_flutter/features/profile/edit_profile_page.dart';
import 'package:momo_flutter/features/profile/intro_category_page.dart';
import 'package:momo_flutter/features/profile/intro_profile_page.dart';
import 'package:momo_flutter/features/profile/profile_page.dart';
import 'package:momo_flutter/features/setting/setting_page.dart';

abstract class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
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
      case SettingPage.routeName:
        _page = const SettingPage();
        break;
      case ProfilePage.routeName:
        _page = const ProfilePage();
        break;
      case ManagePostPage.routeName:
        _page = const ManagePostPage();
        break;
      case EditProfilePage.routeName:
        final userUpdateRequest = settings.arguments as UserUpdateRequest;
        _page = EditProfilePage(userUpdateRequest);
        break;
      case GalleryPage.routeName:
        final photoRequestType = settings.arguments as PhotoRequestType;
        _page = GalleryPage(photoRequestType);
        break;
      case EditCategoryPage.routeName:
        final initialState = settings.arguments as List<bool>;
        _page = EditCategoryPage(initialState);
        break;
      case PostDetailPage.routeName:
        final postId = settings.arguments as int;
        _page = PostDetailPage(postId);
        break;
      default:
        break;
    }
    return MaterialPageRoute(
      builder: (context) => _page,
    );
  }
}
