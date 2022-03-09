import 'dart:io';

import 'package:flutter/material.dart';
import 'package:momo_flutter/resources/resources.dart';

class ProfileImageCardWithFile extends StatelessWidget {
  const ProfileImageCardWithFile(
    this.imagePath, {
    Key? key,
  }) : super(key: key);

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 51,
      backgroundColor: AppColors.purple,
      child: CircleAvatar(
        radius: 50,
        backgroundColor: Colors.transparent,
        backgroundImage: FileImage(File(imagePath)),
      ),
    );
  }
}
