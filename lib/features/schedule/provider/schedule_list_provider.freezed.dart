// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'schedule_list_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ScheduleListStateTearOff {
  const _$ScheduleListStateTearOff();

  _ScheduleListState call(
      {required List<ScheduleDetailResponse> schedules,
      required int manageId,
      int? nextPage,
      dynamic error}) {
    return _ScheduleListState(
      schedules: schedules,
      manageId: manageId,
      nextPage: nextPage,
      error: error,
    );
  }
}

/// @nodoc
const $ScheduleListState = _$ScheduleListStateTearOff();

/// @nodoc
mixin _$ScheduleListState {
  List<ScheduleDetailResponse> get schedules =>
      throw _privateConstructorUsedError;
  int get manageId => throw _privateConstructorUsedError;
  int? get nextPage => throw _privateConstructorUsedError;
  dynamic get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScheduleListStateCopyWith<ScheduleListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleListStateCopyWith<$Res> {
  factory $ScheduleListStateCopyWith(
          ScheduleListState value, $Res Function(ScheduleListState) then) =
      _$ScheduleListStateCopyWithImpl<$Res>;
  $Res call(
      {List<ScheduleDetailResponse> schedules,
      int manageId,
      int? nextPage,
      dynamic error});
}

/// @nodoc
class _$ScheduleListStateCopyWithImpl<$Res>
    implements $ScheduleListStateCopyWith<$Res> {
  _$ScheduleListStateCopyWithImpl(this._value, this._then);

  final ScheduleListState _value;
  // ignore: unused_field
  final $Res Function(ScheduleListState) _then;

  @override
  $Res call({
    Object? schedules = freezed,
    Object? manageId = freezed,
    Object? nextPage = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      schedules: schedules == freezed
          ? _value.schedules
          : schedules // ignore: cast_nullable_to_non_nullable
              as List<ScheduleDetailResponse>,
      manageId: manageId == freezed
          ? _value.manageId
          : manageId // ignore: cast_nullable_to_non_nullable
              as int,
      nextPage: nextPage == freezed
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as int?,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$ScheduleListStateCopyWith<$Res>
    implements $ScheduleListStateCopyWith<$Res> {
  factory _$ScheduleListStateCopyWith(
          _ScheduleListState value, $Res Function(_ScheduleListState) then) =
      __$ScheduleListStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<ScheduleDetailResponse> schedules,
      int manageId,
      int? nextPage,
      dynamic error});
}

/// @nodoc
class __$ScheduleListStateCopyWithImpl<$Res>
    extends _$ScheduleListStateCopyWithImpl<$Res>
    implements _$ScheduleListStateCopyWith<$Res> {
  __$ScheduleListStateCopyWithImpl(
      _ScheduleListState _value, $Res Function(_ScheduleListState) _then)
      : super(_value, (v) => _then(v as _ScheduleListState));

  @override
  _ScheduleListState get _value => super._value as _ScheduleListState;

  @override
  $Res call({
    Object? schedules = freezed,
    Object? manageId = freezed,
    Object? nextPage = freezed,
    Object? error = freezed,
  }) {
    return _then(_ScheduleListState(
      schedules: schedules == freezed
          ? _value.schedules
          : schedules // ignore: cast_nullable_to_non_nullable
              as List<ScheduleDetailResponse>,
      manageId: manageId == freezed
          ? _value.manageId
          : manageId // ignore: cast_nullable_to_non_nullable
              as int,
      nextPage: nextPage == freezed
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as int?,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$_ScheduleListState implements _ScheduleListState {
  _$_ScheduleListState(
      {required this.schedules,
      required this.manageId,
      this.nextPage,
      this.error});

  @override
  final List<ScheduleDetailResponse> schedules;
  @override
  final int manageId;
  @override
  final int? nextPage;
  @override
  final dynamic error;

  @override
  String toString() {
    return 'ScheduleListState(schedules: $schedules, manageId: $manageId, nextPage: $nextPage, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ScheduleListState &&
            const DeepCollectionEquality().equals(other.schedules, schedules) &&
            const DeepCollectionEquality().equals(other.manageId, manageId) &&
            const DeepCollectionEquality().equals(other.nextPage, nextPage) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(schedules),
      const DeepCollectionEquality().hash(manageId),
      const DeepCollectionEquality().hash(nextPage),
      const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$ScheduleListStateCopyWith<_ScheduleListState> get copyWith =>
      __$ScheduleListStateCopyWithImpl<_ScheduleListState>(this, _$identity);
}

abstract class _ScheduleListState implements ScheduleListState {
  factory _ScheduleListState(
      {required List<ScheduleDetailResponse> schedules,
      required int manageId,
      int? nextPage,
      dynamic error}) = _$_ScheduleListState;

  @override
  List<ScheduleDetailResponse> get schedules;
  @override
  int get manageId;
  @override
  int? get nextPage;
  @override
  dynamic get error;
  @override
  @JsonKey(ignore: true)
  _$ScheduleListStateCopyWith<_ScheduleListState> get copyWith =>
      throw _privateConstructorUsedError;
}
