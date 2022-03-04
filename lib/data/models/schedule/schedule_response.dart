import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:momo_flutter/data/models/schedule/schedule_detail_response.dart';

part 'schedule_response.g.dart';
part 'schedule_response.freezed.dart';

@freezed
class ScheduleResponse with _$ScheduleResponse {
  factory ScheduleResponse({
    required int managerId,
    required List<ScheduleDetailResponse> groupScheduleResponses,
  }) = _ScheduleResponse;

  factory ScheduleResponse.fromJson(Map<String, dynamic> json) =>
      _$ScheduleResponseFromJson(json);
}
