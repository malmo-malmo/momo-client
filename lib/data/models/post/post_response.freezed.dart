// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostResponse _$PostResponseFromJson(Map<String, dynamic> json) {
  return _PostResponse.fromJson(json);
}

/// @nodoc
class _$PostResponseTearOff {
  const _$PostResponseTearOff();

  _PostResponse call(
      {required int id,
      required String authorNickname,
      required String title,
      required String contents,
      required String createdDate,
      int? commentCnt,
      String? authorImage}) {
    return _PostResponse(
      id: id,
      authorNickname: authorNickname,
      title: title,
      contents: contents,
      createdDate: createdDate,
      commentCnt: commentCnt,
      authorImage: authorImage,
    );
  }

  PostResponse fromJson(Map<String, Object?> json) {
    return PostResponse.fromJson(json);
  }
}

/// @nodoc
const $PostResponse = _$PostResponseTearOff();

/// @nodoc
mixin _$PostResponse {
  int get id => throw _privateConstructorUsedError;
  String get authorNickname => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get contents => throw _privateConstructorUsedError;
  String get createdDate => throw _privateConstructorUsedError;
  int? get commentCnt => throw _privateConstructorUsedError;
  String? get authorImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostResponseCopyWith<PostResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostResponseCopyWith<$Res> {
  factory $PostResponseCopyWith(
          PostResponse value, $Res Function(PostResponse) then) =
      _$PostResponseCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String authorNickname,
      String title,
      String contents,
      String createdDate,
      int? commentCnt,
      String? authorImage});
}

/// @nodoc
class _$PostResponseCopyWithImpl<$Res> implements $PostResponseCopyWith<$Res> {
  _$PostResponseCopyWithImpl(this._value, this._then);

  final PostResponse _value;
  // ignore: unused_field
  final $Res Function(PostResponse) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? authorNickname = freezed,
    Object? title = freezed,
    Object? contents = freezed,
    Object? createdDate = freezed,
    Object? commentCnt = freezed,
    Object? authorImage = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      authorNickname: authorNickname == freezed
          ? _value.authorNickname
          : authorNickname // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      contents: contents == freezed
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: createdDate == freezed
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String,
      commentCnt: commentCnt == freezed
          ? _value.commentCnt
          : commentCnt // ignore: cast_nullable_to_non_nullable
              as int?,
      authorImage: authorImage == freezed
          ? _value.authorImage
          : authorImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$PostResponseCopyWith<$Res>
    implements $PostResponseCopyWith<$Res> {
  factory _$PostResponseCopyWith(
          _PostResponse value, $Res Function(_PostResponse) then) =
      __$PostResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String authorNickname,
      String title,
      String contents,
      String createdDate,
      int? commentCnt,
      String? authorImage});
}

/// @nodoc
class __$PostResponseCopyWithImpl<$Res> extends _$PostResponseCopyWithImpl<$Res>
    implements _$PostResponseCopyWith<$Res> {
  __$PostResponseCopyWithImpl(
      _PostResponse _value, $Res Function(_PostResponse) _then)
      : super(_value, (v) => _then(v as _PostResponse));

  @override
  _PostResponse get _value => super._value as _PostResponse;

  @override
  $Res call({
    Object? id = freezed,
    Object? authorNickname = freezed,
    Object? title = freezed,
    Object? contents = freezed,
    Object? createdDate = freezed,
    Object? commentCnt = freezed,
    Object? authorImage = freezed,
  }) {
    return _then(_PostResponse(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      authorNickname: authorNickname == freezed
          ? _value.authorNickname
          : authorNickname // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      contents: contents == freezed
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: createdDate == freezed
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String,
      commentCnt: commentCnt == freezed
          ? _value.commentCnt
          : commentCnt // ignore: cast_nullable_to_non_nullable
              as int?,
      authorImage: authorImage == freezed
          ? _value.authorImage
          : authorImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PostResponse implements _PostResponse {
  _$_PostResponse(
      {required this.id,
      required this.authorNickname,
      required this.title,
      required this.contents,
      required this.createdDate,
      this.commentCnt,
      this.authorImage});

  factory _$_PostResponse.fromJson(Map<String, dynamic> json) =>
      _$$_PostResponseFromJson(json);

  @override
  final int id;
  @override
  final String authorNickname;
  @override
  final String title;
  @override
  final String contents;
  @override
  final String createdDate;
  @override
  final int? commentCnt;
  @override
  final String? authorImage;

  @override
  String toString() {
    return 'PostResponse(id: $id, authorNickname: $authorNickname, title: $title, contents: $contents, createdDate: $createdDate, commentCnt: $commentCnt, authorImage: $authorImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PostResponse &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.authorNickname, authorNickname) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.contents, contents) &&
            const DeepCollectionEquality()
                .equals(other.createdDate, createdDate) &&
            const DeepCollectionEquality()
                .equals(other.commentCnt, commentCnt) &&
            const DeepCollectionEquality()
                .equals(other.authorImage, authorImage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(authorNickname),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(contents),
      const DeepCollectionEquality().hash(createdDate),
      const DeepCollectionEquality().hash(commentCnt),
      const DeepCollectionEquality().hash(authorImage));

  @JsonKey(ignore: true)
  @override
  _$PostResponseCopyWith<_PostResponse> get copyWith =>
      __$PostResponseCopyWithImpl<_PostResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostResponseToJson(this);
  }
}

abstract class _PostResponse implements PostResponse {
  factory _PostResponse(
      {required int id,
      required String authorNickname,
      required String title,
      required String contents,
      required String createdDate,
      int? commentCnt,
      String? authorImage}) = _$_PostResponse;

  factory _PostResponse.fromJson(Map<String, dynamic> json) =
      _$_PostResponse.fromJson;

  @override
  int get id;
  @override
  String get authorNickname;
  @override
  String get title;
  @override
  String get contents;
  @override
  String get createdDate;
  @override
  int? get commentCnt;
  @override
  String? get authorImage;
  @override
  @JsonKey(ignore: true)
  _$PostResponseCopyWith<_PostResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
