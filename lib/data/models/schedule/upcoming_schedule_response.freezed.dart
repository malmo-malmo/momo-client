// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'upcoming_schedule_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UpcomingScheduleResponse _$UpcomingScheduleResponseFromJson(
    Map<String, dynamic> json) {
  return _UpcomingScheduleResponse.fromJson(json);
}

/// @nodoc
class _$UpcomingScheduleResponseTearOff {
  const _$UpcomingScheduleResponseTearOff();

  _UpcomingScheduleResponse call({String? title, String? startDateTime}) {
    return _UpcomingScheduleResponse(
      title: title,
      startDateTime: startDateTime,
    );
  }

  UpcomingScheduleResponse fromJson(Map<String, Object?> json) {
    return UpcomingScheduleResponse.fromJson(json);
  }
}

/// @nodoc
const $UpcomingScheduleResponse = _$UpcomingScheduleResponseTearOff();

/// @nodoc
mixin _$UpcomingScheduleResponse {
  String? get title => throw _privateConstructorUsedError;
  String? get startDateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpcomingScheduleResponseCopyWith<UpcomingScheduleResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpcomingScheduleResponseCopyWith<$Res> {
  factory $UpcomingScheduleResponseCopyWith(UpcomingScheduleResponse value,
          $Res Function(UpcomingScheduleResponse) then) =
      _$UpcomingScheduleResponseCopyWithImpl<$Res>;
  $Res call({String? title, String? startDateTime});
}

/// @nodoc
class _$UpcomingScheduleResponseCopyWithImpl<$Res>
    implements $UpcomingScheduleResponseCopyWith<$Res> {
  _$UpcomingScheduleResponseCopyWithImpl(this._value, this._then);

  final UpcomingScheduleResponse _value;
  // ignore: unused_field
  final $Res Function(UpcomingScheduleResponse) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? startDateTime = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      startDateTime: startDateTime == freezed
          ? _value.startDateTime
          : startDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$UpcomingScheduleResponseCopyWith<$Res>
    implements $UpcomingScheduleResponseCopyWith<$Res> {
  factory _$UpcomingScheduleResponseCopyWith(_UpcomingScheduleResponse value,
          $Res Function(_UpcomingScheduleResponse) then) =
      __$UpcomingScheduleResponseCopyWithImpl<$Res>;
  @override
  $Res call({String? title, String? startDateTime});
}

/// @nodoc
class __$UpcomingScheduleResponseCopyWithImpl<$Res>
    extends _$UpcomingScheduleResponseCopyWithImpl<$Res>
    implements _$UpcomingScheduleResponseCopyWith<$Res> {
  __$UpcomingScheduleResponseCopyWithImpl(_UpcomingScheduleResponse _value,
      $Res Function(_UpcomingScheduleResponse) _then)
      : super(_value, (v) => _then(v as _UpcomingScheduleResponse));

  @override
  _UpcomingScheduleResponse get _value =>
      super._value as _UpcomingScheduleResponse;

  @override
  $Res call({
    Object? title = freezed,
    Object? startDateTime = freezed,
  }) {
    return _then(_UpcomingScheduleResponse(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      startDateTime: startDateTime == freezed
          ? _value.startDateTime
          : startDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UpcomingScheduleResponse implements _UpcomingScheduleResponse {
  _$_UpcomingScheduleResponse({this.title, this.startDateTime});

  factory _$_UpcomingScheduleResponse.fromJson(Map<String, dynamic> json) =>
      _$$_UpcomingScheduleResponseFromJson(json);

  @override
  final String? title;
  @override
  final String? startDateTime;

  @override
  String toString() {
    return 'UpcomingScheduleResponse(title: $title, startDateTime: $startDateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpcomingScheduleResponse &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.startDateTime, startDateTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(startDateTime));

  @JsonKey(ignore: true)
  @override
  _$UpcomingScheduleResponseCopyWith<_UpcomingScheduleResponse> get copyWith =>
      __$UpcomingScheduleResponseCopyWithImpl<_UpcomingScheduleResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UpcomingScheduleResponseToJson(this);
  }
}

abstract class _UpcomingScheduleResponse implements UpcomingScheduleResponse {
  factory _UpcomingScheduleResponse({String? title, String? startDateTime}) =
      _$_UpcomingScheduleResponse;

  factory _UpcomingScheduleResponse.fromJson(Map<String, dynamic> json) =
      _$_UpcomingScheduleResponse.fromJson;

  @override
  String? get title;
  @override
  String? get startDateTime;
  @override
  @JsonKey(ignore: true)
  _$UpcomingScheduleResponseCopyWith<_UpcomingScheduleResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
