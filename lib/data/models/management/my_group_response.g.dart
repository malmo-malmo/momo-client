// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_group_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MyGroupResponse _$$_MyGroupResponseFromJson(Map<String, dynamic> json) =>
    _$_MyGroupResponse(
      id: json['id'] as int,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String?,
      achievementRate: json['achievementRate'] as int?,
    );

Map<String, dynamic> _$$_MyGroupResponseToJson(_$_MyGroupResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'achievementRate': instance.achievementRate,
    };
