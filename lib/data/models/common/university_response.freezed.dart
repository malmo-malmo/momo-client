// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'university_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UniversityResponse _$UniversityResponseFromJson(Map<String, dynamic> json) {
  return _UniversityResponse.fromJson(json);
}

/// @nodoc
class _$UniversityResponseTearOff {
  const _$UniversityResponseTearOff();

  _UniversityResponse call({required String name}) {
    return _UniversityResponse(
      name: name,
    );
  }

  UniversityResponse fromJson(Map<String, Object?> json) {
    return UniversityResponse.fromJson(json);
  }
}

/// @nodoc
const $UniversityResponse = _$UniversityResponseTearOff();

/// @nodoc
mixin _$UniversityResponse {
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UniversityResponseCopyWith<UniversityResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UniversityResponseCopyWith<$Res> {
  factory $UniversityResponseCopyWith(
          UniversityResponse value, $Res Function(UniversityResponse) then) =
      _$UniversityResponseCopyWithImpl<$Res>;
  $Res call({String name});
}

/// @nodoc
class _$UniversityResponseCopyWithImpl<$Res>
    implements $UniversityResponseCopyWith<$Res> {
  _$UniversityResponseCopyWithImpl(this._value, this._then);

  final UniversityResponse _value;
  // ignore: unused_field
  final $Res Function(UniversityResponse) _then;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$UniversityResponseCopyWith<$Res>
    implements $UniversityResponseCopyWith<$Res> {
  factory _$UniversityResponseCopyWith(
          _UniversityResponse value, $Res Function(_UniversityResponse) then) =
      __$UniversityResponseCopyWithImpl<$Res>;
  @override
  $Res call({String name});
}

/// @nodoc
class __$UniversityResponseCopyWithImpl<$Res>
    extends _$UniversityResponseCopyWithImpl<$Res>
    implements _$UniversityResponseCopyWith<$Res> {
  __$UniversityResponseCopyWithImpl(
      _UniversityResponse _value, $Res Function(_UniversityResponse) _then)
      : super(_value, (v) => _then(v as _UniversityResponse));

  @override
  _UniversityResponse get _value => super._value as _UniversityResponse;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_UniversityResponse(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UniversityResponse implements _UniversityResponse {
  _$_UniversityResponse({required this.name});

  factory _$_UniversityResponse.fromJson(Map<String, dynamic> json) =>
      _$$_UniversityResponseFromJson(json);

  @override
  final String name;

  @override
  String toString() {
    return 'UniversityResponse(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UniversityResponse &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$UniversityResponseCopyWith<_UniversityResponse> get copyWith =>
      __$UniversityResponseCopyWithImpl<_UniversityResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UniversityResponseToJson(this);
  }
}

abstract class _UniversityResponse implements UniversityResponse {
  factory _UniversityResponse({required String name}) = _$_UniversityResponse;

  factory _UniversityResponse.fromJson(Map<String, dynamic> json) =
      _$_UniversityResponse.fromJson;

  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$UniversityResponseCopyWith<_UniversityResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
