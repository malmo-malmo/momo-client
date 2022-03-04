// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RefreshRequest _$$_RefreshRequestFromJson(Map<String, dynamic> json) =>
    _$_RefreshRequest(
      refreshToken: json['refreshToken'] as String,
      deviceCode: json['deviceCode'] as String,
    );

Map<String, dynamic> _$$_RefreshRequestToJson(_$_RefreshRequest instance) =>
    <String, dynamic>{
      'refreshToken': instance.refreshToken,
      'deviceCode': instance.deviceCode,
    };
