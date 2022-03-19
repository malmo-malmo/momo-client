import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/features/main/home/provider/home_schedule_provider.dart';
import 'package:momo_flutter/features/main/home/provider/reminder_selected_day_provider.dart';
import 'package:momo_flutter/features/main/home/widgets/schedule_page_view.dart';
import 'package:momo_flutter/resources/app_error_strings.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/utils/format/calculate_max_day.dart';
import 'package:momo_flutter/utils/format/calendar_format.dart';
import 'package:momo_flutter/widgets/card/empty_item_card.dart';
import 'package:momo_flutter/widgets/card/error_card.dart';
import 'package:momo_flutter/widgets/indicator/loading_indicator.dart';

class HomeReminderCard extends StatelessWidget {
  HomeReminderCard({Key? key}) : super(key: key);

  final _controller = ScrollController(
    initialScrollOffset: 53 * (DateTime.now().day - 3),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.symmetric(vertical: 20),
      height: 390,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        color: AppColors.gray0,
        boxShadow: const [BoxShadow()],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 89,
            child: Consumer(
              builder: (context, ref, child) {
                final selectedDay = ref.watch(reminderSelectedDayProvider);
                return ListView.builder(
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                  itemCount: calculateMaxDay(DateTime.now().year, DateTime.now().month),
                  itemBuilder: (_, index) {
                    return _DayCard(
                      title: dayTitle(
                        DateTime.now().year,
                        DateTime.now().month,
                        DateTime.now().day + index,
                      ),
                      index: index,
                      check: (index + 1) == selectedDay,
                      selectDay: (index) => ref.read(reminderSelectedDayProvider.state).state = index,
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Consumer(
              builder: (context, ref, child) {
                final scheduleResponse = ref.watch(homeScheduleProvider);
                final selectedDay = ref.watch(reminderSelectedDayProvider);

                return scheduleResponse.when(
                  error: (error, stackTrace) => const ErrorCard(),
                  loading: () => const LoadingIndicator(),
                  data: (schedules) {
                    final curSchedule = schedules
                        .where(
                          (e) => DateTime.parse(e.first.startDateTime).day == selectedDay,
                        )
                        .toList();
                    if (curSchedule.isEmpty) {
                      return const EmptyItemCard(AppErrorString.scheduleEmpty);
                    }

                    return SchedulePageView(curSchedule.first);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _DayCard extends StatelessWidget {
  const _DayCard({
    Key? key,
    required this.index,
    required this.check,
    required this.selectDay,
    required this.title,
  }) : super(key: key);

  final int index;
  final bool check;
  final void Function(int index) selectDay;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectDay(index + 1),
      child: Container(
        padding: const EdgeInsets.only(top: 24, bottom: 16),
        height: 89,
        width: 53,
        decoration: BoxDecoration(
          color: check ? AppColors.purple : AppColors.gray0,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppStyles.bold14.copyWith(
                color: check ? AppColors.gray0 : null,
              ),
            ),
            Text(
              '${index + 1}',
              style: AppStyles.bold14.copyWith(
                color: check ? AppColors.gray0 : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
