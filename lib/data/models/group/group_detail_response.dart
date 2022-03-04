import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_detail_response.g.dart';
part 'group_detail_response.freezed.dart';

@freezed
class GroupDetailResponse with _$GroupDetailResponse {
  factory GroupDetailResponse({
    required int id,
    required int managerId,
    required String city,
    required String district,
    String? imageUrl,
    required String introduction,
    required String name,
    required bool offline,
    required bool participant,
    required int participantCnt,
    required String startDate,
    String? university,
    required bool end,
    required int recruitmentCnt,
  }) = _GroupDetailResponse;

  factory GroupDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$GroupDetailResponseFromJson(json);
}
