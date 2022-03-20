import 'package:flutter/material.dart';
import 'package:momo_flutter/resources/resources.dart';

class DialogChoiceButton extends StatelessWidget {
  const DialogChoiceButton({
    Key? key,
    required this.yesText,
    this.noText = AppStrings.no,
  }) : super(key: key);

  final String yesText;
  final String noText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 56,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(AppColors.gray3),
                  foregroundColor: MaterialStateProperty.all(AppColors.gray5),
                  shape: MaterialStateProperty.all(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                  ),
                ),
                onPressed: () => Navigator.pop(context, true),
                child: Text(yesText),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 56,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                  ),
                ),
                onPressed: () => Navigator.pop(context),
                child: Text(noText),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
