import 'package:flutter/material.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/utils/load_asset.dart';

class OnboardingCard extends StatelessWidget {
  const OnboardingCard({
    Key? key,
    required this.topIcon,
    required this.title,
    required this.img,
  }) : super(key: key);

  final String topIcon;
  final String title;
  final String img;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 68),
          loadAsset(topIcon),
          const SizedBox(height: 24),
          Text(
            title,
            style: AppStyles.bold24,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 56),
          Image.asset(img),
        ],
      ),
    );
  }
}
