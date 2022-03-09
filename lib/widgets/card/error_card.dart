import 'package:flutter/material.dart';
import 'package:momo_flutter/resources/resources.dart';

class ErrorCard extends StatelessWidget {
  const ErrorCard({
    Key? key,
    this.errorMessage = AppStrings.defaultErrorMessage,
  }) : super(key: key);

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage,
        style: AppStyles.bold16,
      ),
    );
  }
}
