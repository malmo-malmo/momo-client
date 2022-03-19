import 'package:flutter/material.dart';
import 'package:momo_flutter/features/main/main_page.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/utils/load_asset.dart';
import 'package:momo_flutter/widgets/button/bottom_button.dart';

class OnboardStartCard extends StatelessWidget {
  const OnboardStartCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.gray1,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 138),
            SizedBox(
              height: 257,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const _OnboardSideImage(
                    AppImages.onboard4Left,
                  ),
                  Image.asset(
                    AppImages.onboard4Center,
                  ),
                  const _OnboardSideImage(
                    AppImages.onboard4Right,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 68),
            loadAsset(
              AppImages.onboard4Bottom,
              width: 190,
            ),
            const SizedBox(height: 20),
            Text(
              AppStrings.onboardTitle4,
              style: AppStyles.bold24.copyWith(
                color: AppColors.purple,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 52),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 36),
              child: BottomButton(
                isEnable: true,
                buttonTitle: AppStrings.startMomo,
                onPressed: () => Navigator.pushNamedAndRemoveUntil(
                  context,
                  MainPage.routeName,
                  (route) => false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardSideImage extends StatelessWidget {
  const _OnboardSideImage(
    this.image, {
    Key? key,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 216,
      child: AspectRatio(
        aspectRatio: 2 / 5,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitHeight,
              alignment: FractionalOffset.centerLeft,
              image: AssetImage(image),
            ),
          ),
        ),
      ),
    );
  }
}
