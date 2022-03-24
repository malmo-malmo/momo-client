import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/data/models/enum/post_type.dart';
import 'package:momo_flutter/data/models/post/post_detail_response.dart';
import 'package:momo_flutter/features/group/group_authority_page.dart';
import 'package:momo_flutter/features/group/providers/group_detail_provider.dart';
import 'package:momo_flutter/features/group/providers/upcoming_schedule_provider.dart';
import 'package:momo_flutter/features/post/post_request_page.dart';
import 'package:momo_flutter/features/post/provider/post_list_provider.dart';
import 'package:momo_flutter/features/schedule/schedule_request_page.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/widgets/button/bottom_sheet_tab_button.dart';
import 'package:momo_flutter/widgets/button/dialog_choice_button.dart';
import 'package:momo_flutter/widgets/indicator/bottom_sheet_indicator.dart';

class AdminBottomSheet extends StatelessWidget {
  const AdminBottomSheet(this.groupId, {Key? key}) : super(key: key);

  final int groupId;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 18, left: 16, right: 16),
      height: 310,
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
                      postType: PostType.NORMAL,
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
                title: AppStrings.createNotice,
                icon: AppIcons.writeNotice,
                onTap: () async {
                  final result = await Navigator.pushNamed(
                    context,
                    PostRequestPage.routeName,
                    arguments: PostRequestArg(
                      groupId: groupId,
                      postType: PostType.NOTICE,
                    ),
                  );
                  if (result != null) {
                    ref.read(noticeListStateProvider(groupId).notifier).createCallback(result as PostDetailResponse);
                    Navigator.pop(context);
                  }
                },
              );
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              return BottomSheetTabButton(
                title: AppStrings.addSchedule,
                icon: AppIcons.addSchedule,
                onTap: () async {
                  final result = await Navigator.pushNamed(
                    context,
                    ScheduleRequestPage.routeName,
                    arguments: groupId,
                  );
                  if (result != null) {
                    ref.refresh(upcomingScheduleProvider(groupId));
                    Navigator.pop(context);
                  }
                },
              );
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              return BottomSheetTabButton(
                title: AppStrings.manageAuthority,
                icon: AppIcons.managerAuthority,
                onTap: () async {
                  final result = await Navigator.pushNamed(
                    context,
                    GroupAuthorityPage.routeName,
                    arguments: groupId,
                  );
                  if (result != null) {
                    ref.read(groupDetailStateProvider(groupId).notifier).managerGroup(result as int);
                    Navigator.pop(context);
                  }
                },
              );
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              return BottomSheetTabButton(
                title: AppStrings.closeGroup,
                icon: AppIcons.closeGroup,
                onTap: () async {
                  final isWithdrawal = await showDialog<bool?>(
                    context: context,
                    builder: (_) => const _CloseGroupDialog(),
                  );
                  if (isWithdrawal != null && isWithdrawal) {
                    ref.read(groupDetailStateProvider(groupId).notifier).endGroup();
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

class _CloseGroupDialog extends StatelessWidget {
  const _CloseGroupDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(0),
      child: SizedBox(
        height: 220,
        width: 280,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: Text(
                AppStrings.closeGroupTitle,
                style: AppStyles.regular16,
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              AppStrings.closeGroupSubTitle,
              style: AppStyles.regular16,
              textAlign: TextAlign.center,
            ),
            DialogChoiceButton(
              yesText: AppStrings.closeGroupConfirm,
            )
          ],
        ),
      ),
    );
  }
}
