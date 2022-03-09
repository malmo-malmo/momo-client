import 'package:flutter/material.dart';
import 'package:momo_flutter/utils/load_asset.dart';
import 'package:momo_flutter/widgets/title/sub_title.dart';

class SubTitleRow extends StatelessWidget {
  const SubTitleRow({
    Key? key,
    required this.title,
    required this.icon,
    this.actionIcon = const SizedBox(),
  }) : super(key: key);

  final String title;
  final String icon;
  final Widget actionIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        loadAsset(icon),
        const SizedBox(width: 12),
        SubTitle(title),
        const Spacer(),
        actionIcon,
      ],
    );
  }
}
