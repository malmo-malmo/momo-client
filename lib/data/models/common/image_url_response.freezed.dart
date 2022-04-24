// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'image_url_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ImageUrlResponse _$ImageUrlResponseFromJson(Map<String, dynamic> json) {
  return _ImageUrlResponse.fromJson(json);
}

/// @nodoc
class _$ImageUrlResponseTearOff {
  const _$ImageUrlResponseTearOff();

  _ImageUrlResponse call({required String imageUrl}) {
    return _ImageUrlResponse(
      imageUrl: imageUrl,
    );
  }

  ImageUrlResponse fromJson(Map<String, Object?> json) {
    return ImageUrlResponse.fromJson(json);
  }
}

/// @nodoc
const $ImageUrlResponse = _$ImageUrlResponseTearOff();

/// @nodoc
mixin _$ImageUrlResponse {
  String get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageUrlResponseCopyWith<ImageUrlResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageUrlResponseCopyWith<$Res> {
  factory $ImageUrlResponseCopyWith(
          ImageUrlResponse value, $Res Function(ImageUrlResponse) then) =
      _$ImageUrlResponseCopyWithImpl<$Res>;
  $Res call({String imageUrl});
}

/// @nodoc
class _$ImageUrlResponseCopyWithImpl<$Res>
    implements $ImageUrlResponseCopyWith<$Res> {
  _$ImageUrlResponseCopyWithImpl(this._value, this._then);

  final ImageUrlResponse _value;
  // ignore: unused_field
  final $Res Function(ImageUrlResponse) _then;

  @override
  $Res call({
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ImageUrlResponseCopyWith<$Res>
    implements $ImageUrlResponseCopyWith<$Res> {
  factory _$ImageUrlResponseCopyWith(
          _ImageUrlResponse value, $Res Function(_ImageUrlResponse) then) =
      __$ImageUrlResponseCopyWithImpl<$Res>;
  @override
  $Res call({String imageUrl});
}

/// @nodoc
class __$ImageUrlResponseCopyWithImpl<$Res>
    extends _$ImageUrlResponseCopyWithImpl<$Res>
    implements _$ImageUrlResponseCopyWith<$Res> {
  __$ImageUrlResponseCopyWithImpl(
      _ImageUrlResponse _value, $Res Function(_ImageUrlResponse) _then)
      : super(_value, (v) => _then(v as _ImageUrlResponse));

  @override
  _ImageUrlResponse get _value => super._value as _ImageUrlResponse;

  @override
  $Res call({
    Object? imageUrl = freezed,
  }) {
    return _then(_ImageUrlResponse(
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ImageUrlResponse implements _ImageUrlResponse {
  _$_ImageUrlResponse({required this.imageUrl});

  factory _$_ImageUrlResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ImageUrlResponseFromJson(json);

  @override
  final String imageUrl;

  @override
  String toString() {
    return 'ImageUrlResponse(imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ImageUrlResponse &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(imageUrl));

  @JsonKey(ignore: true)
  @override
  _$ImageUrlResponseCopyWith<_ImageUrlResponse> get copyWith =>
      __$ImageUrlResponseCopyWithImpl<_ImageUrlResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ImageUrlResponseToJson(this);
  }
}

abstract class _ImageUrlResponse implements ImageUrlResponse {
  factory _ImageUrlResponse({required String imageUrl}) = _$_ImageUrlResponse;

  factory _ImageUrlResponse.fromJson(Map<String, dynamic> json) =
      _$_ImageUrlResponse.fromJson;

  @override
  String get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$ImageUrlResponseCopyWith<_ImageUrlResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
