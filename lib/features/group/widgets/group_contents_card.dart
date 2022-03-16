import 'package:flutter/material.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/widgets/title/sub_title.dart';

class GroupContentsCard extends StatelessWidget {
  const GroupContentsCard(this.contents, {Key? key}) : super(key: key);

  final String contents;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundWhite,
      height: 160,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SubTitle(AppStrings.groupInformation),
          const SizedBox(height: 14),
          Text(
            contents,
            style: AppStyles.regular14,
          ),
        ],
      ),
    );
  }
}
