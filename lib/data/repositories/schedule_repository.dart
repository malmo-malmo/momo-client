import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/data/datasources/remote/retrofit/management_client.dart';
import 'package:momo_flutter/data/datasources/remote/retrofit/schedule_client.dart';
import 'package:momo_flutter/data/datasources/remote/retrofit_client_provider.dart';
import 'package:momo_flutter/data/models/management/my_group_response.dart';
import 'package:momo_flutter/data/models/schedule/schedule_detail_response.dart';
import 'package:momo_flutter/data/models/schedule/schedule_request.dart';
import 'package:momo_flutter/data/models/schedule/schedule_summary_response.dart';
import 'package:momo_flutter/data/models/schedule/upcoming_schedule_response.dart';

final scheduleRepositoryProvider = Provider<ScheduleRepository>((ref) {
  final scheduleClient = ref.watch(scheduleClientProvider);
  final managementClient = ref.watch(managementClientProvider);

  return ScheduleRepository(
    scheduleClient: scheduleClient,
    managementClient: managementClient,
  );
});

class ScheduleRepository {
  final ScheduleClient scheduleClient;
  final ManagementClient managementClient;

  const ScheduleRepository({
    required this.scheduleClient,
    required this.managementClient,
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

  Future<ScheduleDetailResponse> createSchedule(ScheduleRequest scheduleRequest) {
    return scheduleClient.createSchedule(scheduleRequest);
  }

  Future<List<MyGroupResponse>> getMyGroupSummary() {
    return managementClient.getMyGroupSummary();
  }
}
