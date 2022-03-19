import 'package:flutter/material.dart';
import 'package:momo_flutter/resources/resources.dart';

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
            SizedBox(
              height: 56,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(AppStrings.confirm),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
