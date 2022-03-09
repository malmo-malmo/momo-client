import 'package:flutter/material.dart';
import 'package:momo_flutter/resources/resources.dart';

class EmptyItemCard extends StatelessWidget {
  const EmptyItemCard(this.message, {Key? key}) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: AppStyles.bold16,
      ),
    );
  }
}
