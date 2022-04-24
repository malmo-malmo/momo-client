import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/data/datasources/local/app_database.dart';
import 'package:momo_flutter/features/intro/login_page.dart';
import 'package:momo_flutter/features/intro/terms_page.dart';
import 'package:momo_flutter/features/main/main_page.dart';
import 'package:momo_flutter/provider/user_provider.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/utils/load_asset.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  static const routeName = 'SplashPage';

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  initState() {
    super.initState();
    Future.microtask(() => _pushToNextPage());
  }

  Future<void> _pushToNextPage() async {
    final _tokenCheck = _hasNoToken();

    if (!_tokenCheck) {
      final _userDataCheck = await _isFirstLogin();
      if (!_userDataCheck) {
        Navigator.pushNamed(context, MainPage.routeName);
      } else {
        Navigator.pushNamed(context, TermsPage.routeName);
      }
    } else {
      Navigator.pushNamed(context, LoginPage.routeName);
    }
  }

  Future<bool> _isFirstLogin() async {
    final _isFirstLogin = await ref.read(userDataStateProvider.notifier).isFirstLogin();
    return _isFirstLogin;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.purple,
        body: Stack(
          alignment: Alignment.center,
          children: [
            loadAsset(AppIcons.momo),
            Align(
              alignment: Alignment.bottomCenter,
              child: loadAsset(AppIcons.branding),
            ),
          ],
        ),
      ),
    );
  }

  bool _hasNoToken() {
    final token = AppDatabase().getTokenData() ?? 'no token';
    return token == 'no token';
  }
}
