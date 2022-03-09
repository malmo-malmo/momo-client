import 'package:flutter/material.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/widgets/button/bottom_button.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog(this.dialogText, {Key? key}) : super(key: key);

  final String dialogText;

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
            BottomButton(
              isEnable: true,
              buttonTitle: AppStrings.confirm,
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
