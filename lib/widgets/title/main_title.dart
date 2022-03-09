import 'package:flutter/material.dart';
import 'package:momo_flutter/resources/resources.dart';

class MainTitle extends StatelessWidget {
  const MainTitle(this.title, {Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppStyles.bold28,
    );
  }
}
