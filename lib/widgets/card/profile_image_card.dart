import 'package:flutter/material.dart';
import 'package:momo_flutter/resources/resources.dart';

class ProfileImageCard extends StatelessWidget {
  const ProfileImageCard({
    Key? key,
    required this.img,
    required this.rad,
    this.backgroundColor = AppColors.gray5,
  }) : super(key: key);

  final String img;
  final double rad;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: rad + 1,
      backgroundColor: backgroundColor,
      child: CircleAvatar(
        radius: rad,
        backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage(img),
      ),
    );
  }
}
