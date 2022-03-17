import 'package:flutter/material.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/widgets/button/bottom_button.dart';

class QuestionDialog extends StatelessWidget {
  const QuestionDialog({
    Key? key,
    required this.dialogText,
    required this.yesText,
    required this.noText,
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
                style: AppStyles.regular16,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 56,
              child: Row(
                children: [
                  Expanded(
                    child: BottomButton(
                      isEnable: true,
                      buttonTitle: noText,
                      onPressed: () => Navigator.pop(context, true),
                    ),
                  ),
                  Expanded(
                    child: BottomButton(
                      isEnable: true,
                      buttonTitle: yesText,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
