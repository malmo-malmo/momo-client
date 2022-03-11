import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/app_config.dart';
import 'package:momo_flutter/data/models/user/user_update_request.dart';
import 'package:momo_flutter/features/profile/provider/profile_update_provider.dart';
import 'package:momo_flutter/features/profile/widgets/nickname_input_field.dart';
import 'package:momo_flutter/features/profile/widgets/university_input_field.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/utils/load_asset.dart';
import 'package:momo_flutter/widgets/button/action_button.dart';
import 'package:momo_flutter/widgets/card/profile_image_card.dart';
import 'package:momo_flutter/widgets/card/profile_image_card_with_file.dart';
import 'package:momo_flutter/widgets/input_field/city_input_field.dart';
import 'package:momo_flutter/widgets/input_field/district_input_field.dart';
import 'package:momo_flutter/widgets/title/sub_title.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage(
    this.userUpdateRequest, {
    Key? key,
  }) : super(key: key);

  final UserUpdateRequest userUpdateRequest;

  static const routeName = 'EditProfilePage';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundWhite,
        appBar: AppBar(
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(CupertinoIcons.back),
          ),
          title: const Text(AppStrings.managementProfile),
          actions: [
            ActionButton(
              buttonTitle: AppStrings.complete,
              onPressed: () => Navigator.pushNamed(
                context,
                EditProfilePage.routeName,
              ),
              isEnable: true,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Container(
              constraints: const BoxConstraints(minHeight: 800),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 60),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 102,
                      width: 102,
                      child: Consumer(
                        builder: (context, ref, child) {
                          final fileImage = ref.watch(profileUpdateStateProvider).imagePath;
                          return Stack(
                            children: [
                              fileImage.isEmpty
                                  ? ProfileImageCard(
                                      img: userUpdateRequest.imagePath,
                                      rad: 50,
                                      backgroundColor: AppColors.purple,
                                    )
                                  : ProfileImageCardWithFile(fileImage),
                              Positioned(
                                right: 0,
                                bottom: 0,
                                child: InkWell(
                                  onTap: () async {},
                                  child: CircleAvatar(
                                    radius: 17,
                                    backgroundColor: AppColors.purple,
                                    child: Center(
                                      child: loadAsset(AppIcons.squareCamera),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  const SubTitle(AppStrings.nickname),
                  NicknameInputField(
                    initialValue: userUpdateRequest.nickname,
                  ),
                  const SubTitle(AppStrings.university),
                  UniversityInputField(
                    initialValue: userUpdateRequest.university,
                  ),
                  const SubTitle(AppStrings.area),
                  Consumer(
                    builder: (context, ref, child) {
                      final updateProfileData = ref.watch(profileUpdateStateProvider);
                      return Row(
                        children: [
                          CityInputField(
                            initialValue: AppConfig.locationCodeNamePair
                                .where((e) => e.code == updateProfileData.city)
                                .first
                                .name,
                            city: ref.watch(profileUpdateStateProvider.notifier).userCity,
                            setCity: ref.read(profileUpdateStateProvider.notifier).setUserCity,
                          ),
                          const SizedBox(width: 24),
                          DistrictInputField(
                            initialCityCode: updateProfileData.city,
                            initialDistrict: updateProfileData.district,
                            district: updateProfileData.district,
                            cityCode: updateProfileData.city,
                            setDistrict: ref.read(profileUpdateStateProvider.notifier).setUserDistrict,
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
