// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'attendance_list_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AttendanceResponseStateTearOff {
  const _$AttendanceResponseStateTearOff();

  _AttendanceResponseState call(
      {required int scheduleId,
      required List<AttendanceResponse> attendances,
      required bool isLoading}) {
    return _AttendanceResponseState(
      scheduleId: scheduleId,
      attendances: attendances,
      isLoading: isLoading,
    );
  }
}

/// @nodoc
const $AttendanceResponseState = _$AttendanceResponseStateTearOff();

/// @nodoc
mixin _$AttendanceResponseState {
  int get scheduleId => throw _privateConstructorUsedError;
  List<AttendanceResponse> get attendances =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AttendanceResponseStateCopyWith<AttendanceResponseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceResponseStateCopyWith<$Res> {
  factory $AttendanceResponseStateCopyWith(AttendanceResponseState value,
          $Res Function(AttendanceResponseState) then) =
      _$AttendanceResponseStateCopyWithImpl<$Res>;
  $Res call(
      {int scheduleId, List<AttendanceResponse> attendances, bool isLoading});
}

/// @nodoc
class _$AttendanceResponseStateCopyWithImpl<$Res>
    implements $AttendanceResponseStateCopyWith<$Res> {
  _$AttendanceResponseStateCopyWithImpl(this._value, this._then);

  final AttendanceResponseState _value;
  // ignore: unused_field
  final $Res Function(AttendanceResponseState) _then;

  @override
  $Res call({
    Object? scheduleId = freezed,
    Object? attendances = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      scheduleId: scheduleId == freezed
          ? _value.scheduleId
          : scheduleId // ignore: cast_nullable_to_non_nullable
              as int,
      attendances: attendances == freezed
          ? _value.attendances
          : attendances // ignore: cast_nullable_to_non_nullable
              as List<AttendanceResponse>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$AttendanceResponseStateCopyWith<$Res>
    implements $AttendanceResponseStateCopyWith<$Res> {
  factory _$AttendanceResponseStateCopyWith(_AttendanceResponseState value,
          $Res Function(_AttendanceResponseState) then) =
      __$AttendanceResponseStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {int scheduleId, List<AttendanceResponse> attendances, bool isLoading});
}

/// @nodoc
class __$AttendanceResponseStateCopyWithImpl<$Res>
    extends _$AttendanceResponseStateCopyWithImpl<$Res>
    implements _$AttendanceResponseStateCopyWith<$Res> {
  __$AttendanceResponseStateCopyWithImpl(_AttendanceResponseState _value,
      $Res Function(_AttendanceResponseState) _then)
      : super(_value, (v) => _then(v as _AttendanceResponseState));

  @override
  _AttendanceResponseState get _value =>
      super._value as _AttendanceResponseState;

  @override
  $Res call({
    Object? scheduleId = freezed,
    Object? attendances = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_AttendanceResponseState(
      scheduleId: scheduleId == freezed
          ? _value.scheduleId
          : scheduleId // ignore: cast_nullable_to_non_nullable
              as int,
      attendances: attendances == freezed
          ? _value.attendances
          : attendances // ignore: cast_nullable_to_non_nullable
              as List<AttendanceResponse>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AttendanceResponseState implements _AttendanceResponseState {
  _$_AttendanceResponseState(
      {required this.scheduleId,
      required this.attendances,
      required this.isLoading});

  @override
  final int scheduleId;
  @override
  final List<AttendanceResponse> attendances;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'AttendanceResponseState(scheduleId: $scheduleId, attendances: $attendances, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AttendanceResponseState &&
            const DeepCollectionEquality()
                .equals(other.scheduleId, scheduleId) &&
            const DeepCollectionEquality()
                .equals(other.attendances, attendances) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(scheduleId),
      const DeepCollectionEquality().hash(attendances),
      const DeepCollectionEquality().hash(isLoading));

  @JsonKey(ignore: true)
  @override
  _$AttendanceResponseStateCopyWith<_AttendanceResponseState> get copyWith =>
      __$AttendanceResponseStateCopyWithImpl<_AttendanceResponseState>(
          this, _$identity);
}

abstract class _AttendanceResponseState implements AttendanceResponseState {
  factory _AttendanceResponseState(
      {required int scheduleId,
      required List<AttendanceResponse> attendances,
      required bool isLoading}) = _$_AttendanceResponseState;

  @override
  int get scheduleId;
  @override
  List<AttendanceResponse> get attendances;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$AttendanceResponseStateCopyWith<_AttendanceResponseState> get copyWith =>
      throw _privateConstructorUsedError;
}
