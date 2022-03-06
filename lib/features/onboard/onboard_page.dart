import 'package:flutter/material.dart';
import 'package:momo_flutter/features/onboard/widgets/onboard_card.dart';
import 'package:momo_flutter/features/onboard/widgets/onboard_start_card.dart';
import 'package:momo_flutter/resources/resources.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({Key? key}) : super(key: key);

  static const routeName = 'OnboardPage';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.purple,
        body: PageView(
          children: const [
            OnboardingCard(
              topIcon: AppIcons.onboard1,
              title: AppStrings.onboardTitle1,
              img: AppImages.onboard1,
            ),
            OnboardingCard(
              topIcon: AppIcons.onboard2,
              title: AppStrings.onboardTitle2,
              img: AppImages.onboard2,
            ),
            OnboardingCard(
              topIcon: AppIcons.onboard3,
              title: AppStrings.onboardTitle3,
              img: AppImages.onboard3,
            ),
            OnboardStartCard(),
          ],
        ),
      ),
    );
  }
}
