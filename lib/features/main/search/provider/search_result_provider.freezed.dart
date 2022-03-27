// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'search_result_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SearchResultStateTearOff {
  const _$SearchResultStateTearOff();

  _SearchResultState call(
      {required List<GroupResponse> groups, int? nextPage, dynamic error}) {
    return _SearchResultState(
      groups: groups,
      nextPage: nextPage,
      error: error,
    );
  }
}

/// @nodoc
const $SearchResultState = _$SearchResultStateTearOff();

/// @nodoc
mixin _$SearchResultState {
  List<GroupResponse> get groups => throw _privateConstructorUsedError;
  int? get nextPage => throw _privateConstructorUsedError;
  dynamic get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchResultStateCopyWith<SearchResultState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchResultStateCopyWith<$Res> {
  factory $SearchResultStateCopyWith(
          SearchResultState value, $Res Function(SearchResultState) then) =
      _$SearchResultStateCopyWithImpl<$Res>;
  $Res call({List<GroupResponse> groups, int? nextPage, dynamic error});
}

/// @nodoc
class _$SearchResultStateCopyWithImpl<$Res>
    implements $SearchResultStateCopyWith<$Res> {
  _$SearchResultStateCopyWithImpl(this._value, this._then);

  final SearchResultState _value;
  // ignore: unused_field
  final $Res Function(SearchResultState) _then;

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
abstract class _$SearchResultStateCopyWith<$Res>
    implements $SearchResultStateCopyWith<$Res> {
  factory _$SearchResultStateCopyWith(
          _SearchResultState value, $Res Function(_SearchResultState) then) =
      __$SearchResultStateCopyWithImpl<$Res>;
  @override
  $Res call({List<GroupResponse> groups, int? nextPage, dynamic error});
}

/// @nodoc
class __$SearchResultStateCopyWithImpl<$Res>
    extends _$SearchResultStateCopyWithImpl<$Res>
    implements _$SearchResultStateCopyWith<$Res> {
  __$SearchResultStateCopyWithImpl(
      _SearchResultState _value, $Res Function(_SearchResultState) _then)
      : super(_value, (v) => _then(v as _SearchResultState));

  @override
  _SearchResultState get _value => super._value as _SearchResultState;

  @override
  $Res call({
    Object? groups = freezed,
    Object? nextPage = freezed,
    Object? error = freezed,
  }) {
    return _then(_SearchResultState(
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

class _$_SearchResultState implements _SearchResultState {
  _$_SearchResultState({required this.groups, this.nextPage, this.error});

  @override
  final List<GroupResponse> groups;
  @override
  final int? nextPage;
  @override
  final dynamic error;

  @override
  String toString() {
    return 'SearchResultState(groups: $groups, nextPage: $nextPage, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchResultState &&
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
  _$SearchResultStateCopyWith<_SearchResultState> get copyWith =>
      __$SearchResultStateCopyWithImpl<_SearchResultState>(this, _$identity);
}

abstract class _SearchResultState implements SearchResultState {
  factory _SearchResultState(
      {required List<GroupResponse> groups,
      int? nextPage,
      dynamic error}) = _$_SearchResultState;

  @override
  List<GroupResponse> get groups;
  @override
  int? get nextPage;
  @override
  dynamic get error;
  @override
  @JsonKey(ignore: true)
  _$SearchResultStateCopyWith<_SearchResultState> get copyWith =>
      throw _privateConstructorUsedError;
}
