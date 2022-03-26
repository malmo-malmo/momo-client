import 'package:flutter/material.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/widgets/button/dialog_choice_button.dart';

class QuestionDialog extends StatelessWidget {
  const QuestionDialog({
    Key? key,
    required this.dialogText,
    required this.yesText,
    this.noText = AppStrings.no,
  }) : super(key: key);

  final String dialogText;
  final String yesText;
  final String noText;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(0),
      child: SizedBox(
        height: dialogText.contains('\n') ? 172 : 148,
        width: 280,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Text(
                dialogText,
                style: AppStyles.bold16.copyWith(
                  height: 24 / 16,
                  letterSpacing: -0.16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            DialogChoiceButton(
              yesText: yesText,
              noText: noText,
            ),
          ],
        ),
      ),
    );
  }
}
