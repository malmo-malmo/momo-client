import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/data/models/group/group_detail_response.dart';
import 'package:momo_flutter/features/group/providers/upcoming_schedule_provider.dart';
import 'package:momo_flutter/features/group/widgets/group_detail_image_card.dart';
import 'package:momo_flutter/features/post/widgets/notice_horizontal_list_view.dart';
import 'package:momo_flutter/features/post/widgets/post_list_view.dart';
import 'package:momo_flutter/resources/app_error_strings.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/widgets/card/error_card.dart';
import 'package:momo_flutter/widgets/indicator/loading_indicator.dart';
import 'package:momo_flutter/widgets/title/sub_title.dart';

class ParticipantGroupBody extends StatelessWidget {
  const ParticipantGroupBody(this.group, {Key? key}) : super(key: key);

  final GroupDetailResponse group;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              GroupDetailImageCard(group),
              _ScheduleCard(group.id),
              Container(
                height: 10,
                color: AppColors.gray1,
              ),
              NoticeHorizontalListView(group.id),
            ],
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: PostListView(group.id),
        ),
      ],
    );
  }
}

class _ScheduleCard extends ConsumerWidget {
  const _ScheduleCard(this.groupId, {Key? key}) : super(key: key);

  final int groupId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final response = ref.watch(upcomingScheduleProvider(groupId));
    return SizedBox(
      height: 148,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: response.when(
          error: (error, stackTrace) => const ErrorCard(errorMessage: AppErrorString.upcomingScheduleEmpty),
          loading: () => const LoadingIndicator(),
          data: (schedule) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SubTitle(AppStrings.upcomingSchedule),
                    InkWell(
                      onTap: () {},
                      child: Transform.rotate(
                        angle: pi,
                        child: const Icon(
                          CupertinoIcons.back,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(height: 1, color: AppColors.gray1),
                const SizedBox(height: 20),
                Text(
                  schedule.title ?? AppErrorString.upcomingScheduleEmpty,
                  style: AppStyles.bold16,
                ),
                const SizedBox(height: 8),
                Text(
                  schedule.startDateTime ?? '',
                  style: AppStyles.regular14,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
