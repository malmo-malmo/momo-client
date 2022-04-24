import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_url_response.g.dart';
part 'image_url_response.freezed.dart';

@freezed
class ImageUrlResponse with _$ImageUrlResponse {
  factory ImageUrlResponse({required String imageUrl}) = _ImageUrlResponse;

  factory ImageUrlResponse.fromJson(Map<String, dynamic> json) => _$ImageUrlResponseFromJson(json);
}
