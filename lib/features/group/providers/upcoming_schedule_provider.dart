import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/data/models/schedule/upcoming_schedule_response.dart';
import 'package:momo_flutter/data/repositories/schedule_repository.dart';

final upcomingScheduleProvider = FutureProvider.family.autoDispose<UpcomingScheduleResponse, int>(
  (ref, groupId) {
    final scheduleRepository = ref.watch(scheduleRepositoryProvider);
    return scheduleRepository.getUpcomingSchedule(groupId);
  },
);
