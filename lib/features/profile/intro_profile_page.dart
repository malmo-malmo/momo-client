import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/features/onboard/onboard_page.dart';
import 'package:momo_flutter/features/profile/providers/profile_update_provider.dart';
import 'package:momo_flutter/features/profile/widgets/nickname_input_field.dart';
import 'package:momo_flutter/features/profile/widgets/university_input_field.dart';
import 'package:momo_flutter/providers/user_provider.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/widgets/button/bottom_button.dart';
import 'package:momo_flutter/widgets/input_field/city_input_field.dart';
import 'package:momo_flutter/widgets/input_field/district_input_field.dart';
import 'package:momo_flutter/widgets/text/main_title.dart';
import 'package:momo_flutter/widgets/text/sub_title.dart';

class IntroProfilePage extends StatelessWidget {
  const IntroProfilePage({Key? key}) : super(key: key);

  static const routeName = 'IntroProfilePage';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(bottom: 36, right: 20, left: 20),
            child: LayoutBuilder(
              builder: (context, constraint) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: constraint.maxHeight),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 45),
                            InkWell(
                              onTap: () => Navigator.pop(context),
                              child: const Icon(
                                CupertinoIcons.back,
                                color: AppColors.gray6,
                                size: 24,
                              ),
                            ),
                            const SizedBox(height: 25),
                            const MainTitle(AppStrings.introProfileTitle),
                            const SizedBox(height: 50),
                            const SubTitle(AppStrings.nickname),
                            const SizedBox(height: 16),
                            const NicknameInputField(
                              color: AppColors.backgroundWhite,
                            ),
                            const SubTitle(AppStrings.university),
                            const SizedBox(height: 16),
                            const UniversityInputField(),
                            const SubTitle(AppStrings.area),
                            const SizedBox(height: 16),
                            Consumer(
                              builder: (context, ref, child) {
                                final updateProfileData = ref.watch(profileUpdateStateProvider);
                                return Row(
                                  children: [
                                    CityInputField(
                                      city: ref.watch(profileUpdateStateProvider.notifier).userCity,
                                      setCity: ref.read(profileUpdateStateProvider.notifier).setUserCity,
                                    ),
                                    const SizedBox(width: 24),
                                    DistrictInputField(
                                      district: updateProfileData.district,
                                      cityCode: updateProfileData.city,
                                      setDistrict: ref.read(profileUpdateStateProvider.notifier).setUserDistrict,
                                    ),
                                  ],
                                );
                              },
                            ),
                            const SizedBox(height: 200),
                          ],
                        ),
                        Consumer(
                          builder: (context, ref, child) {
                            final validateNickname = ref.watch(vaildatioinNicknameProvider);
                            final updateRequest = ref.watch(profileUpdateStateProvider);
                            return BottomButton(
                              isEnable: validateNickname && ref.watch(profileUpdateStateProvider.notifier).isValid(),
                              buttonTitle: AppStrings.next,
                              onPressed: () async {
                                await ref.read(userDataStateProvider.notifier).updateUserData(updateRequest);
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  OnboardPage.routeName,
                                  (route) => false,
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
