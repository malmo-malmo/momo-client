import 'package:flutter/material.dart';
import 'package:momo_flutter/resources/resources.dart';

class ReverseBottomButton extends StatelessWidget {
  const ReverseBottomButton({
    Key? key,
    required this.buttonTitle,
    required this.onPressed,
  }) : super(key: key);

  final String buttonTitle;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.gray3),
          foregroundColor: MaterialStateProperty.all(AppColors.gray5),
        ),
        onPressed: () => onPressed(),
        child: Text(buttonTitle),
      ),
    );
  }
}
