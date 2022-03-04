import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:momo_flutter/data/models/group/group_response.dart';

part 'wish_group_response.g.dart';
part 'wish_group_response.freezed.dart';

@freezed
class WishGroupResponse with _$WishGroupResponse {
  factory WishGroupResponse({
    required int id,
    required GroupResponse groupCardResponse,
  }) = _WishGroupResponse;

  factory WishGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$WishGroupResponseFromJson(json);
}
