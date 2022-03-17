import 'package:flutter/material.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/utils/load_asset.dart';

class BottomSheetTabButton extends StatelessWidget {
  const BottomSheetTabButton({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final String icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: SizedBox(
        height: 52,
        child: Row(
          children: [
            loadAsset(icon),
            const SizedBox(width: 10),
            Text(
              title,
              style: AppStyles.bold16,
            ),
          ],
        ),
      ),
    );
  }
}
