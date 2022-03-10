import 'package:flutter/material.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/utils/format/group_card_date_format.dart';
import 'package:momo_flutter/utils/load_asset.dart';

class MemberDateRow extends StatelessWidget {
  const MemberDateRow({
    Key? key,
    required this.headNum,
    required this.startDay,
    this.color = AppColors.gray0,
  }) : super(key: key);

  final int headNum;
  final String startDay;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            loadAsset(
              AppIcons.member,
              color: color,
            ),
            const SizedBox(width: 2),
            Text(
              '$headNum',
              style: AppStyles.regular12.copyWith(
                color: color,
              ),
            ),
          ],
        ),
        const SizedBox(width: 15),
        Row(
          children: [
            loadAsset(
              AppIcons.startDay,
              color: color,
            ),
            const SizedBox(width: 2),
            Text(
              groupCardDateFormat(startDay),
              style: AppStyles.regular12.copyWith(
                color: color,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
