import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/app_consts.dart';
import 'package:momo_flutter/data/datasources/remote/retrofit/attendance_client.dart';
import 'package:momo_flutter/data/datasources/remote/retrofit/management_client.dart';
import 'package:momo_flutter/data/datasources/remote/retrofit/schedule_client.dart';
import 'package:momo_flutter/data/datasources/remote/retrofit_client_provider.dart';
import 'package:momo_flutter/data/models/attendance/attendance_check_create_request.dart';
import 'package:momo_flutter/data/models/attendance/attendance_check_update_request.dart';
import 'package:momo_flutter/data/models/attendance/attendance_response.dart';
import 'package:momo_flutter/data/models/management/my_group_response.dart';
import 'package:momo_flutter/data/models/schedule/schedule_detail_response.dart';
import 'package:momo_flutter/data/models/schedule/schedule_request.dart';
import 'package:momo_flutter/data/models/schedule/schedule_response.dart';
import 'package:momo_flutter/data/models/schedule/schedule_summary_response.dart';
import 'package:momo_flutter/data/models/schedule/upcoming_schedule_response.dart';

final scheduleRepositoryProvider = Provider<ScheduleRepository>((ref) {
  final scheduleClient = ref.watch(scheduleClientProvider);
  final managementClient = ref.watch(managementClientProvider);
  final attendanceClient = ref.watch(attendanceClientProvider);

  return ScheduleRepository(
    scheduleClient: scheduleClient,
    managementClient: managementClient,
    attendanceClient: attendanceClient,
  );
});

class ScheduleRepository {
  final ScheduleClient scheduleClient;
  final ManagementClient managementClient;
  final AttendanceClient attendanceClient;

  const ScheduleRepository({
    required this.scheduleClient,
    required this.managementClient,
    required this.attendanceClient,
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

  Future<ScheduleResponse> getSchedules({
    String? lastScheduleStartDateTime,
    required int groupId,
  }) {
    return scheduleClient.getSchedules(groupId, lastScheduleStartDateTime, AppConsts.pageSize);
  }

  Future<dynamic> createAttendace(
    AttendanceCheckCreateRequest attendanceCheckCreateRequest,
  ) {
    return attendanceClient.createAttendance(attendanceCheckCreateRequest);
  }

  Future<dynamic> updateAttendace(
    AttendanceCheckUpdateRequest attendanceCheckUpdateRequest,
  ) {
    return attendanceClient.updateAttendance(attendanceCheckUpdateRequest);
  }

  Future<List<AttendanceResponse>> getAttendance(int scheduleId) {
    return attendanceClient.getAttendances(scheduleId);
  }
}
