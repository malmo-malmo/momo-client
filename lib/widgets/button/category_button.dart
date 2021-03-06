import 'package:flutter/material.dart';
import 'package:momo_flutter/app_config.dart';
import 'package:momo_flutter/app_consts.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/utils/load_asset.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    Key? key,
    required this.check,
    required this.index,
    required this.onTabIcon,
    this.iconSize = 64,
    this.textStyle = AppStyles.regular14,
    this.spaceHeight = 10,
  }) : super(key: key);

  final bool check;
  final int index;
  final void Function(int index) onTabIcon;
  final double iconSize;
  final TextStyle textStyle;
  final double spaceHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(iconSize),
          onTap: () => onTabIcon(index),
          child: loadAsset(
            check ? AppConsts.categoryIconOn[index] : AppConsts.categoryIconOff[index],
            width: iconSize,
            height: iconSize,
          ),
        ),
        SizedBox(height: spaceHeight),
        Text(
          AppConfig.categoryCodeNamePair[index].name,
          style: textStyle,
        ),
      ],
    );
  }
}
