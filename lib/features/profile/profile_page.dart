import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:momo_flutter/features/profile/edit_profile_page.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/widgets/button/action_button.dart';
import 'package:momo_flutter/widgets/card/profile_image_card.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  static const routeName = 'ProfilePage';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(CupertinoIcons.back),
          ),
          title: const Text(AppStrings.managementProfile),
          actions: [
            ActionButton(
              buttonTitle: AppStrings.edit,
              onPressed: () => Navigator.pushNamed(
                context,
                EditProfilePage.routeName,
              ),
              isEnable: true,
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 60, right: 16, left: 16),
              height: 370,
              width: double.infinity,
              color: AppColors.backgroundWhite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const ProfileImageCard(
                    img: 'https://file.mk.co.kr/meet/neds/2020/08/image_readtop_2020_864116_15980534304326707.png',
                    rad: 50,
                    backgroundColor: AppColors.purple,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      _UserProfileRow(
                        value: '',
                        label: AppStrings.nickname,
                      ),
                      _UserProfileRow(
                        value: '',
                        label: AppStrings.university,
                      ),
                      _UserProfileRow(
                        value: '',
                        label: AppStrings.area,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40, left: 40),
              child: InkWell(
                onTap: () {},
                child: Text(
                  AppStrings.withdrawal,
                  style: AppStyles.regular15.copyWith(color: AppColors.gray4),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _UserProfileRow extends StatelessWidget {
  const _UserProfileRow({
    Key? key,
    required this.value,
    required this.label,
  }) : super(key: key);

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppStyles.bold16,
          ),
          Text(
            value,
            style: AppStyles.regular16,
          ),
        ],
      ),
    );
  }
}
