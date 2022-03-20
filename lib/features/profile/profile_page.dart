import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/data/models/user/user_update_request.dart';
import 'package:momo_flutter/features/profile/edit_profile_page.dart';
import 'package:momo_flutter/provider/user_provider.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/widgets/button/action_button.dart';
import 'package:momo_flutter/widgets/card/profile_image_card.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({Key? key}) : super(key: key);

  static const routeName = 'ProfilePage';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userDataStateProvider);

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
                arguments: UserUpdateRequest(
                  city: userData.city.code,
                  district: userData.district,
                  nickname: userData.nickname,
                  university: userData.university,
                  imagePath: userData.image!,
                ),
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
                  ProfileImageCard(
                    img: userData.image ?? 'https://github.com/malmo-malmo/momo-client/blob/develop/assets/splash.png',
                    rad: 50,
                    backgroundColor: AppColors.purple,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _UserProfileRow(
                        value: userData.nickname,
                        label: AppStrings.nickname,
                      ),
                      _UserProfileRow(
                        value: userData.university,
                        label: AppStrings.university,
                      ),
                      _UserProfileRow(
                        value: userData.city.name + ' ' + userData.district,
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
                  style: AppStyles.regular15.copyWith(
                    color: AppColors.gray4,
                  ),
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
