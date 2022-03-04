import 'package:freezed_annotation/freezed_annotation.dart';

part 'participant_user_response.g.dart';
part 'participant_user_response.freezed.dart';

@freezed
class ParticipantUserResponse with _$ParticipantUserResponse {
  factory ParticipantUserResponse({
    required int userId,
    required int participantId,
    required String nickname,
    String? imageUrl,
    required int attendanceRate,
  }) = _ParticipantUserResponse;

  factory ParticipantUserResponse.fromJson(Map<String, dynamic> json) =>
      _$ParticipantUserResponseFromJson(json);
}
