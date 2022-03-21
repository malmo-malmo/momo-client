import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:momo_flutter/data/models/schedule/schedule_summary_response.dart';
import 'package:momo_flutter/data/repositories/schedule_repository.dart';
import 'package:momo_flutter/utils/format/calculate_schedule_day.dart';

part 'calendar_schedule_provider.freezed.dart';

final calendarScheduleProvider =
    StateNotifierProvider.autoDispose<CalendarScheduleStateNotifier, CalendarScheduleState>(
  (ref) {
    final scheduleRepository = ref.watch(scheduleRepositoryProvider);
    return CalendarScheduleStateNotifier(
      scheduleRepository: scheduleRepository,
    )..getSchedules();
  },
);

class CalendarScheduleStateNotifier extends StateNotifier<CalendarScheduleState> {
  CalendarScheduleStateNotifier({
    required this.scheduleRepository,
  }) : super(
          CalendarScheduleState(
            isLoading: true,
            selectedDate: DateTime.now(),
            requestDate: DateTime.now(),
            scheduleDateTimes: [],
            schedules: [],
          ),
        );

  final ScheduleRepository scheduleRepository;

  Future<void> getSchedules() async {
    state = state.copyWith(
      isLoading: true,
    );
    final schedules = await scheduleRepository.getScheduleSummary(
      calculateRequestStartDay(state.requestDate.year, state.requestDate.month),
      calculateRequestEndDay(state.requestDate.year, state.requestDate.month),
    );
    schedules.sort((a, b) => a.startDateTime.compareTo(b.startDateTime));

    Set<String> dates = schedules.map((e) => DateFormat('yyyy-MM-dd').format(DateTime.parse(e.startDateTime))).toSet();

    List<List<ScheduleSummaryResponse>> scheduleLists = [];

    for (String date in dates) {
      List<ScheduleSummaryResponse> tmp =
          schedules.where((e) => DateFormat('yyyy-MM-dd').format(DateTime.parse(e.startDateTime)) == date).toList();
      scheduleLists.add(tmp);
    }

    state = state.copyWith(
      isLoading: false,
      scheduleDateTimes: dates.map((e) => DateTime.parse(e)).toList(),
      schedules: [...scheduleLists],
    );
  }

  void changeSeletedDate(DateTime newDate) => state = state.copyWith(selectedDate: newDate);

  void changeRequestDate(DateTime newDate) => state = state.copyWith(requestDate: newDate);
}

@freezed
class CalendarScheduleState with _$CalendarScheduleState {
  factory CalendarScheduleState({
    required bool isLoading,
    required DateTime selectedDate,
    required DateTime requestDate,
    required List<DateTime> scheduleDateTimes,
    required List<List<ScheduleSummaryResponse>> schedules,
  }) = _CalendarScheduleState;
}
