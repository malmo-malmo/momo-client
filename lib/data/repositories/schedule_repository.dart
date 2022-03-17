import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/data/datasources/remote/retrofit/schedule_client.dart';
import 'package:momo_flutter/data/datasources/remote/retrofit_client_provider.dart';
import 'package:momo_flutter/data/models/schedule/schedule_summary_response.dart';
import 'package:momo_flutter/data/models/schedule/upcoming_schedule_response.dart';

final scheduleRepositoryProvider = Provider<ScheduleRepository>((ref) {
  final scheduleClient = ref.watch(scheduleClientProvider);
  return ScheduleRepository(
    scheduleClient: scheduleClient,
  );
});

class ScheduleRepository {
  final ScheduleClient scheduleClient;

  const ScheduleRepository({
    required this.scheduleClient,
  });

  Future<List<ScheduleSummaryResponse>> getScheduleSummary(
    String startDay,
    String endDay,
  ) {
    return scheduleClient.getUserSchedules(startDay, endDay);
  }

  Future<UpcomingScheduleResponse> getUpcomingSchedule(int groupId) {
    return scheduleClient.getUpcomingSchedule(groupId);
  }
}
