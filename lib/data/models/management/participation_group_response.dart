import 'package:freezed_annotation/freezed_annotation.dart';

part 'participation_group_response.g.dart';
part 'participation_group_response.freezed.dart';

@freezed
class ParticipationGroupResponse with _$ParticipationGroupResponse {
  factory ParticipationGroupResponse({
    required int id,
    required String name,
    required bool offline,
    required int participantCnt,
    required String startDate,
    String? imageUrl,
    required bool end,
  }) = _ParticipationGroupResponse;

  factory ParticipationGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$ParticipationGroupResponseFromJson(json);
}
