import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/features/onboard/onboard_page.dart';
import 'package:momo_flutter/features/profile/provider/profile_update_provider.dart';
import 'package:momo_flutter/features/profile/widgets/nickname_input_field.dart';
import 'package:momo_flutter/features/profile/widgets/university_input_field.dart';
import 'package:momo_flutter/provider/loading_provider.dart';
import 'package:momo_flutter/provider/user_provider.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/widgets/button/bottom_button.dart';
import 'package:momo_flutter/widgets/indicator/custom_loader.dart';
import 'package:momo_flutter/widgets/input_field/city_input_field.dart';
import 'package:momo_flutter/widgets/input_field/district_input_field.dart';
import 'package:momo_flutter/widgets/title/main_title.dart';
import 'package:momo_flutter/widgets/title/sub_title.dart';

class IntroProfilePage extends StatelessWidget {
  const IntroProfilePage({Key? key}) : super(key: key);

  static const routeName = 'IntroProfilePage';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            Scaffold(
              backgroundColor: AppColors.gray1,
              body: Padding(
                padding: const EdgeInsets.only(bottom: 16, right: 20, left: 20),
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height >= 800 ? MediaQuery.of(context).size.height : 800,
                    child: Column(
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
                        const SizedBox(height: 30),
                        const SubTitle(AppStrings.university),
                        const SizedBox(height: 16),
                        const UniversityInputField(
                          color: AppColors.backgroundWhite,
                        ),
                        const SizedBox(height: 30),
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
                                  color: AppColors.backgroundWhite,
                                ),
                                const SizedBox(width: 24),
                                DistrictInputField(
                                  district: updateProfileData.district,
                                  color: AppColors.backgroundWhite,
                                  cityCode: updateProfileData.city,
                                  setDistrict: ref.read(profileUpdateStateProvider.notifier).setUserDistrict,
                                ),
                              ],
                            );
                          },
                        ),
                        const Spacer(),
                        Consumer(
                          builder: (context, ref, child) {
                            final validateNickname = ref.watch(vaildatioinNicknameProvider);
                            final updateRequest = ref.watch(profileUpdateStateProvider);
                            final isValid = ref.watch(profileUpdateCheckProvider);
                            return BottomButton(
                              isEnable: !validateNickname && isValid,
                              buttonTitle: AppStrings.next,
                              onPressed: () async {
                                ref.read(loadingProvider.state).state = true;
                                await ref.read(userDataStateProvider.notifier).updateUserData(updateRequest);
                                ref.read(loadingProvider.state).state = false;
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
                ),
              ),
            ),
            ...customLoader,
          ],
        ),
      ),
    );
  }
}
