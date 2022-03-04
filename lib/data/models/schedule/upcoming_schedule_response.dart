import 'package:freezed_annotation/freezed_annotation.dart';

part 'upcoming_schedule_response.g.dart';
part 'upcoming_schedule_response.freezed.dart';

@freezed
class UpcomingScheduleResponse with _$UpcomingScheduleResponse {
  factory UpcomingScheduleResponse({
    String? title,
    String? startDateTime,
  }) = _UpcomingScheduleResponse;

  factory UpcomingScheduleResponse.fromJson(Map<String, dynamic> json) =>
      _$UpcomingScheduleResponseFromJson(json);
}
