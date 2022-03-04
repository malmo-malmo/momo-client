// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostResponse _$$_PostResponseFromJson(Map<String, dynamic> json) =>
    _$_PostResponse(
      id: json['id'] as int,
      authorNickname: json['authorNickname'] as String,
      title: json['title'] as String,
      contents: json['contents'] as String,
      createdDate: json['createdDate'] as String,
      commentCnt: json['commentCnt'] as int?,
      authorImage: json['authorImage'] as String?,
    );

Map<String, dynamic> _$$_PostResponseToJson(_$_PostResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'authorNickname': instance.authorNickname,
      'title': instance.title,
      'contents': instance.contents,
      'createdDate': instance.createdDate,
      'commentCnt': instance.commentCnt,
      'authorImage': instance.authorImage,
    };
