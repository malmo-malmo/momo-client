import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:momo_flutter/features/profile/widgets/nickname_input_field.dart';
import 'package:momo_flutter/features/profile/widgets/university_input_field.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/widgets/button/bottom_button.dart';
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
            child: LayoutBuilder(builder: (context, constraint) {
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
                          Row(
                            children: [
                              CityInputBox(
                                city: ref.watch(userInfoRequestProvider.notifier).userCity,
                                setCity: ref.watch(userInfoRequestProvider.notifier).setUserCity,
                              ),
                              const SizedBox(width: 24),
                              DistrictInputBox(
                                district: userInfo.district,
                                cityCode: userInfo.city,
                                setDistrict: ref.watch(userInfoRequestProvider.notifier).setUserDistrict,
                              ),
                            ],
                          ),
                          const SizedBox(height: 200),
                        ],
                      ),
                      BottomButton(
                        isEnable: true,
                        buttonTitle: AppStrings.next,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
