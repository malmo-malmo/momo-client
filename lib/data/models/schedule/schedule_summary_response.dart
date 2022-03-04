import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:momo_flutter/data/models/common/code_name_pair.dart';

part 'schedule_summary_response.g.dart';
part 'schedule_summary_response.freezed.dart';

@freezed
class ScheduleSummaryResponse with _$ScheduleSummaryResponse {
  factory ScheduleSummaryResponse({
    required int groupId,
    required String startDateTime,
    required String title,
    @JsonKey(name: 'groupCategory') required CodeNamePair category,
  }) = _ScheduleSummaryResponse;

  factory ScheduleSummaryResponse.fromJson(Map<String, dynamic> json) =>
      _$ScheduleSummaryResponseFromJson(json);
}
