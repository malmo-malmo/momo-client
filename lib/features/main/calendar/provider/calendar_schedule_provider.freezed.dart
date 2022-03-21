// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'calendar_schedule_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CalendarScheduleStateTearOff {
  const _$CalendarScheduleStateTearOff();

  _CalendarScheduleState call(
      {required bool isLoading,
      required DateTime selectedDate,
      required DateTime requestDate,
      required List<DateTime> scheduleDateTimes,
      required List<List<ScheduleSummaryResponse>> schedules}) {
    return _CalendarScheduleState(
      isLoading: isLoading,
      selectedDate: selectedDate,
      requestDate: requestDate,
      scheduleDateTimes: scheduleDateTimes,
      schedules: schedules,
    );
  }
}

/// @nodoc
const $CalendarScheduleState = _$CalendarScheduleStateTearOff();

/// @nodoc
mixin _$CalendarScheduleState {
  bool get isLoading => throw _privateConstructorUsedError;
  DateTime get selectedDate => throw _privateConstructorUsedError;
  DateTime get requestDate => throw _privateConstructorUsedError;
  List<DateTime> get scheduleDateTimes => throw _privateConstructorUsedError;
  List<List<ScheduleSummaryResponse>> get schedules =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CalendarScheduleStateCopyWith<CalendarScheduleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarScheduleStateCopyWith<$Res> {
  factory $CalendarScheduleStateCopyWith(CalendarScheduleState value,
          $Res Function(CalendarScheduleState) then) =
      _$CalendarScheduleStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      DateTime selectedDate,
      DateTime requestDate,
      List<DateTime> scheduleDateTimes,
      List<List<ScheduleSummaryResponse>> schedules});
}

/// @nodoc
class _$CalendarScheduleStateCopyWithImpl<$Res>
    implements $CalendarScheduleStateCopyWith<$Res> {
  _$CalendarScheduleStateCopyWithImpl(this._value, this._then);

  final CalendarScheduleState _value;
  // ignore: unused_field
  final $Res Function(CalendarScheduleState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? selectedDate = freezed,
    Object? requestDate = freezed,
    Object? scheduleDateTimes = freezed,
    Object? schedules = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedDate: selectedDate == freezed
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      requestDate: requestDate == freezed
          ? _value.requestDate
          : requestDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      scheduleDateTimes: scheduleDateTimes == freezed
          ? _value.scheduleDateTimes
          : scheduleDateTimes // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      schedules: schedules == freezed
          ? _value.schedules
          : schedules // ignore: cast_nullable_to_non_nullable
              as List<List<ScheduleSummaryResponse>>,
    ));
  }
}

/// @nodoc
abstract class _$CalendarScheduleStateCopyWith<$Res>
    implements $CalendarScheduleStateCopyWith<$Res> {
  factory _$CalendarScheduleStateCopyWith(_CalendarScheduleState value,
          $Res Function(_CalendarScheduleState) then) =
      __$CalendarScheduleStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      DateTime selectedDate,
      DateTime requestDate,
      List<DateTime> scheduleDateTimes,
      List<List<ScheduleSummaryResponse>> schedules});
}

/// @nodoc
class __$CalendarScheduleStateCopyWithImpl<$Res>
    extends _$CalendarScheduleStateCopyWithImpl<$Res>
    implements _$CalendarScheduleStateCopyWith<$Res> {
  __$CalendarScheduleStateCopyWithImpl(_CalendarScheduleState _value,
      $Res Function(_CalendarScheduleState) _then)
      : super(_value, (v) => _then(v as _CalendarScheduleState));

  @override
  _CalendarScheduleState get _value => super._value as _CalendarScheduleState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? selectedDate = freezed,
    Object? requestDate = freezed,
    Object? scheduleDateTimes = freezed,
    Object? schedules = freezed,
  }) {
    return _then(_CalendarScheduleState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedDate: selectedDate == freezed
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      requestDate: requestDate == freezed
          ? _value.requestDate
          : requestDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      scheduleDateTimes: scheduleDateTimes == freezed
          ? _value.scheduleDateTimes
          : scheduleDateTimes // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      schedules: schedules == freezed
          ? _value.schedules
          : schedules // ignore: cast_nullable_to_non_nullable
              as List<List<ScheduleSummaryResponse>>,
    ));
  }
}

/// @nodoc

class _$_CalendarScheduleState implements _CalendarScheduleState {
  _$_CalendarScheduleState(
      {required this.isLoading,
      required this.selectedDate,
      required this.requestDate,
      required this.scheduleDateTimes,
      required this.schedules});

  @override
  final bool isLoading;
  @override
  final DateTime selectedDate;
  @override
  final DateTime requestDate;
  @override
  final List<DateTime> scheduleDateTimes;
  @override
  final List<List<ScheduleSummaryResponse>> schedules;

  @override
  String toString() {
    return 'CalendarScheduleState(isLoading: $isLoading, selectedDate: $selectedDate, requestDate: $requestDate, scheduleDateTimes: $scheduleDateTimes, schedules: $schedules)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CalendarScheduleState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.selectedDate, selectedDate) &&
            const DeepCollectionEquality()
                .equals(other.requestDate, requestDate) &&
            const DeepCollectionEquality()
                .equals(other.scheduleDateTimes, scheduleDateTimes) &&
            const DeepCollectionEquality().equals(other.schedules, schedules));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(selectedDate),
      const DeepCollectionEquality().hash(requestDate),
      const DeepCollectionEquality().hash(scheduleDateTimes),
      const DeepCollectionEquality().hash(schedules));

  @JsonKey(ignore: true)
  @override
  _$CalendarScheduleStateCopyWith<_CalendarScheduleState> get copyWith =>
      __$CalendarScheduleStateCopyWithImpl<_CalendarScheduleState>(
          this, _$identity);
}

abstract class _CalendarScheduleState implements CalendarScheduleState {
  factory _CalendarScheduleState(
          {required bool isLoading,
          required DateTime selectedDate,
          required DateTime requestDate,
          required List<DateTime> scheduleDateTimes,
          required List<List<ScheduleSummaryResponse>> schedules}) =
      _$_CalendarScheduleState;

  @override
  bool get isLoading;
  @override
  DateTime get selectedDate;
  @override
  DateTime get requestDate;
  @override
  List<DateTime> get scheduleDateTimes;
  @override
  List<List<ScheduleSummaryResponse>> get schedules;
  @override
  @JsonKey(ignore: true)
  _$CalendarScheduleStateCopyWith<_CalendarScheduleState> get copyWith =>
      throw _privateConstructorUsedError;
}
