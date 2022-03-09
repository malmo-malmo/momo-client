import 'dart:developer';

import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:momo_flutter/app_config.dart';
import 'package:momo_flutter/data/models/auth/login_request.dart';
import 'package:momo_flutter/data/repositories/auth_repository.dart';
import 'package:momo_flutter/features/intro/terms_page.dart';
import 'package:momo_flutter/features/main/main_page.dart';
import 'package:momo_flutter/provider/user_provider.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/utils/load_asset.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.purple,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 64),
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                loadAsset(AppIcons.momo),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Consumer(
                    builder: (context, ref, child) {
                      return InkWell(
                        onTap: () async {
                          final _authCode = await _getAuthCode();
                          await ref
                              .read(authRepositoryProvider)
                              .login(
                                LoginRequest(
                                  provider: 'kakao',
                                  authorizationCode: '$_authCode',
                                  deviceCode: AppConfig.deviceCode,
                                ),
                              )
                              .catchError(
                                (error) => showDialog(
                                  context: context,
                                  builder: (context) => const Dialog(
                                    child: Text('로그인에 실패했습니다!\n\n다시 시도해주세요'),
                                  ),
                                ),
                              )
                              .then(
                            (value) async {
                              final _isFirstLogin = await ref.read(userDataStateProvider.notifier).isFirstLogin();
                              if (_isFirstLogin) {
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  TermsPage.routeName,
                                  (route) => false,
                                );
                              } else {
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  MainPage.routeName,
                                  (route) => false,
                                );
                              }
                            },
                          );
                        },
                        child: Container(
                          height: 56,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.kakaoYellow,
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 25),
                                  child: Icon(
                                    CupertinoIcons.chat_bubble_fill,
                                    color: AppColors.kakaoIcon,
                                    size: 18,
                                  ),
                                ),
                              ),
                              Text(
                                '카카오로 시작하기',
                                style: AppStyles.regular15.copyWith(
                                  fontWeight: AppDimens.bold,
                                  color: AppColors.kakaoText,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<String?> _getAuthCode() async {
    String? authCode;
    try {
      final check = await isKakaoTalkInstalled();
      authCode = check ? await AuthCodeClient.instance.requestWithTalk() : await AuthCodeClient.instance.request();
    } on KakaoAuthException catch (e) {
      log('KakaoAuthException: ${e.toString()}');
    } on KakaoClientException catch (e) {
      log('KakaoClientException: ${e.toString()}');
    } catch (e) {
      log('OnotherException: ${e.toString()}');
    }
    return authCode;
  }
}
