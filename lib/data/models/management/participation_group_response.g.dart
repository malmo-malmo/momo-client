// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participation_group_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ParticipationGroupResponse _$$_ParticipationGroupResponseFromJson(
        Map<String, dynamic> json) =>
    _$_ParticipationGroupResponse(
      id: json['id'] as int,
      name: json['name'] as String,
      offline: json['offline'] as bool,
      participantCnt: json['participantCnt'] as int,
      startDate: json['startDate'] as String,
      imageUrl: json['imageUrl'] as String?,
      end: json['end'] as bool,
    );

Map<String, dynamic> _$$_ParticipationGroupResponseToJson(
        _$_ParticipationGroupResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'offline': instance.offline,
      'participantCnt': instance.participantCnt,
      'startDate': instance.startDate,
      'imageUrl': instance.imageUrl,
      'end': instance.end,
    };
