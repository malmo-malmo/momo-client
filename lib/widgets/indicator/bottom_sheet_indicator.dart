import 'package:flutter/material.dart';
import 'package:momo_flutter/resources/resources.dart';

class BottomSheetIndicator extends StatelessWidget {
  const BottomSheetIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.gray3,
      ),
    );
  }
}
