// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'manage_post_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ManagePostStateTearOff {
  const _$ManagePostStateTearOff();

  _ManagePostState call(
      {required List<ManagementPostResponse> managePosts,
      int? nextPage,
      dynamic error}) {
    return _ManagePostState(
      managePosts: managePosts,
      nextPage: nextPage,
      error: error,
    );
  }
}

/// @nodoc
const $ManagePostState = _$ManagePostStateTearOff();

/// @nodoc
mixin _$ManagePostState {
  List<ManagementPostResponse> get managePosts =>
      throw _privateConstructorUsedError;
  int? get nextPage => throw _privateConstructorUsedError;
  dynamic get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ManagePostStateCopyWith<ManagePostState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManagePostStateCopyWith<$Res> {
  factory $ManagePostStateCopyWith(
          ManagePostState value, $Res Function(ManagePostState) then) =
      _$ManagePostStateCopyWithImpl<$Res>;
  $Res call(
      {List<ManagementPostResponse> managePosts, int? nextPage, dynamic error});
}

/// @nodoc
class _$ManagePostStateCopyWithImpl<$Res>
    implements $ManagePostStateCopyWith<$Res> {
  _$ManagePostStateCopyWithImpl(this._value, this._then);

  final ManagePostState _value;
  // ignore: unused_field
  final $Res Function(ManagePostState) _then;

  @override
  $Res call({
    Object? managePosts = freezed,
    Object? nextPage = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      managePosts: managePosts == freezed
          ? _value.managePosts
          : managePosts // ignore: cast_nullable_to_non_nullable
              as List<ManagementPostResponse>,
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
abstract class _$ManagePostStateCopyWith<$Res>
    implements $ManagePostStateCopyWith<$Res> {
  factory _$ManagePostStateCopyWith(
          _ManagePostState value, $Res Function(_ManagePostState) then) =
      __$ManagePostStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<ManagementPostResponse> managePosts, int? nextPage, dynamic error});
}

/// @nodoc
class __$ManagePostStateCopyWithImpl<$Res>
    extends _$ManagePostStateCopyWithImpl<$Res>
    implements _$ManagePostStateCopyWith<$Res> {
  __$ManagePostStateCopyWithImpl(
      _ManagePostState _value, $Res Function(_ManagePostState) _then)
      : super(_value, (v) => _then(v as _ManagePostState));

  @override
  _ManagePostState get _value => super._value as _ManagePostState;

  @override
  $Res call({
    Object? managePosts = freezed,
    Object? nextPage = freezed,
    Object? error = freezed,
  }) {
    return _then(_ManagePostState(
      managePosts: managePosts == freezed
          ? _value.managePosts
          : managePosts // ignore: cast_nullable_to_non_nullable
              as List<ManagementPostResponse>,
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

class _$_ManagePostState implements _ManagePostState {
  _$_ManagePostState({required this.managePosts, this.nextPage, this.error});

  @override
  final List<ManagementPostResponse> managePosts;
  @override
  final int? nextPage;
  @override
  final dynamic error;

  @override
  String toString() {
    return 'ManagePostState(managePosts: $managePosts, nextPage: $nextPage, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ManagePostState &&
            const DeepCollectionEquality()
                .equals(other.managePosts, managePosts) &&
            const DeepCollectionEquality().equals(other.nextPage, nextPage) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(managePosts),
      const DeepCollectionEquality().hash(nextPage),
      const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$ManagePostStateCopyWith<_ManagePostState> get copyWith =>
      __$ManagePostStateCopyWithImpl<_ManagePostState>(this, _$identity);
}

abstract class _ManagePostState implements ManagePostState {
  factory _ManagePostState(
      {required List<ManagementPostResponse> managePosts,
      int? nextPage,
      dynamic error}) = _$_ManagePostState;

  @override
  List<ManagementPostResponse> get managePosts;
  @override
  int? get nextPage;
  @override
  dynamic get error;
  @override
  @JsonKey(ignore: true)
  _$ManagePostStateCopyWith<_ManagePostState> get copyWith =>
      throw _privateConstructorUsedError;
}
