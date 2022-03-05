import 'package:freezed_annotation/freezed_annotation.dart';

part 'refresh_request.g.dart';
part 'refresh_request.freezed.dart';

@freezed
class RefreshRequest with _$RefreshRequest {
  factory RefreshRequest({
    required String refreshToken,
    required String deviceCode,
  }) = _RefreshRequest;

  factory RefreshRequest.fromJson(Map<String, dynamic> json) =>
      _$RefreshRequestFromJson(json);
}
