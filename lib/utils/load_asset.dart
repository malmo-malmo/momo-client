import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget loadAsset(
  String asset, {
  double? height,
  double? width,
  Color? color,
}) {
  if (asset.contains('.svg')) {
    return SvgPicture.asset(
      asset,
      width: width,
      height: height,
      color: color,
    );
  } else {
    return Image.asset(
      asset,
      width: width,
      height: height,
    );
  }
}
