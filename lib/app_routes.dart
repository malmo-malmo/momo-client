import 'package:flutter/cupertino.dart';
import 'package:momo_flutter/data/models/user/user_update_request.dart';
import 'package:momo_flutter/features/%08report/report_page.dart';
import 'package:momo_flutter/features/gallery/gallery_page.dart';
import 'package:momo_flutter/features/group/group_authority_page.dart';
import 'package:momo_flutter/features/group/group_detail_page.dart';
import 'package:momo_flutter/features/group/group_list_page.dart';
import 'package:momo_flutter/features/group/recommend_group_list_page.dart';
import 'package:momo_flutter/features/images/full_image_page.dart';
import 'package:momo_flutter/features/images/full_image_page_view.dart';
import 'package:momo_flutter/features/intro/login_page.dart';
import 'package:momo_flutter/features/intro/terms_page.dart';
import 'package:momo_flutter/features/main/main_page.dart';
import 'package:momo_flutter/features/main/my_group/group_request_page.dart';
import 'package:momo_flutter/features/onboard/onboard_page.dart';
import 'package:momo_flutter/features/post/manage_post_page.dart';
import 'package:momo_flutter/features/post/notice_list_page.dart';
import 'package:momo_flutter/features/post/post_detail_page.dart';
import 'package:momo_flutter/features/post/post_request_page.dart';
import 'package:momo_flutter/features/profile/edit_category_page.dart';
import 'package:momo_flutter/features/profile/edit_profile_page.dart';
import 'package:momo_flutter/features/profile/intro_category_page.dart';
import 'package:momo_flutter/features/profile/intro_profile_page.dart';
import 'package:momo_flutter/features/profile/profile_page.dart';
import 'package:momo_flutter/features/schedule/schedule_list_page.dart';
import 'package:momo_flutter/features/schedule/schedule_request_page.dart';
import 'package:momo_flutter/features/setting/setting_page.dart';
import 'package:momo_flutter/splash_page.dart';

abstract class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    late Widget _page;

    switch (settings.name) {
      case SplashPage.routeName:
        _page = const SplashPage();
        break;
      case LoginPage.routeName:
        _page = const LoginPage();
        break;
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
      case GroupListPage.routeName:
        final groupListArg = settings.arguments as GroupListArg;
        _page = GroupListPage(
          name: groupListArg.name,
          likeCallback: groupListArg.likeCallback,
        );
        break;
      case RecommendGroupListPage.routeName:
        final likeCallback = settings.arguments as void Function({
          required int groupId,
          required bool like,
        });
        _page = RecommendGroupListPage(likeCallback);
        break;
      case GroupDetailPage.routeName:
        final groupId = settings.arguments as int;
        _page = GroupDetailPage(groupId);
        break;
      case NoticeListPage.routeName:
        final groupId = settings.arguments as int;
        _page = NoticeListPage(groupId);
        break;
      case PostRequestPage.routeName:
        final postRequestArg = settings.arguments as PostRequestArg;
        _page = PostRequestPage(postRequestArg);
        break;
      case ScheduleRequestPage.routeName:
        final groupId = settings.arguments as int;
        _page = ScheduleRequestPage(groupId);
        break;
      case GroupAuthorityPage.routeName:
        final groupId = settings.arguments as int;
        _page = GroupAuthorityPage(groupId);
        break;
      case FullImagePage.routeName:
        final image = settings.arguments as String;
        _page = FullImagePage(image);
        break;
      case FullImagePageView.routeName:
        final images = settings.arguments as List<String>;
        _page = FullImagePageView(images);
        break;
      case ReportPage.routeName:
        _page = const ReportPage();
        break;
      case GroupRequestPage.routeName:
        _page = const GroupRequestPage();
        break;
      case ScheduleListPage.routeName:
        final groupId = settings.arguments as int;
        _page = ScheduleListPage(groupId);
        break;
      default:
        break;
    }

    return CupertinoPageRoute(builder: (context) => _page);
  }
}
