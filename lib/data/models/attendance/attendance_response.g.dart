// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AttendanceResponse _$$_AttendanceResponseFromJson(
        Map<String, dynamic> json) =>
    _$_AttendanceResponse(
      attendanceId: json['attendanceId'] as int,
      nickname: json['nickname'] as String,
      isAttend: json['isAttend'] as bool,
      imageUrl: json['imageUrl'] as String?,
      attendanceRate: json['attendanceRate'] as int?,
    );

Map<String, dynamic> _$$_AttendanceResponseToJson(
        _$_AttendanceResponse instance) =>
    <String, dynamic>{
      'attendanceId': instance.attendanceId,
      'nickname': instance.nickname,
      'isAttend': instance.isAttend,
      'imageUrl': instance.imageUrl,
      'attendanceRate': instance.attendanceRate,
    };
