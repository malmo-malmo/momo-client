// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'group_create_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GroupCreateResponse _$GroupCreateResponseFromJson(Map<String, dynamic> json) {
  return _GroupCreateResponse.fromJson(json);
}

/// @nodoc
class _$GroupCreateResponseTearOff {
  const _$GroupCreateResponseTearOff();

  _GroupCreateResponse call({required int id, required String? imageUrl}) {
    return _GroupCreateResponse(
      id: id,
      imageUrl: imageUrl,
    );
  }

  GroupCreateResponse fromJson(Map<String, Object?> json) {
    return GroupCreateResponse.fromJson(json);
  }
}

/// @nodoc
const $GroupCreateResponse = _$GroupCreateResponseTearOff();

/// @nodoc
mixin _$GroupCreateResponse {
  int get id => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GroupCreateResponseCopyWith<GroupCreateResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupCreateResponseCopyWith<$Res> {
  factory $GroupCreateResponseCopyWith(
          GroupCreateResponse value, $Res Function(GroupCreateResponse) then) =
      _$GroupCreateResponseCopyWithImpl<$Res>;
  $Res call({int id, String? imageUrl});
}

/// @nodoc
class _$GroupCreateResponseCopyWithImpl<$Res>
    implements $GroupCreateResponseCopyWith<$Res> {
  _$GroupCreateResponseCopyWithImpl(this._value, this._then);

  final GroupCreateResponse _value;
  // ignore: unused_field
  final $Res Function(GroupCreateResponse) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$GroupCreateResponseCopyWith<$Res>
    implements $GroupCreateResponseCopyWith<$Res> {
  factory _$GroupCreateResponseCopyWith(_GroupCreateResponse value,
          $Res Function(_GroupCreateResponse) then) =
      __$GroupCreateResponseCopyWithImpl<$Res>;
  @override
  $Res call({int id, String? imageUrl});
}

/// @nodoc
class __$GroupCreateResponseCopyWithImpl<$Res>
    extends _$GroupCreateResponseCopyWithImpl<$Res>
    implements _$GroupCreateResponseCopyWith<$Res> {
  __$GroupCreateResponseCopyWithImpl(
      _GroupCreateResponse _value, $Res Function(_GroupCreateResponse) _then)
      : super(_value, (v) => _then(v as _GroupCreateResponse));

  @override
  _GroupCreateResponse get _value => super._value as _GroupCreateResponse;

  @override
  $Res call({
    Object? id = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_GroupCreateResponse(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GroupCreateResponse implements _GroupCreateResponse {
  _$_GroupCreateResponse({required this.id, required this.imageUrl});

  factory _$_GroupCreateResponse.fromJson(Map<String, dynamic> json) =>
      _$$_GroupCreateResponseFromJson(json);

  @override
  final int id;
  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'GroupCreateResponse(id: $id, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GroupCreateResponse &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(imageUrl));

  @JsonKey(ignore: true)
  @override
  _$GroupCreateResponseCopyWith<_GroupCreateResponse> get copyWith =>
      __$GroupCreateResponseCopyWithImpl<_GroupCreateResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GroupCreateResponseToJson(this);
  }
}

abstract class _GroupCreateResponse implements GroupCreateResponse {
  factory _GroupCreateResponse({required int id, required String? imageUrl}) =
      _$_GroupCreateResponse;

  factory _GroupCreateResponse.fromJson(Map<String, dynamic> json) =
      _$_GroupCreateResponse.fromJson;

  @override
  int get id;
  @override
  String? get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$GroupCreateResponseCopyWith<_GroupCreateResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
