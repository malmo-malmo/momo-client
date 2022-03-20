import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:momo_flutter/data/models/schedule/schedule_summary_response.dart';
import 'package:momo_flutter/features/schedule/schedule_list_page.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/utils/category_name_to_icon.dart';
import 'package:momo_flutter/utils/format/schedule_time_format.dart';
import 'package:momo_flutter/utils/load_asset.dart';

class ScheduleCardColumn extends StatelessWidget {
  const ScheduleCardColumn(this.schedules, {Key? key}) : super(key: key);

  final List<ScheduleSummaryResponse> schedules;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => _ScheduleCard(schedules[index]),
      separatorBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        child: Container(
          height: 1,
          width: 280,
          color: AppColors.lineGrayPurple,
        ),
      ),
      itemCount: schedules.length,
    );
  }
}

class _ScheduleCard extends StatelessWidget {
  const _ScheduleCard(this.schedule, {Key? key}) : super(key: key);

  final ScheduleSummaryResponse schedule;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: InkWell(
        onTap: () => Navigator.pushNamed(
          context,
          ScheduleListPage.routeName,
          arguments: schedule.groupId,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            loadAsset(
              categoryNameToIcon(schedule.category.name),
              width: 36,
              height: 36,
            ),
            const SizedBox(width: 14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  schedule.title,
                  style: AppStyles.bold16,
                ),
                const SizedBox(height: 6),
                Text(
                  scheduleTimeFormat(schedule.startDateTime),
                  style: AppStyles.regular12,
                ),
              ],
            ),
            const Spacer(),
            Transform.rotate(
              angle: pi,
              child: const Icon(
                CupertinoIcons.back,
                size: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
