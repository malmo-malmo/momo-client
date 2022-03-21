import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/features/main/calendar/provider/calendar_schedule_provider.dart';
import 'package:momo_flutter/features/main/calendar/widgets/time_line_card.dart';
import 'package:momo_flutter/features/main/main_bottom_navigation_bar.dart';
import 'package:momo_flutter/features/schedule/schedule_request_page.dart';
import 'package:momo_flutter/resources/app_error_strings.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/utils/load_asset.dart';
import 'package:momo_flutter/widgets/calendar_style/calendar_default_builder.dart';
import 'package:momo_flutter/widgets/calendar_style/calendar_dow_builder.dart';
import 'package:momo_flutter/widgets/calendar_style/calendar_header_style.dart';
import 'package:momo_flutter/widgets/calendar_style/calendar_selected_builder.dart';
import 'package:momo_flutter/widgets/calendar_style/calendar_today_builder.dart';
import 'package:momo_flutter/widgets/card/empty_item_card.dart';
import 'package:momo_flutter/widgets/indicator/loading_indicator.dart';
import 'package:momo_flutter/widgets/title/main_title.dart';
import 'package:momo_flutter/widgets/title/sub_title.dart';
import 'package:momo_flutter/widgets/title/sub_title_row.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            ScheduleRequestPage.routeName,
          );
        },
        child: loadAsset(
          AppIcons.addSchedule,
          color: AppColors.backgroundWhite,
        ),
      ),
      backgroundColor: AppColors.backgroundPurple,
      bottomNavigationBar: const MainBottomNavigationBar(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.backgroundWhite,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: InkWell(
              onTap: () {},
              child: loadAsset(AppIcons.chat),
            ),
          )
        ],
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final calendarData = ref.watch(calendarScheduleProvider);
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  color: AppColors.backgroundWhite,
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: MainTitle('캘린더'),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  color: AppColors.backgroundWhite,
                  child: TableCalendar(
                    firstDay: DateTime.utc(DateTime.now().year, 1, 1),
                    lastDay: DateTime.utc(DateTime.now().year + 2, 12, 31),
                    focusedDay: calendarData.selectedDate,
                    formatAnimationDuration: const Duration(milliseconds: 500),
                    locale: 'ko-KR',
                    onFormatChanged: (format) {},
                    rowHeight: 52,
                    headerStyle: calendarHeaderStyle(),
                    onDaySelected: (selDay, foDay) =>
                        ref.read(calendarScheduleProvider.notifier).changeSeletedDate(selDay),
                    eventLoader: (date) {
                      if (calendarData.isLoading) {
                        return [];
                      }
                      for (int i = 0; i < calendarData.scheduleDateTimes.length; i++) {
                        if (calendarData.scheduleDateTimes[i].year == date.year &&
                            calendarData.scheduleDateTimes[i].month == date.month &&
                            calendarData.scheduleDateTimes[i].day == date.day) {
                          return ['event'];
                        }
                      }
                      return [];
                    },
                    selectedDayPredicate: (date) => calendarData.selectedDate == date,
                    calendarBuilders: CalendarBuilders(
                      markerBuilder: (context, date, events) {
                        return events.isNotEmpty
                            ? const CircleAvatar(
                                radius: 3,
                                backgroundColor: AppColors.purple,
                              )
                            : const SizedBox();
                      },
                      selectedBuilder: (context, date, focusedDay) =>
                          calendarSelectedBuilder(date, calendarData.selectedDate),
                      todayBuilder: calendarTodayBuilder,
                      dowBuilder: calendarDowBuilder,
                      defaultBuilder: calendarDefaultBuilder,
                    ),
                    onPageChanged: (dateTime) {
                      ref.read(calendarScheduleProvider.notifier).changeRequestDate(dateTime);
                      ref.read(calendarScheduleProvider.notifier).changeSeletedDate(dateTime);
                      ref.read(calendarScheduleProvider.notifier).getSchedules();
                    },
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                  child: SubTitleRow(
                    title: '타임라인',
                    icon: 'assets/icon/calendar/icon_timeline_28.svg',
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: calendarData.isLoading
                    ? const LoadingIndicator()
                    : (calendarData.schedules.isEmpty)
                        ? const Padding(
                            padding: EdgeInsets.only(top: 32),
                            child: EmptyItemCard(AppErrorString.scheduleEmpty),
                          )
                        : Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              children: List.generate(
                                calendarData.schedules.length,
                                (index) => TimeLineCard(
                                  calendarData.schedules[index],
                                ),
                              ),
                            ),
                          ),
              ),
            ],
          );
        },
      ),
    );
  }
}
