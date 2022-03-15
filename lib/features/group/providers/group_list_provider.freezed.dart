// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'group_list_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$GroupListStateTearOff {
  const _$GroupListStateTearOff();

  _GroupListState call(
      {required List<GroupResponse> groups, int? nextPage, dynamic error}) {
    return _GroupListState(
      groups: groups,
      nextPage: nextPage,
      error: error,
    );
  }
}

/// @nodoc
const $GroupListState = _$GroupListStateTearOff();

/// @nodoc
mixin _$GroupListState {
  List<GroupResponse> get groups => throw _privateConstructorUsedError;
  int? get nextPage => throw _privateConstructorUsedError;
  dynamic get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GroupListStateCopyWith<GroupListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupListStateCopyWith<$Res> {
  factory $GroupListStateCopyWith(
          GroupListState value, $Res Function(GroupListState) then) =
      _$GroupListStateCopyWithImpl<$Res>;
  $Res call({List<GroupResponse> groups, int? nextPage, dynamic error});
}

/// @nodoc
class _$GroupListStateCopyWithImpl<$Res>
    implements $GroupListStateCopyWith<$Res> {
  _$GroupListStateCopyWithImpl(this._value, this._then);

  final GroupListState _value;
  // ignore: unused_field
  final $Res Function(GroupListState) _then;

  @override
  $Res call({
    Object? groups = freezed,
    Object? nextPage = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      groups: groups == freezed
          ? _value.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<GroupResponse>,
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
abstract class _$GroupListStateCopyWith<$Res>
    implements $GroupListStateCopyWith<$Res> {
  factory _$GroupListStateCopyWith(
          _GroupListState value, $Res Function(_GroupListState) then) =
      __$GroupListStateCopyWithImpl<$Res>;
  @override
  $Res call({List<GroupResponse> groups, int? nextPage, dynamic error});
}

/// @nodoc
class __$GroupListStateCopyWithImpl<$Res>
    extends _$GroupListStateCopyWithImpl<$Res>
    implements _$GroupListStateCopyWith<$Res> {
  __$GroupListStateCopyWithImpl(
      _GroupListState _value, $Res Function(_GroupListState) _then)
      : super(_value, (v) => _then(v as _GroupListState));

  @override
  _GroupListState get _value => super._value as _GroupListState;

  @override
  $Res call({
    Object? groups = freezed,
    Object? nextPage = freezed,
    Object? error = freezed,
  }) {
    return _then(_GroupListState(
      groups: groups == freezed
          ? _value.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<GroupResponse>,
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

class _$_GroupListState implements _GroupListState {
  _$_GroupListState({required this.groups, this.nextPage, this.error});

  @override
  final List<GroupResponse> groups;
  @override
  final int? nextPage;
  @override
  final dynamic error;

  @override
  String toString() {
    return 'GroupListState(groups: $groups, nextPage: $nextPage, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GroupListState &&
            const DeepCollectionEquality().equals(other.groups, groups) &&
            const DeepCollectionEquality().equals(other.nextPage, nextPage) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(groups),
      const DeepCollectionEquality().hash(nextPage),
      const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$GroupListStateCopyWith<_GroupListState> get copyWith =>
      __$GroupListStateCopyWithImpl<_GroupListState>(this, _$identity);
}

abstract class _GroupListState implements GroupListState {
  factory _GroupListState(
      {required List<GroupResponse> groups,
      int? nextPage,
      dynamic error}) = _$_GroupListState;

  @override
  List<GroupResponse> get groups;
  @override
  int? get nextPage;
  @override
  dynamic get error;
  @override
  @JsonKey(ignore: true)
  _$GroupListStateCopyWith<_GroupListState> get copyWith =>
      throw _privateConstructorUsedError;
}
