import 'package:flutter/material.dart';
import 'package:momo_flutter/resources/resources.dart';

class StepIndicator extends StatelessWidget {
  const StepIndicator({
    Key? key,
    required this.currentIndex,
    required this.length,
  }) : super(key: key);

  final int length;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 6,
      width: (length * 2 - 1) * 6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (int i = 0; i < length; i++) _IndicatorCircle(i == currentIndex),
        ],
      ),
    );
  }
}

class _IndicatorCircle extends StatelessWidget {
  const _IndicatorCircle(this.check, {Key? key}) : super(key: key);

  final bool check;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 3,
      backgroundColor: check ? AppColors.gray4 : AppColors.gray3,
    );
  }
}
