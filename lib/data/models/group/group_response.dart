import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_response.g.dart';
part 'group_response.freezed.dart';

@freezed
class GroupResponse with _$GroupResponse {
  factory GroupResponse({
    required int id,
    required String name,
    required bool offline,
    required int participantCnt,
    required String startDate,
    String? imageUrl,
    required bool favoriteGroup,
  }) = _GroupResponse;

  factory GroupResponse.fromJson(Map<String, dynamic> json) =>
      _$GroupResponseFromJson(json);
}
