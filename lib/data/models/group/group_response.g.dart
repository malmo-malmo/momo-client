// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GroupResponse _$$_GroupResponseFromJson(Map<String, dynamic> json) =>
    _$_GroupResponse(
      id: json['id'] as int,
      name: json['name'] as String,
      offline: json['offline'] as bool,
      participantCnt: json['participantCnt'] as int,
      startDate: json['startDate'] as String,
      imageUrl: json['imageUrl'] as String?,
      favoriteGroup: json['favoriteGroup'] as bool,
    );

Map<String, dynamic> _$$_GroupResponseToJson(_$_GroupResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'offline': instance.offline,
      'participantCnt': instance.participantCnt,
      'startDate': instance.startDate,
      'imageUrl': instance.imageUrl,
      'favoriteGroup': instance.favoriteGroup,
    };
