import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:momo_flutter/data/models/common/code_name_pair.dart';

part 'user_update_response.g.dart';
part 'user_update_response.freezed.dart';

@freezed
class UserUpdateResponse with _$UserUpdateResponse {
  factory UserUpdateResponse({
    required String nickname,
    required CodeNamePair city,
    required String district,
    required String university,
  }) = _UserUpdateReponse;

  factory UserUpdateResponse.fromJson(Map<String, dynamic> json) =>
      _$UserUpdateResponseFromJson(json);
}
