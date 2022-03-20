import 'package:flutter/material.dart';
import 'package:momo_flutter/resources/resources.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    Key? key,
    required this.buttonTitle,
    required this.onPressed,
    required this.isEnable,
  }) : super(key: key);

  final String buttonTitle;
  final Function onPressed;
  final bool isEnable;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 12,
        top: 10,
        bottom: 10,
      ),
      child: SizedBox(
        height: 36,
        width: 64,
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            textStyle: MaterialStateProperty.all(AppStyles.regular14),
          ),
          onPressed: isEnable ? () => onPressed() : null,
          child: Text(buttonTitle),
        ),
      ),
    );
  }
}
