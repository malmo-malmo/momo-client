import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:momo_flutter/data/models/schedule/schedule_summary_response.dart';
import 'package:momo_flutter/data/repositories/schedule_repository.dart';
import 'package:momo_flutter/utils/format/calculate_schedule_day.dart';

final homeScheduleProvider = FutureProvider.autoDispose<List<List<ScheduleSummaryResponse>>>(
  (ref) async {
    final scheduleRepository = ref.watch(scheduleRepositoryProvider);
    final schedules = await scheduleRepository.getScheduleSummary(
      calculateRequestStartDay(
        DateTime.now().year,
        DateTime.now().month,
      ),
      calculateRequestEndDay(
        DateTime.now().year,
        DateTime.now().month,
      ),
    );

    schedules.sort((a, b) => a.startDateTime.compareTo(b.startDateTime));

    Set<String> dates = schedules
        .map(
          (e) => DateFormat('yyyy-MM-dd').format(
            DateTime.parse(
              e.startDateTime,
            ),
          ),
        )
        .toSet();

    List<List<ScheduleSummaryResponse>> scheduleLists = [];

    for (String date in dates) {
      List<ScheduleSummaryResponse> tmp = schedules
          .where(
            (e) =>
                DateFormat('yyyy-MM-dd').format(
                  DateTime.parse(e.startDateTime),
                ) ==
                date,
          )
          .toList();
      scheduleLists.add(tmp);
    }

    return scheduleLists;
  },
);
