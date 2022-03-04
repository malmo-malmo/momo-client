// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'token_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TokenData _$TokenDataFromJson(Map<String, dynamic> json) {
  return _TokenData.fromJson(json);
}

/// @nodoc
class _$TokenDataTearOff {
  const _$TokenDataTearOff();

  _TokenData call(
      {@HiveField(0) required String accessToken,
      @HiveField(1) required String refreshToken,
      @HiveField(2) required String accessTokenType}) {
    return _TokenData(
      accessToken: accessToken,
      refreshToken: refreshToken,
      accessTokenType: accessTokenType,
    );
  }

  TokenData fromJson(Map<String, Object?> json) {
    return TokenData.fromJson(json);
  }
}

/// @nodoc
const $TokenData = _$TokenDataTearOff();

/// @nodoc
mixin _$TokenData {
  @HiveField(0)
  String get accessToken => throw _privateConstructorUsedError;
  @HiveField(1)
  String get refreshToken => throw _privateConstructorUsedError;
  @HiveField(2)
  String get accessTokenType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TokenDataCopyWith<TokenData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenDataCopyWith<$Res> {
  factory $TokenDataCopyWith(TokenData value, $Res Function(TokenData) then) =
      _$TokenDataCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String accessToken,
      @HiveField(1) String refreshToken,
      @HiveField(2) String accessTokenType});
}

/// @nodoc
class _$TokenDataCopyWithImpl<$Res> implements $TokenDataCopyWith<$Res> {
  _$TokenDataCopyWithImpl(this._value, this._then);

  final TokenData _value;
  // ignore: unused_field
  final $Res Function(TokenData) _then;

  @override
  $Res call({
    Object? accessToken = freezed,
    Object? refreshToken = freezed,
    Object? accessTokenType = freezed,
  }) {
    return _then(_value.copyWith(
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      accessTokenType: accessTokenType == freezed
          ? _value.accessTokenType
          : accessTokenType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$TokenDataCopyWith<$Res> implements $TokenDataCopyWith<$Res> {
  factory _$TokenDataCopyWith(
          _TokenData value, $Res Function(_TokenData) then) =
      __$TokenDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String accessToken,
      @HiveField(1) String refreshToken,
      @HiveField(2) String accessTokenType});
}

/// @nodoc
class __$TokenDataCopyWithImpl<$Res> extends _$TokenDataCopyWithImpl<$Res>
    implements _$TokenDataCopyWith<$Res> {
  __$TokenDataCopyWithImpl(_TokenData _value, $Res Function(_TokenData) _then)
      : super(_value, (v) => _then(v as _TokenData));

  @override
  _TokenData get _value => super._value as _TokenData;

  @override
  $Res call({
    Object? accessToken = freezed,
    Object? refreshToken = freezed,
    Object? accessTokenType = freezed,
  }) {
    return _then(_TokenData(
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      accessTokenType: accessTokenType == freezed
          ? _value.accessTokenType
          : accessTokenType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 1, adapterName: 'TokenDataAdapter')
class _$_TokenData implements _TokenData {
  _$_TokenData(
      {@HiveField(0) required this.accessToken,
      @HiveField(1) required this.refreshToken,
      @HiveField(2) required this.accessTokenType});

  factory _$_TokenData.fromJson(Map<String, dynamic> json) =>
      _$$_TokenDataFromJson(json);

  @override
  @HiveField(0)
  final String accessToken;
  @override
  @HiveField(1)
  final String refreshToken;
  @override
  @HiveField(2)
  final String accessTokenType;

  @override
  String toString() {
    return 'TokenData(accessToken: $accessToken, refreshToken: $refreshToken, accessTokenType: $accessTokenType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TokenData &&
            const DeepCollectionEquality()
                .equals(other.accessToken, accessToken) &&
            const DeepCollectionEquality()
                .equals(other.refreshToken, refreshToken) &&
            const DeepCollectionEquality()
                .equals(other.accessTokenType, accessTokenType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(accessToken),
      const DeepCollectionEquality().hash(refreshToken),
      const DeepCollectionEquality().hash(accessTokenType));

  @JsonKey(ignore: true)
  @override
  _$TokenDataCopyWith<_TokenData> get copyWith =>
      __$TokenDataCopyWithImpl<_TokenData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TokenDataToJson(this);
  }
}

abstract class _TokenData implements TokenData {
  factory _TokenData(
      {@HiveField(0) required String accessToken,
      @HiveField(1) required String refreshToken,
      @HiveField(2) required String accessTokenType}) = _$_TokenData;

  factory _TokenData.fromJson(Map<String, dynamic> json) =
      _$_TokenData.fromJson;

  @override
  @HiveField(0)
  String get accessToken;
  @override
  @HiveField(1)
  String get refreshToken;
  @override
  @HiveField(2)
  String get accessTokenType;
  @override
  @JsonKey(ignore: true)
  _$TokenDataCopyWith<_TokenData> get copyWith =>
      throw _privateConstructorUsedError;
}
