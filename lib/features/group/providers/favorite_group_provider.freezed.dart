// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'favorite_group_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FavoriteGroupListStateTearOff {
  const _$FavoriteGroupListStateTearOff();

  _FavoriteGroupListState call(
      {required List<GroupResponse> favoriteGroups,
      dynamic error,
      required bool isLoading}) {
    return _FavoriteGroupListState(
      favoriteGroups: favoriteGroups,
      error: error,
      isLoading: isLoading,
    );
  }
}

/// @nodoc
const $FavoriteGroupListState = _$FavoriteGroupListStateTearOff();

/// @nodoc
mixin _$FavoriteGroupListState {
  List<GroupResponse> get favoriteGroups => throw _privateConstructorUsedError;
  dynamic get error => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavoriteGroupListStateCopyWith<FavoriteGroupListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteGroupListStateCopyWith<$Res> {
  factory $FavoriteGroupListStateCopyWith(FavoriteGroupListState value,
          $Res Function(FavoriteGroupListState) then) =
      _$FavoriteGroupListStateCopyWithImpl<$Res>;
  $Res call(
      {List<GroupResponse> favoriteGroups, dynamic error, bool isLoading});
}

/// @nodoc
class _$FavoriteGroupListStateCopyWithImpl<$Res>
    implements $FavoriteGroupListStateCopyWith<$Res> {
  _$FavoriteGroupListStateCopyWithImpl(this._value, this._then);

  final FavoriteGroupListState _value;
  // ignore: unused_field
  final $Res Function(FavoriteGroupListState) _then;

  @override
  $Res call({
    Object? favoriteGroups = freezed,
    Object? error = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      favoriteGroups: favoriteGroups == freezed
          ? _value.favoriteGroups
          : favoriteGroups // ignore: cast_nullable_to_non_nullable
              as List<GroupResponse>,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$FavoriteGroupListStateCopyWith<$Res>
    implements $FavoriteGroupListStateCopyWith<$Res> {
  factory _$FavoriteGroupListStateCopyWith(_FavoriteGroupListState value,
          $Res Function(_FavoriteGroupListState) then) =
      __$FavoriteGroupListStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<GroupResponse> favoriteGroups, dynamic error, bool isLoading});
}

/// @nodoc
class __$FavoriteGroupListStateCopyWithImpl<$Res>
    extends _$FavoriteGroupListStateCopyWithImpl<$Res>
    implements _$FavoriteGroupListStateCopyWith<$Res> {
  __$FavoriteGroupListStateCopyWithImpl(_FavoriteGroupListState _value,
      $Res Function(_FavoriteGroupListState) _then)
      : super(_value, (v) => _then(v as _FavoriteGroupListState));

  @override
  _FavoriteGroupListState get _value => super._value as _FavoriteGroupListState;

  @override
  $Res call({
    Object? favoriteGroups = freezed,
    Object? error = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_FavoriteGroupListState(
      favoriteGroups: favoriteGroups == freezed
          ? _value.favoriteGroups
          : favoriteGroups // ignore: cast_nullable_to_non_nullable
              as List<GroupResponse>,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_FavoriteGroupListState implements _FavoriteGroupListState {
  _$_FavoriteGroupListState(
      {required this.favoriteGroups, this.error, required this.isLoading});

  @override
  final List<GroupResponse> favoriteGroups;
  @override
  final dynamic error;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'FavoriteGroupListState(favoriteGroups: $favoriteGroups, error: $error, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FavoriteGroupListState &&
            const DeepCollectionEquality()
                .equals(other.favoriteGroups, favoriteGroups) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(favoriteGroups),
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(isLoading));

  @JsonKey(ignore: true)
  @override
  _$FavoriteGroupListStateCopyWith<_FavoriteGroupListState> get copyWith =>
      __$FavoriteGroupListStateCopyWithImpl<_FavoriteGroupListState>(
          this, _$identity);
}

abstract class _FavoriteGroupListState implements FavoriteGroupListState {
  factory _FavoriteGroupListState(
      {required List<GroupResponse> favoriteGroups,
      dynamic error,
      required bool isLoading}) = _$_FavoriteGroupListState;

  @override
  List<GroupResponse> get favoriteGroups;
  @override
  dynamic get error;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$FavoriteGroupListStateCopyWith<_FavoriteGroupListState> get copyWith =>
      throw _privateConstructorUsedError;
}
