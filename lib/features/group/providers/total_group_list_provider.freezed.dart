// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'total_group_list_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TotalGroupListStateTearOff {
  const _$TotalGroupListStateTearOff();

  _TotalGroupListState call(
      {required bool isLoading,
      required List<ParticipationGroupResponse> groups,
      dynamic error}) {
    return _TotalGroupListState(
      isLoading: isLoading,
      groups: groups,
      error: error,
    );
  }
}

/// @nodoc
const $TotalGroupListState = _$TotalGroupListStateTearOff();

/// @nodoc
mixin _$TotalGroupListState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<ParticipationGroupResponse> get groups =>
      throw _privateConstructorUsedError;
  dynamic get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TotalGroupListStateCopyWith<TotalGroupListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TotalGroupListStateCopyWith<$Res> {
  factory $TotalGroupListStateCopyWith(
          TotalGroupListState value, $Res Function(TotalGroupListState) then) =
      _$TotalGroupListStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading, List<ParticipationGroupResponse> groups, dynamic error});
}

/// @nodoc
class _$TotalGroupListStateCopyWithImpl<$Res>
    implements $TotalGroupListStateCopyWith<$Res> {
  _$TotalGroupListStateCopyWithImpl(this._value, this._then);

  final TotalGroupListState _value;
  // ignore: unused_field
  final $Res Function(TotalGroupListState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? groups = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      groups: groups == freezed
          ? _value.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<ParticipationGroupResponse>,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$TotalGroupListStateCopyWith<$Res>
    implements $TotalGroupListStateCopyWith<$Res> {
  factory _$TotalGroupListStateCopyWith(_TotalGroupListState value,
          $Res Function(_TotalGroupListState) then) =
      __$TotalGroupListStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading, List<ParticipationGroupResponse> groups, dynamic error});
}

/// @nodoc
class __$TotalGroupListStateCopyWithImpl<$Res>
    extends _$TotalGroupListStateCopyWithImpl<$Res>
    implements _$TotalGroupListStateCopyWith<$Res> {
  __$TotalGroupListStateCopyWithImpl(
      _TotalGroupListState _value, $Res Function(_TotalGroupListState) _then)
      : super(_value, (v) => _then(v as _TotalGroupListState));

  @override
  _TotalGroupListState get _value => super._value as _TotalGroupListState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? groups = freezed,
    Object? error = freezed,
  }) {
    return _then(_TotalGroupListState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      groups: groups == freezed
          ? _value.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<ParticipationGroupResponse>,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$_TotalGroupListState implements _TotalGroupListState {
  _$_TotalGroupListState(
      {required this.isLoading, required this.groups, this.error});

  @override
  final bool isLoading;
  @override
  final List<ParticipationGroupResponse> groups;
  @override
  final dynamic error;

  @override
  String toString() {
    return 'TotalGroupListState(isLoading: $isLoading, groups: $groups, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TotalGroupListState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.groups, groups) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(groups),
      const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$TotalGroupListStateCopyWith<_TotalGroupListState> get copyWith =>
      __$TotalGroupListStateCopyWithImpl<_TotalGroupListState>(
          this, _$identity);
}

abstract class _TotalGroupListState implements TotalGroupListState {
  factory _TotalGroupListState(
      {required bool isLoading,
      required List<ParticipationGroupResponse> groups,
      dynamic error}) = _$_TotalGroupListState;

  @override
  bool get isLoading;
  @override
  List<ParticipationGroupResponse> get groups;
  @override
  dynamic get error;
  @override
  @JsonKey(ignore: true)
  _$TotalGroupListStateCopyWith<_TotalGroupListState> get copyWith =>
      throw _privateConstructorUsedError;
}
