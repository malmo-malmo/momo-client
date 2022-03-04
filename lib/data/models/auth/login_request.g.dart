// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoginRequest _$$_LoginRequestFromJson(Map<String, dynamic> json) =>
    _$_LoginRequest(
      provider: json['provider'] as String,
      authorizationCode: json['authorizationCode'] as String,
      deviceCode: json['deviceCode'] as String,
    );

Map<String, dynamic> _$$_LoginRequestToJson(_$_LoginRequest instance) =>
    <String, dynamic>{
      'provider': instance.provider,
      'authorizationCode': instance.authorizationCode,
      'deviceCode': instance.deviceCode,
    };
