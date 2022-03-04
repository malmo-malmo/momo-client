// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post_detail_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostDetailResponse _$PostDetailResponseFromJson(Map<String, dynamic> json) {
  return _PostDetailResponse.fromJson(json);
}

/// @nodoc
class _$PostDetailResponseTearOff {
  const _$PostDetailResponseTearOff();

  _PostDetailResponse call(
      {required int id,
      required int authorId,
      required String authorNickname,
      required String title,
      required String contents,
      String? authorImage,
      required List<String> imageUrls,
      required String createdDate}) {
    return _PostDetailResponse(
      id: id,
      authorId: authorId,
      authorNickname: authorNickname,
      title: title,
      contents: contents,
      authorImage: authorImage,
      imageUrls: imageUrls,
      createdDate: createdDate,
    );
  }

  PostDetailResponse fromJson(Map<String, Object?> json) {
    return PostDetailResponse.fromJson(json);
  }
}

/// @nodoc
const $PostDetailResponse = _$PostDetailResponseTearOff();

/// @nodoc
mixin _$PostDetailResponse {
  int get id => throw _privateConstructorUsedError;
  int get authorId => throw _privateConstructorUsedError;
  String get authorNickname => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get contents => throw _privateConstructorUsedError;
  String? get authorImage => throw _privateConstructorUsedError;
  List<String> get imageUrls => throw _privateConstructorUsedError;
  String get createdDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostDetailResponseCopyWith<PostDetailResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostDetailResponseCopyWith<$Res> {
  factory $PostDetailResponseCopyWith(
          PostDetailResponse value, $Res Function(PostDetailResponse) then) =
      _$PostDetailResponseCopyWithImpl<$Res>;
  $Res call(
      {int id,
      int authorId,
      String authorNickname,
      String title,
      String contents,
      String? authorImage,
      List<String> imageUrls,
      String createdDate});
}

/// @nodoc
class _$PostDetailResponseCopyWithImpl<$Res>
    implements $PostDetailResponseCopyWith<$Res> {
  _$PostDetailResponseCopyWithImpl(this._value, this._then);

  final PostDetailResponse _value;
  // ignore: unused_field
  final $Res Function(PostDetailResponse) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? authorId = freezed,
    Object? authorNickname = freezed,
    Object? title = freezed,
    Object? contents = freezed,
    Object? authorImage = freezed,
    Object? imageUrls = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      authorId: authorId == freezed
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
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
      authorImage: authorImage == freezed
          ? _value.authorImage
          : authorImage // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrls: imageUrls == freezed
          ? _value.imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdDate: createdDate == freezed
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$PostDetailResponseCopyWith<$Res>
    implements $PostDetailResponseCopyWith<$Res> {
  factory _$PostDetailResponseCopyWith(
          _PostDetailResponse value, $Res Function(_PostDetailResponse) then) =
      __$PostDetailResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      int authorId,
      String authorNickname,
      String title,
      String contents,
      String? authorImage,
      List<String> imageUrls,
      String createdDate});
}

/// @nodoc
class __$PostDetailResponseCopyWithImpl<$Res>
    extends _$PostDetailResponseCopyWithImpl<$Res>
    implements _$PostDetailResponseCopyWith<$Res> {
  __$PostDetailResponseCopyWithImpl(
      _PostDetailResponse _value, $Res Function(_PostDetailResponse) _then)
      : super(_value, (v) => _then(v as _PostDetailResponse));

  @override
  _PostDetailResponse get _value => super._value as _PostDetailResponse;

  @override
  $Res call({
    Object? id = freezed,
    Object? authorId = freezed,
    Object? authorNickname = freezed,
    Object? title = freezed,
    Object? contents = freezed,
    Object? authorImage = freezed,
    Object? imageUrls = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_PostDetailResponse(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      authorId: authorId == freezed
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
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
      authorImage: authorImage == freezed
          ? _value.authorImage
          : authorImage // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrls: imageUrls == freezed
          ? _value.imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdDate: createdDate == freezed
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PostDetailResponse implements _PostDetailResponse {
  _$_PostDetailResponse(
      {required this.id,
      required this.authorId,
      required this.authorNickname,
      required this.title,
      required this.contents,
      this.authorImage,
      required this.imageUrls,
      required this.createdDate});

  factory _$_PostDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$$_PostDetailResponseFromJson(json);

  @override
  final int id;
  @override
  final int authorId;
  @override
  final String authorNickname;
  @override
  final String title;
  @override
  final String contents;
  @override
  final String? authorImage;
  @override
  final List<String> imageUrls;
  @override
  final String createdDate;

  @override
  String toString() {
    return 'PostDetailResponse(id: $id, authorId: $authorId, authorNickname: $authorNickname, title: $title, contents: $contents, authorImage: $authorImage, imageUrls: $imageUrls, createdDate: $createdDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PostDetailResponse &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.authorId, authorId) &&
            const DeepCollectionEquality()
                .equals(other.authorNickname, authorNickname) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.contents, contents) &&
            const DeepCollectionEquality()
                .equals(other.authorImage, authorImage) &&
            const DeepCollectionEquality().equals(other.imageUrls, imageUrls) &&
            const DeepCollectionEquality()
                .equals(other.createdDate, createdDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(authorId),
      const DeepCollectionEquality().hash(authorNickname),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(contents),
      const DeepCollectionEquality().hash(authorImage),
      const DeepCollectionEquality().hash(imageUrls),
      const DeepCollectionEquality().hash(createdDate));

  @JsonKey(ignore: true)
  @override
  _$PostDetailResponseCopyWith<_PostDetailResponse> get copyWith =>
      __$PostDetailResponseCopyWithImpl<_PostDetailResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostDetailResponseToJson(this);
  }
}

abstract class _PostDetailResponse implements PostDetailResponse {
  factory _PostDetailResponse(
      {required int id,
      required int authorId,
      required String authorNickname,
      required String title,
      required String contents,
      String? authorImage,
      required List<String> imageUrls,
      required String createdDate}) = _$_PostDetailResponse;

  factory _PostDetailResponse.fromJson(Map<String, dynamic> json) =
      _$_PostDetailResponse.fromJson;

  @override
  int get id;
  @override
  int get authorId;
  @override
  String get authorNickname;
  @override
  String get title;
  @override
  String get contents;
  @override
  String? get authorImage;
  @override
  List<String> get imageUrls;
  @override
  String get createdDate;
  @override
  @JsonKey(ignore: true)
  _$PostDetailResponseCopyWith<_PostDetailResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
