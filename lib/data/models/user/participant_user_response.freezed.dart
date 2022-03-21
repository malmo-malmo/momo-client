// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'participant_user_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ParticipantUserResponse _$ParticipantUserResponseFromJson(
    Map<String, dynamic> json) {
  return _ParticipantUserResponse.fromJson(json);
}

/// @nodoc
class _$ParticipantUserResponseTearOff {
  const _$ParticipantUserResponseTearOff();

  _ParticipantUserResponse call(
      {required int userId,
      required int participantId,
      required String nickname,
      String? imageUrl,
      required int attendanceRate}) {
    return _ParticipantUserResponse(
      userId: userId,
      participantId: participantId,
      nickname: nickname,
      imageUrl: imageUrl,
      attendanceRate: attendanceRate,
    );
  }

  ParticipantUserResponse fromJson(Map<String, Object?> json) {
    return ParticipantUserResponse.fromJson(json);
  }
}

/// @nodoc
const $ParticipantUserResponse = _$ParticipantUserResponseTearOff();

/// @nodoc
mixin _$ParticipantUserResponse {
  int get userId => throw _privateConstructorUsedError;
  int get participantId => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  int get attendanceRate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ParticipantUserResponseCopyWith<ParticipantUserResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParticipantUserResponseCopyWith<$Res> {
  factory $ParticipantUserResponseCopyWith(ParticipantUserResponse value,
          $Res Function(ParticipantUserResponse) then) =
      _$ParticipantUserResponseCopyWithImpl<$Res>;
  $Res call(
      {int userId,
      int participantId,
      String nickname,
      String? imageUrl,
      int attendanceRate});
}

/// @nodoc
class _$ParticipantUserResponseCopyWithImpl<$Res>
    implements $ParticipantUserResponseCopyWith<$Res> {
  _$ParticipantUserResponseCopyWithImpl(this._value, this._then);

  final ParticipantUserResponse _value;
  // ignore: unused_field
  final $Res Function(ParticipantUserResponse) _then;

  @override
  $Res call({
    Object? userId = freezed,
    Object? participantId = freezed,
    Object? nickname = freezed,
    Object? imageUrl = freezed,
    Object? attendanceRate = freezed,
  }) {
    return _then(_value.copyWith(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      participantId: participantId == freezed
          ? _value.participantId
          : participantId // ignore: cast_nullable_to_non_nullable
              as int,
      nickname: nickname == freezed
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      attendanceRate: attendanceRate == freezed
          ? _value.attendanceRate
          : attendanceRate // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$ParticipantUserResponseCopyWith<$Res>
    implements $ParticipantUserResponseCopyWith<$Res> {
  factory _$ParticipantUserResponseCopyWith(_ParticipantUserResponse value,
          $Res Function(_ParticipantUserResponse) then) =
      __$ParticipantUserResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {int userId,
      int participantId,
      String nickname,
      String? imageUrl,
      int attendanceRate});
}

/// @nodoc
class __$ParticipantUserResponseCopyWithImpl<$Res>
    extends _$ParticipantUserResponseCopyWithImpl<$Res>
    implements _$ParticipantUserResponseCopyWith<$Res> {
  __$ParticipantUserResponseCopyWithImpl(_ParticipantUserResponse _value,
      $Res Function(_ParticipantUserResponse) _then)
      : super(_value, (v) => _then(v as _ParticipantUserResponse));

  @override
  _ParticipantUserResponse get _value =>
      super._value as _ParticipantUserResponse;

  @override
  $Res call({
    Object? userId = freezed,
    Object? participantId = freezed,
    Object? nickname = freezed,
    Object? imageUrl = freezed,
    Object? attendanceRate = freezed,
  }) {
    return _then(_ParticipantUserResponse(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      participantId: participantId == freezed
          ? _value.participantId
          : participantId // ignore: cast_nullable_to_non_nullable
              as int,
      nickname: nickname == freezed
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      attendanceRate: attendanceRate == freezed
          ? _value.attendanceRate
          : attendanceRate // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ParticipantUserResponse implements _ParticipantUserResponse {
  _$_ParticipantUserResponse(
      {required this.userId,
      required this.participantId,
      required this.nickname,
      this.imageUrl,
      required this.attendanceRate});

  factory _$_ParticipantUserResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ParticipantUserResponseFromJson(json);

  @override
  final int userId;
  @override
  final int participantId;
  @override
  final String nickname;
  @override
  final String? imageUrl;
  @override
  final int attendanceRate;

  @override
  String toString() {
    return 'ParticipantUserResponse(userId: $userId, participantId: $participantId, nickname: $nickname, imageUrl: $imageUrl, attendanceRate: $attendanceRate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ParticipantUserResponse &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality()
                .equals(other.participantId, participantId) &&
            const DeepCollectionEquality().equals(other.nickname, nickname) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl) &&
            const DeepCollectionEquality()
                .equals(other.attendanceRate, attendanceRate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(participantId),
      const DeepCollectionEquality().hash(nickname),
      const DeepCollectionEquality().hash(imageUrl),
      const DeepCollectionEquality().hash(attendanceRate));

  @JsonKey(ignore: true)
  @override
  _$ParticipantUserResponseCopyWith<_ParticipantUserResponse> get copyWith =>
      __$ParticipantUserResponseCopyWithImpl<_ParticipantUserResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ParticipantUserResponseToJson(this);
  }
}

abstract class _ParticipantUserResponse implements ParticipantUserResponse {
  factory _ParticipantUserResponse(
      {required int userId,
      required int participantId,
      required String nickname,
      String? imageUrl,
      required int attendanceRate}) = _$_ParticipantUserResponse;

  factory _ParticipantUserResponse.fromJson(Map<String, dynamic> json) =
      _$_ParticipantUserResponse.fromJson;

  @override
  int get userId;
  @override
  int get participantId;
  @override
  String get nickname;
  @override
  String? get imageUrl;
  @override
  int get attendanceRate;
  @override
  @JsonKey(ignore: true)
  _$ParticipantUserResponseCopyWith<_ParticipantUserResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
