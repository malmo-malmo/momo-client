// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'upcoming_schedule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UpcomingSchedule _$UpcomingScheduleFromJson(Map<String, dynamic> json) {
  return _UpcomingSchedule.fromJson(json);
}

/// @nodoc
class _$UpcomingScheduleTearOff {
  const _$UpcomingScheduleTearOff();

  _UpcomingSchedule call({String? title, String? startDateTime}) {
    return _UpcomingSchedule(
      title: title,
      startDateTime: startDateTime,
    );
  }

  UpcomingSchedule fromJson(Map<String, Object?> json) {
    return UpcomingSchedule.fromJson(json);
  }
}

/// @nodoc
const $UpcomingSchedule = _$UpcomingScheduleTearOff();

/// @nodoc
mixin _$UpcomingSchedule {
  String? get title => throw _privateConstructorUsedError;
  String? get startDateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpcomingScheduleCopyWith<UpcomingSchedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpcomingScheduleCopyWith<$Res> {
  factory $UpcomingScheduleCopyWith(
          UpcomingSchedule value, $Res Function(UpcomingSchedule) then) =
      _$UpcomingScheduleCopyWithImpl<$Res>;
  $Res call({String? title, String? startDateTime});
}

/// @nodoc
class _$UpcomingScheduleCopyWithImpl<$Res>
    implements $UpcomingScheduleCopyWith<$Res> {
  _$UpcomingScheduleCopyWithImpl(this._value, this._then);

  final UpcomingSchedule _value;
  // ignore: unused_field
  final $Res Function(UpcomingSchedule) _then;

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
abstract class _$UpcomingScheduleCopyWith<$Res>
    implements $UpcomingScheduleCopyWith<$Res> {
  factory _$UpcomingScheduleCopyWith(
          _UpcomingSchedule value, $Res Function(_UpcomingSchedule) then) =
      __$UpcomingScheduleCopyWithImpl<$Res>;
  @override
  $Res call({String? title, String? startDateTime});
}

/// @nodoc
class __$UpcomingScheduleCopyWithImpl<$Res>
    extends _$UpcomingScheduleCopyWithImpl<$Res>
    implements _$UpcomingScheduleCopyWith<$Res> {
  __$UpcomingScheduleCopyWithImpl(
      _UpcomingSchedule _value, $Res Function(_UpcomingSchedule) _then)
      : super(_value, (v) => _then(v as _UpcomingSchedule));

  @override
  _UpcomingSchedule get _value => super._value as _UpcomingSchedule;

  @override
  $Res call({
    Object? title = freezed,
    Object? startDateTime = freezed,
  }) {
    return _then(_UpcomingSchedule(
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
class _$_UpcomingSchedule implements _UpcomingSchedule {
  _$_UpcomingSchedule({this.title, this.startDateTime});

  factory _$_UpcomingSchedule.fromJson(Map<String, dynamic> json) =>
      _$$_UpcomingScheduleFromJson(json);

  @override
  final String? title;
  @override
  final String? startDateTime;

  @override
  String toString() {
    return 'UpcomingSchedule(title: $title, startDateTime: $startDateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpcomingSchedule &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.startDateTime, startDateTime) ||
                other.startDateTime == startDateTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, startDateTime);

  @JsonKey(ignore: true)
  @override
  _$UpcomingScheduleCopyWith<_UpcomingSchedule> get copyWith =>
      __$UpcomingScheduleCopyWithImpl<_UpcomingSchedule>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UpcomingScheduleToJson(this);
  }
}

abstract class _UpcomingSchedule implements UpcomingSchedule {
  factory _UpcomingSchedule({String? title, String? startDateTime}) =
      _$_UpcomingSchedule;

  factory _UpcomingSchedule.fromJson(Map<String, dynamic> json) =
      _$_UpcomingSchedule.fromJson;

  @override
  String? get title;
  @override
  String? get startDateTime;
  @override
  @JsonKey(ignore: true)
  _$UpcomingScheduleCopyWith<_UpcomingSchedule> get copyWith =>
      throw _privateConstructorUsedError;
}
