import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_create_response.g.dart';
part 'group_create_response.freezed.dart';

@freezed
class GroupCreateResponse with _$GroupCreateResponse {
  factory GroupCreateResponse({
    required int id,
    required String? imageUrl,
  }) = _GroupCreateResponse;

  factory GroupCreateResponse.fromJson(Map<String, dynamic> json) => _$GroupCreateResponseFromJson(json);
}
