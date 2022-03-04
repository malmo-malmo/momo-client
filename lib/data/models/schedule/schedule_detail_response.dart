import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule_detail_response.g.dart';
part 'schedule_detail_response.freezed.dart';

@freezed
class ScheduleDetailResponse with _$ScheduleDetailResponse {
  factory ScheduleDetailResponse({
    required int scheduleId,
    required String title,
    required String contents,
    required String authorNickname,
    String? authorImage,
    required String startDateTime,
    required bool offline,
    required bool attend,
    required bool attendanceCheck,
  }) = _ScheduleDetailResponse;

  factory ScheduleDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$ScheduleDetailResponseFromJson(json);
}
