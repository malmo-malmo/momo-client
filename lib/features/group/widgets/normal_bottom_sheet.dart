import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/data/models/enum/post_type.dart';
import 'package:momo_flutter/data/models/post/post_detail_response.dart';
import 'package:momo_flutter/features/group/providers/group_detail_provider.dart';
import 'package:momo_flutter/features/post/post_request_page.dart';
import 'package:momo_flutter/features/post/provider/post_list_provider.dart';
import 'package:momo_flutter/provider/loading_provider.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/widgets/button/bottom_sheet_tab_button.dart';
import 'package:momo_flutter/widgets/dialog/question_dialog.dart';
import 'package:momo_flutter/widgets/indicator/bottom_sheet_indicator.dart';

class NormalBottomSheet extends StatelessWidget {
  const NormalBottomSheet(this.groupId, {Key? key}) : super(key: key);

  final int groupId;

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
                title: AppStrings.createPost,
                icon: AppIcons.write,
                onTap: () async {
                  final result = await Navigator.pushNamed(
                    context,
                    PostRequestPage.routeName,
                    arguments: PostRequestArg(
                      groupId: groupId,
                      postType: PostType.NORMAR,
                    ),
                  );
                  if (result != null) {
                    ref.read(postListStateProvider(groupId).notifier).createCallback(result as PostDetailResponse);
                    Navigator.pop(context);
                  }
                },
              );
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              return BottomSheetTabButton(
                title: AppStrings.withdrawalGroup,
                icon: AppIcons.exitGroup,
                onTap: () async {
                  final isWithdrawal = await showDialog<bool?>(
                    context: context,
                    builder: (_) => const QuestionDialog(
                      dialogText: AppStrings.withdrawalGroupAsk,
                      yesText: AppStrings.withdrawalGroupConfrim,
                      noText: AppStrings.no,
                    ),
                  );
                  if (isWithdrawal != null && isWithdrawal) {
                    ref.read(loadingProvider.state).state = true;
                    await ref.read(groupDetailStateProvider(groupId).notifier).withdrawalGroup();
                    ref.read(loadingProvider.state).state = false;
                    Navigator.pop(context);
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
