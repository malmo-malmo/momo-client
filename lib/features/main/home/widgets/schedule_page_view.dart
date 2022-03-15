import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/data/models/schedule/schedule_summary_response.dart';
import 'package:momo_flutter/widgets/card/schedule_card_column.dart';
import 'package:momo_flutter/widgets/indicator/step_indicator.dart';

final _pageViewInxdexProvider = StateProvider.autoDispose<int>((ref) => 0);

class SchedulePageView extends StatelessWidget {
  const SchedulePageView(
    this.schedules, {
    Key? key,
  }) : super(key: key);

  final List<ScheduleSummaryResponse> schedules;

  @override
  Widget build(BuildContext context) {
    final sepSchedules = [];

    for (; schedules.length >= 3;) {
      sepSchedules.add(schedules.sublist(0, 3));
      schedules.removeRange(0, 3);
    }
    sepSchedules.add(schedules.sublist(0, schedules.length));

    return Consumer(
      builder: (context, ref, child) {
        final _currentIndex = ref.watch(_pageViewInxdexProvider);
        return Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemBuilder: (context, index) => ScheduleCardColumn(
                  sepSchedules[index],
                ),
                onPageChanged: (index) => ref.read(_pageViewInxdexProvider.state).state = index,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: StepIndicator(
                currentIndex: _currentIndex,
                length: schedules.length,
              ),
            ),
          ],
        );
      },
    );
  }
}
