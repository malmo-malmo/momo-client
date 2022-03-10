import 'package:flutter/material.dart';
import 'package:momo_flutter/resources/resources.dart';

class OnOffCard extends StatelessWidget {
  const OnOffCard(
    this.onOff, {
    Key? key,
  }) : super(key: key);

  final bool onOff;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: onOff ? 54 : 65,
      height: 25,
      child: Center(
        child: Text(
          onOff ? AppStrings.online : AppStrings.offline,
          style: AppStyles.regular12.copyWith(
            color: onOff ? AppColors.purple : AppColors.gray0,
          ),
        ),
      ),
      decoration: AppStyles.containerDecoration(
        radius: 13,
        color: onOff ? AppColors.gray0 : AppColors.purple,
      ),
    );
  }
}
