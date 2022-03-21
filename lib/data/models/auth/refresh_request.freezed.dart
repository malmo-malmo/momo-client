// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'refresh_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RefreshRequest _$RefreshRequestFromJson(Map<String, dynamic> json) {
  return _RefreshRequest.fromJson(json);
}

/// @nodoc
class _$RefreshRequestTearOff {
  const _$RefreshRequestTearOff();

  _RefreshRequest call(
      {required String refreshToken, required String deviceCode}) {
    return _RefreshRequest(
      refreshToken: refreshToken,
      deviceCode: deviceCode,
    );
  }

  RefreshRequest fromJson(Map<String, Object?> json) {
    return RefreshRequest.fromJson(json);
  }
}

/// @nodoc
const $RefreshRequest = _$RefreshRequestTearOff();

/// @nodoc
mixin _$RefreshRequest {
  String get refreshToken => throw _privateConstructorUsedError;
  String get deviceCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RefreshRequestCopyWith<RefreshRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefreshRequestCopyWith<$Res> {
  factory $RefreshRequestCopyWith(
          RefreshRequest value, $Res Function(RefreshRequest) then) =
      _$RefreshRequestCopyWithImpl<$Res>;
  $Res call({String refreshToken, String deviceCode});
}

/// @nodoc
class _$RefreshRequestCopyWithImpl<$Res>
    implements $RefreshRequestCopyWith<$Res> {
  _$RefreshRequestCopyWithImpl(this._value, this._then);

  final RefreshRequest _value;
  // ignore: unused_field
  final $Res Function(RefreshRequest) _then;

  @override
  $Res call({
    Object? refreshToken = freezed,
    Object? deviceCode = freezed,
  }) {
    return _then(_value.copyWith(
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      deviceCode: deviceCode == freezed
          ? _value.deviceCode
          : deviceCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$RefreshRequestCopyWith<$Res>
    implements $RefreshRequestCopyWith<$Res> {
  factory _$RefreshRequestCopyWith(
          _RefreshRequest value, $Res Function(_RefreshRequest) then) =
      __$RefreshRequestCopyWithImpl<$Res>;
  @override
  $Res call({String refreshToken, String deviceCode});
}

/// @nodoc
class __$RefreshRequestCopyWithImpl<$Res>
    extends _$RefreshRequestCopyWithImpl<$Res>
    implements _$RefreshRequestCopyWith<$Res> {
  __$RefreshRequestCopyWithImpl(
      _RefreshRequest _value, $Res Function(_RefreshRequest) _then)
      : super(_value, (v) => _then(v as _RefreshRequest));

  @override
  _RefreshRequest get _value => super._value as _RefreshRequest;

  @override
  $Res call({
    Object? refreshToken = freezed,
    Object? deviceCode = freezed,
  }) {
    return _then(_RefreshRequest(
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      deviceCode: deviceCode == freezed
          ? _value.deviceCode
          : deviceCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RefreshRequest implements _RefreshRequest {
  _$_RefreshRequest({required this.refreshToken, required this.deviceCode});

  factory _$_RefreshRequest.fromJson(Map<String, dynamic> json) =>
      _$$_RefreshRequestFromJson(json);

  @override
  final String refreshToken;
  @override
  final String deviceCode;

  @override
  String toString() {
    return 'RefreshRequest(refreshToken: $refreshToken, deviceCode: $deviceCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RefreshRequest &&
            const DeepCollectionEquality()
                .equals(other.refreshToken, refreshToken) &&
            const DeepCollectionEquality()
                .equals(other.deviceCode, deviceCode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(refreshToken),
      const DeepCollectionEquality().hash(deviceCode));

  @JsonKey(ignore: true)
  @override
  _$RefreshRequestCopyWith<_RefreshRequest> get copyWith =>
      __$RefreshRequestCopyWithImpl<_RefreshRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RefreshRequestToJson(this);
  }
}

abstract class _RefreshRequest implements RefreshRequest {
  factory _RefreshRequest(
      {required String refreshToken,
      required String deviceCode}) = _$_RefreshRequest;

  factory _RefreshRequest.fromJson(Map<String, dynamic> json) =
      _$_RefreshRequest.fromJson;

  @override
  String get refreshToken;
  @override
  String get deviceCode;
  @override
  @JsonKey(ignore: true)
  _$RefreshRequestCopyWith<_RefreshRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
