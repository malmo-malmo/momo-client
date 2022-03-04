// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_summary_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ScheduleSummaryResponse _$$_ScheduleSummaryResponseFromJson(
        Map<String, dynamic> json) =>
    _$_ScheduleSummaryResponse(
      groupId: json['groupId'] as int,
      startDateTime: json['startDateTime'] as String,
      title: json['title'] as String,
      category:
          CodeNamePair.fromJson(json['groupCategory'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ScheduleSummaryResponseToJson(
        _$_ScheduleSummaryResponse instance) =>
    <String, dynamic>{
      'groupId': instance.groupId,
      'startDateTime': instance.startDateTime,
      'title': instance.title,
      'groupCategory': instance.category,
    };
