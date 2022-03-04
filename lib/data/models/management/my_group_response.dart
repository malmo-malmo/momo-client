import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_group_response.g.dart';
part 'my_group_response.freezed.dart';

@freezed
class MyGroupResponse with _$MyGroupResponse {
  factory MyGroupResponse({
    required int id,
    required String name,
    String? imageUrl,
    int? achievementRate,
  }) = _MyGroupResponse;

  factory MyGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$MyGroupResponseFromJson(json);
}
