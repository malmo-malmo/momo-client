import 'package:dio/dio.dart';
import 'package:momo_flutter/app_config.dart';
import 'package:momo_flutter/data/models/attendance/attendance_check_create_request.dart';
import 'package:momo_flutter/data/models/attendance/attendance_check_update_request.dart';
import 'package:momo_flutter/data/models/attendance/attendance_response.dart';
import 'package:retrofit/retrofit.dart';

part 'attendance_client.g.dart';

@RestApi(baseUrl: AppConfig.baseUrl)
abstract class AttendanceClient {
  factory AttendanceClient(
    Dio dio, {
    String baseUrl,
  }) = _AttendanceClient;

  @POST('/attendance')
  Future<dynamic> createAttendance(
    @Body() AttendanceCheckCreateRequest attendanceCheckCreateRequest,
  );

  @PUT('/attendance')
  Future<dynamic> updateAttendance(
    @Body() AttendanceCheckUpdateRequest attendanceCheckUpdateRequest,
  );

  @GET('/attendances/schedule/{scheduleId}')
  Future<List<AttendanceResponse>> getAttendances(
    @Path() int scheduleId,
  );
}
