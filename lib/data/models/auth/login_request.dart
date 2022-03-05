import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_request.g.dart';
part 'login_request.freezed.dart';

@freezed
class LoginRequest with _$LoginRequest {
  factory LoginRequest({
    required String provider,
    required String authorizationCode,
    required String deviceCode,
  }) = _LoginRequest;

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
}
