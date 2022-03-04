import 'package:freezed_annotation/freezed_annotation.dart';

part 'university_response.g.dart';
part 'university_response.freezed.dart';

@freezed
class UniversityResponse with _$UniversityResponse {
  factory UniversityResponse({
    required String name,
  }) = _UniversityResponse;

  factory UniversityResponse.fromJson(Map<String, dynamic> json) =>
      _$UniversityResponseFromJson(json);
}
