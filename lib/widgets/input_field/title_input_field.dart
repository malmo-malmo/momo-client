import 'package:flutter/material.dart';
import 'package:momo_flutter/resources/resources.dart';

class TitleInputField extends StatelessWidget {
  const TitleInputField({
    Key? key,
    required this.onTextChanged,
    required this.hintText,
  }) : super(key: key);

  final Function(String text) onTextChanged;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: AppStyles.containerDecoration(radius: 16, color: AppColors.gray1),
      height: 44,
      width: double.infinity,
      child: Center(
        child: TextFormField(
          onChanged: onTextChanged,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            hintText: hintText,
          ),
        ),
      ),
    );
  }
}
