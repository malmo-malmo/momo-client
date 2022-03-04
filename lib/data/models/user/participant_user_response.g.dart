// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participant_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ParticipantUserResponse _$$_ParticipantUserResponseFromJson(
        Map<String, dynamic> json) =>
    _$_ParticipantUserResponse(
      userId: json['userId'] as int,
      participantId: json['participantId'] as int,
      nickname: json['nickname'] as String,
      imageUrl: json['imageUrl'] as String?,
      attendanceRate: json['attendanceRate'] as int,
    );

Map<String, dynamic> _$$_ParticipantUserResponseToJson(
        _$_ParticipantUserResponse instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'participantId': instance.participantId,
      'nickname': instance.nickname,
      'imageUrl': instance.imageUrl,
      'attendanceRate': instance.attendanceRate,
    };
