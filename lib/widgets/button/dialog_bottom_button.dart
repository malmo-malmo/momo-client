import 'package:flutter/material.dart';
import 'package:momo_flutter/resources/resources.dart';

class DialogBottomButton extends StatelessWidget {
  const DialogBottomButton({Key? key, required this.isEnable, this.result}) : super(key: key);

  final bool isEnable;
  final Object? result;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isEnable ? () => Navigator.pop(context, result) : null,
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
    );
  }
}
