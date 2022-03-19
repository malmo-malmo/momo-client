import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/widgets/button/bottom_sheet_tab_button.dart';
import 'package:momo_flutter/widgets/indicator/bottom_sheet_indicator.dart';

class PostAdminBottomSheet extends StatelessWidget {
  const PostAdminBottomSheet(this.postId, {Key? key}) : super(key: key);

  final int postId;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 18, left: 16, right: 16),
      height: 154,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const BottomSheetIndicator(),
          const SizedBox(height: 18),
          Consumer(
            builder: (context, ref, child) {
              return BottomSheetTabButton(
                title: AppStrings.toReport,
                icon: AppIcons.report,
                onTap: () async {},
              );
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              return BottomSheetTabButton(
                title: AppStrings.toDelte,
                icon: AppIcons.delete,
                onTap: () async {},
              );
            },
          ),
        ],
      ),
    );
  }
}
