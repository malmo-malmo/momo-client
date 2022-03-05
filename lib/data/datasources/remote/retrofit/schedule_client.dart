import 'package:dio/dio.dart';
import 'package:momo_flutter/app_config.dart';
import 'package:momo_flutter/data/models/schedule/schedule_detail_response.dart';
import 'package:momo_flutter/data/models/schedule/schedule_request.dart';
import 'package:momo_flutter/data/models/schedule/schedule_response.dart';
import 'package:momo_flutter/data/models/schedule/schedule_summary_response.dart';
import 'package:momo_flutter/data/models/schedule/upcoming_schedule_response.dart';
import 'package:retrofit/retrofit.dart';

part 'schedule_client.g.dart';

@RestApi(baseUrl: AppConfig.baseUrl)
abstract class ScheduleClient {
  factory ScheduleClient(
    Dio dio, {
    String baseUrl,
  }) = _ScheduleClient;

  @POST('/schedule')
  Future<ScheduleDetailResponse> createSchedule(
    @Body() ScheduleRequest scheduleRequest,
  );

  @GET('/schedule/group-schedules')
  Future<ScheduleResponse> getSchedules(
    @Query('groupId') int groupId,
    @Query('page') int page,
    @Query('size') int size,
  );

  @GET('/schedule/user-schedules')
  Future<List<ScheduleSummaryResponse>> getUserSchedules(
    @Query('searchStartDate') String searchStartDate,
    @Query('searchEndDate') String searchEndDate,
  );

  @GET('/schedule/upcoming')
  Future<UpcomingScheduleResponse> getUpcomingSchedule(
    @Query('groupId') int groupId,
  );
}
