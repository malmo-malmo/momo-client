import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_response.g.dart';
part 'post_response.freezed.dart';

@freezed
class PostResponse with _$PostResponse {
  factory PostResponse({
    required int id,
    required String authorNickname,
    required String title,
    required String contents,
    required String createdDate,
    int? commentCnt,
    String? authorImage,
  }) = _PostResponse;

  factory PostResponse.fromJson(Map<String, dynamic> json) =>
      _$PostResponseFromJson(json);
}
