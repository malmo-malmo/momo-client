import 'package:flutter/material.dart';
import 'package:momo_flutter/resources/resources.dart';

class IntroSubTitle extends StatelessWidget {
  const IntroSubTitle(this.title, {Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppStyles.regular14,
    );
  }
}
