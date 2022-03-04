// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'schedule_detail_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScheduleDetailResponse _$ScheduleDetailResponseFromJson(
    Map<String, dynamic> json) {
  return _ScheduleDetailResponse.fromJson(json);
}

/// @nodoc
class _$ScheduleDetailResponseTearOff {
  const _$ScheduleDetailResponseTearOff();

  _ScheduleDetailResponse call(
      {required int scheduleId,
      required String title,
      required String contents,
      required String authorNickname,
      String? authorImage,
      required String startDateTime,
      required bool offline,
      required bool attend,
      required bool attendanceCheck}) {
    return _ScheduleDetailResponse(
      scheduleId: scheduleId,
      title: title,
      contents: contents,
      authorNickname: authorNickname,
      authorImage: authorImage,
      startDateTime: startDateTime,
      offline: offline,
      attend: attend,
      attendanceCheck: attendanceCheck,
    );
  }

  ScheduleDetailResponse fromJson(Map<String, Object?> json) {
    return ScheduleDetailResponse.fromJson(json);
  }
}

/// @nodoc
const $ScheduleDetailResponse = _$ScheduleDetailResponseTearOff();

/// @nodoc
mixin _$ScheduleDetailResponse {
  int get scheduleId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get contents => throw _privateConstructorUsedError;
  String get authorNickname => throw _privateConstructorUsedError;
  String? get authorImage => throw _privateConstructorUsedError;
  String get startDateTime => throw _privateConstructorUsedError;
  bool get offline => throw _privateConstructorUsedError;
  bool get attend => throw _privateConstructorUsedError;
  bool get attendanceCheck => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScheduleDetailResponseCopyWith<ScheduleDetailResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleDetailResponseCopyWith<$Res> {
  factory $ScheduleDetailResponseCopyWith(ScheduleDetailResponse value,
          $Res Function(ScheduleDetailResponse) then) =
      _$ScheduleDetailResponseCopyWithImpl<$Res>;
  $Res call(
      {int scheduleId,
      String title,
      String contents,
      String authorNickname,
      String? authorImage,
      String startDateTime,
      bool offline,
      bool attend,
      bool attendanceCheck});
}

/// @nodoc
class _$ScheduleDetailResponseCopyWithImpl<$Res>
    implements $ScheduleDetailResponseCopyWith<$Res> {
  _$ScheduleDetailResponseCopyWithImpl(this._value, this._then);

  final ScheduleDetailResponse _value;
  // ignore: unused_field
  final $Res Function(ScheduleDetailResponse) _then;

  @override
  $Res call({
    Object? scheduleId = freezed,
    Object? title = freezed,
    Object? contents = freezed,
    Object? authorNickname = freezed,
    Object? authorImage = freezed,
    Object? startDateTime = freezed,
    Object? offline = freezed,
    Object? attend = freezed,
    Object? attendanceCheck = freezed,
  }) {
    return _then(_value.copyWith(
      scheduleId: scheduleId == freezed
          ? _value.scheduleId
          : scheduleId // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      contents: contents == freezed
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
      authorNickname: authorNickname == freezed
          ? _value.authorNickname
          : authorNickname // ignore: cast_nullable_to_non_nullable
              as String,
      authorImage: authorImage == freezed
          ? _value.authorImage
          : authorImage // ignore: cast_nullable_to_non_nullable
              as String?,
      startDateTime: startDateTime == freezed
          ? _value.startDateTime
          : startDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      offline: offline == freezed
          ? _value.offline
          : offline // ignore: cast_nullable_to_non_nullable
              as bool,
      attend: attend == freezed
          ? _value.attend
          : attend // ignore: cast_nullable_to_non_nullable
              as bool,
      attendanceCheck: attendanceCheck == freezed
          ? _value.attendanceCheck
          : attendanceCheck // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$ScheduleDetailResponseCopyWith<$Res>
    implements $ScheduleDetailResponseCopyWith<$Res> {
  factory _$ScheduleDetailResponseCopyWith(_ScheduleDetailResponse value,
          $Res Function(_ScheduleDetailResponse) then) =
      __$ScheduleDetailResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {int scheduleId,
      String title,
      String contents,
      String authorNickname,
      String? authorImage,
      String startDateTime,
      bool offline,
      bool attend,
      bool attendanceCheck});
}

/// @nodoc
class __$ScheduleDetailResponseCopyWithImpl<$Res>
    extends _$ScheduleDetailResponseCopyWithImpl<$Res>
    implements _$ScheduleDetailResponseCopyWith<$Res> {
  __$ScheduleDetailResponseCopyWithImpl(_ScheduleDetailResponse _value,
      $Res Function(_ScheduleDetailResponse) _then)
      : super(_value, (v) => _then(v as _ScheduleDetailResponse));

  @override
  _ScheduleDetailResponse get _value => super._value as _ScheduleDetailResponse;

  @override
  $Res call({
    Object? scheduleId = freezed,
    Object? title = freezed,
    Object? contents = freezed,
    Object? authorNickname = freezed,
    Object? authorImage = freezed,
    Object? startDateTime = freezed,
    Object? offline = freezed,
    Object? attend = freezed,
    Object? attendanceCheck = freezed,
  }) {
    return _then(_ScheduleDetailResponse(
      scheduleId: scheduleId == freezed
          ? _value.scheduleId
          : scheduleId // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      contents: contents == freezed
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
      authorNickname: authorNickname == freezed
          ? _value.authorNickname
          : authorNickname // ignore: cast_nullable_to_non_nullable
              as String,
      authorImage: authorImage == freezed
          ? _value.authorImage
          : authorImage // ignore: cast_nullable_to_non_nullable
              as String?,
      startDateTime: startDateTime == freezed
          ? _value.startDateTime
          : startDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      offline: offline == freezed
          ? _value.offline
          : offline // ignore: cast_nullable_to_non_nullable
              as bool,
      attend: attend == freezed
          ? _value.attend
          : attend // ignore: cast_nullable_to_non_nullable
              as bool,
      attendanceCheck: attendanceCheck == freezed
          ? _value.attendanceCheck
          : attendanceCheck // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ScheduleDetailResponse implements _ScheduleDetailResponse {
  _$_ScheduleDetailResponse(
      {required this.scheduleId,
      required this.title,
      required this.contents,
      required this.authorNickname,
      this.authorImage,
      required this.startDateTime,
      required this.offline,
      required this.attend,
      required this.attendanceCheck});

  factory _$_ScheduleDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ScheduleDetailResponseFromJson(json);

  @override
  final int scheduleId;
  @override
  final String title;
  @override
  final String contents;
  @override
  final String authorNickname;
  @override
  final String? authorImage;
  @override
  final String startDateTime;
  @override
  final bool offline;
  @override
  final bool attend;
  @override
  final bool attendanceCheck;

  @override
  String toString() {
    return 'ScheduleDetailResponse(scheduleId: $scheduleId, title: $title, contents: $contents, authorNickname: $authorNickname, authorImage: $authorImage, startDateTime: $startDateTime, offline: $offline, attend: $attend, attendanceCheck: $attendanceCheck)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ScheduleDetailResponse &&
            const DeepCollectionEquality()
                .equals(other.scheduleId, scheduleId) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.contents, contents) &&
            const DeepCollectionEquality()
                .equals(other.authorNickname, authorNickname) &&
            const DeepCollectionEquality()
                .equals(other.authorImage, authorImage) &&
            const DeepCollectionEquality()
                .equals(other.startDateTime, startDateTime) &&
            const DeepCollectionEquality().equals(other.offline, offline) &&
            const DeepCollectionEquality().equals(other.attend, attend) &&
            const DeepCollectionEquality()
                .equals(other.attendanceCheck, attendanceCheck));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(scheduleId),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(contents),
      const DeepCollectionEquality().hash(authorNickname),
      const DeepCollectionEquality().hash(authorImage),
      const DeepCollectionEquality().hash(startDateTime),
      const DeepCollectionEquality().hash(offline),
      const DeepCollectionEquality().hash(attend),
      const DeepCollectionEquality().hash(attendanceCheck));

  @JsonKey(ignore: true)
  @override
  _$ScheduleDetailResponseCopyWith<_ScheduleDetailResponse> get copyWith =>
      __$ScheduleDetailResponseCopyWithImpl<_ScheduleDetailResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScheduleDetailResponseToJson(this);
  }
}

abstract class _ScheduleDetailResponse implements ScheduleDetailResponse {
  factory _ScheduleDetailResponse(
      {required int scheduleId,
      required String title,
      required String contents,
      required String authorNickname,
      String? authorImage,
      required String startDateTime,
      required bool offline,
      required bool attend,
      required bool attendanceCheck}) = _$_ScheduleDetailResponse;

  factory _ScheduleDetailResponse.fromJson(Map<String, dynamic> json) =
      _$_ScheduleDetailResponse.fromJson;

  @override
  int get scheduleId;
  @override
  String get title;
  @override
  String get contents;
  @override
  String get authorNickname;
  @override
  String? get authorImage;
  @override
  String get startDateTime;
  @override
  bool get offline;
  @override
  bool get attend;
  @override
  bool get attendanceCheck;
  @override
  @JsonKey(ignore: true)
  _$ScheduleDetailResponseCopyWith<_ScheduleDetailResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
