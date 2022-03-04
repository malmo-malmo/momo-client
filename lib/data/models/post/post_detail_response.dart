import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_detail_response.g.dart';
part 'post_detail_response.freezed.dart';

@freezed
class PostDetailResponse with _$PostDetailResponse {
  factory PostDetailResponse({
    required int id,
    required int authorId,
    required String authorNickname,
    required String title,
    required String contents,
    String? authorImage,
    required List<String> imageUrls,
    required String createdDate,
  }) = _PostDetailResponse;

  factory PostDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$PostDetailResponseFromJson(json);
}
