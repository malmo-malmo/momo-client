import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:momo_flutter/features/post/manage_post_page.dart';
import 'package:momo_flutter/features/profile/profile_page.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/widgets/button/bottom_button.dart';
import 'package:momo_flutter/widgets/dialog/question_dialog.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  static const routeName = 'SettingPage';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(CupertinoIcons.back),
          ),
          title: const Text(AppStrings.setting),
          backgroundColor: AppColors.backgroundWhite,
        ),
        backgroundColor: AppColors.gray1,
        body: Column(
          children: [
            _SettingMenuCard(
              title: AppStrings.managementProfile,
              onTap: () => Navigator.pushNamed(
                context,
                ProfilePage.routeName,
              ),
            ),
            _SettingMenuCard(
              title: AppStrings.managementPost,
              onTap: () => Navigator.pushNamed(
                context,
                ManagePostPage.routeName,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: BottomButton(
                isEnable: true,
                buttonTitle: AppStrings.momoLogout,
                onPressed: () async {
                  final result = await showDialog<bool?>(
                    context: context,
                    builder: (_) => const QuestionDialog(
                      dialogText: AppStrings.logoutQustion,
                      yesText: AppStrings.logout,
                      noText: AppStrings.no,
                    ),
                  );
                  if (result != null) {}
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingMenuCard extends StatelessWidget {
  const _SettingMenuCard({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: AppColors.backgroundWhite,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: AppStyles.bold16,
          ),
          InkWell(
            onTap: () {
              onTap();
            },
            child: Transform.rotate(
              angle: pi,
              child: const Icon(
                CupertinoIcons.back,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
