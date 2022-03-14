import 'package:flutter/material.dart';
import 'package:momo_flutter/resources/resources.dart';

class ContentInputField extends StatelessWidget {
  const ContentInputField({
    Key? key,
    required this.onTextChanged,
    required this.hintText,
    required this.height,
    required this.maxLines,
  }) : super(key: key);

  final Function(String text) onTextChanged;
  final String hintText;
  final double height;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: AppStyles.containerDecoration(radius: 16, color: AppColors.gray1),
      height: height,
      width: double.infinity,
      child: Center(
        child: TextFormField(
          onChanged: onTextChanged,
          maxLines: maxLines,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            hintText: hintText,
          ),
        ),
      ),
    );
  }
}
