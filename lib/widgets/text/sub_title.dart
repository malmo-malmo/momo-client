import 'package:flutter/material.dart';
import 'package:momo_flutter/resources/resources.dart';

class SubTitle extends StatelessWidget {
  const SubTitle(this.title, {Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppStyles.bold20,
    );
  }
}
