// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ScheduleDetailResponse _$$_ScheduleDetailResponseFromJson(
        Map<String, dynamic> json) =>
    _$_ScheduleDetailResponse(
      scheduleId: json['scheduleId'] as int,
      title: json['title'] as String,
      contents: json['contents'] as String,
      authorNickname: json['authorNickname'] as String,
      authorImage: json['authorImage'] as String?,
      startDateTime: json['startDateTime'] as String,
      offline: json['offline'] as bool,
      attend: json['attend'] as bool,
      attendanceCheck: json['attendanceCheck'] as bool,
    );

Map<String, dynamic> _$$_ScheduleDetailResponseToJson(
        _$_ScheduleDetailResponse instance) =>
    <String, dynamic>{
      'scheduleId': instance.scheduleId,
      'title': instance.title,
      'contents': instance.contents,
      'authorNickname': instance.authorNickname,
      'authorImage': instance.authorImage,
      'startDateTime': instance.startDateTime,
      'offline': instance.offline,
      'attend': instance.attend,
      'attendanceCheck': instance.attendanceCheck,
    };
