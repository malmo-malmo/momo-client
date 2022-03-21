import 'package:flutter/material.dart';
import 'package:momo_flutter/data/models/schedule/schedule_summary_response.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/utils/format/calendar_format.dart';
import 'package:momo_flutter/widgets/card/schedule_card_column.dart';
import 'package:momo_flutter/widgets/title/sub_title.dart';

class TimeLineCard extends StatelessWidget {
  const TimeLineCard(this.schedules, {Key? key}) : super(key: key);

  final List<ScheduleSummaryResponse> schedules;

  @override
  Widget build(BuildContext context) {
    final dateTime = DateTime.parse(schedules.first.startDateTime);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SubTitle('${dateTime.day}'),
              const SizedBox(height: 4),
              Text(
                dayTitle(dateTime.year, dateTime.month, dateTime.day),
                style: AppStyles.bold14,
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Material(
              borderRadius: BorderRadius.circular(20),
              elevation: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                height: schedules.length * 76,
                child: ScheduleCardColumn(schedules),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
