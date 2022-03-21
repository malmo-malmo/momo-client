// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mypage_count_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$GroupAndBadgeStateTearOff {
  const _$GroupAndBadgeStateTearOff();

  _GroupAndBadgeState call(
      {required bool isLoading,
      required int totalGroupCount,
      required int favoriteGroupCount,
      required int badgeCount}) {
    return _GroupAndBadgeState(
      isLoading: isLoading,
      totalGroupCount: totalGroupCount,
      favoriteGroupCount: favoriteGroupCount,
      badgeCount: badgeCount,
    );
  }
}

/// @nodoc
const $GroupAndBadgeState = _$GroupAndBadgeStateTearOff();

/// @nodoc
mixin _$GroupAndBadgeState {
  bool get isLoading => throw _privateConstructorUsedError;
  int get totalGroupCount => throw _privateConstructorUsedError;
  int get favoriteGroupCount => throw _privateConstructorUsedError;
  int get badgeCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GroupAndBadgeStateCopyWith<GroupAndBadgeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupAndBadgeStateCopyWith<$Res> {
  factory $GroupAndBadgeStateCopyWith(
          GroupAndBadgeState value, $Res Function(GroupAndBadgeState) then) =
      _$GroupAndBadgeStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      int totalGroupCount,
      int favoriteGroupCount,
      int badgeCount});
}

/// @nodoc
class _$GroupAndBadgeStateCopyWithImpl<$Res>
    implements $GroupAndBadgeStateCopyWith<$Res> {
  _$GroupAndBadgeStateCopyWithImpl(this._value, this._then);

  final GroupAndBadgeState _value;
  // ignore: unused_field
  final $Res Function(GroupAndBadgeState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? totalGroupCount = freezed,
    Object? favoriteGroupCount = freezed,
    Object? badgeCount = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      totalGroupCount: totalGroupCount == freezed
          ? _value.totalGroupCount
          : totalGroupCount // ignore: cast_nullable_to_non_nullable
              as int,
      favoriteGroupCount: favoriteGroupCount == freezed
          ? _value.favoriteGroupCount
          : favoriteGroupCount // ignore: cast_nullable_to_non_nullable
              as int,
      badgeCount: badgeCount == freezed
          ? _value.badgeCount
          : badgeCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$GroupAndBadgeStateCopyWith<$Res>
    implements $GroupAndBadgeStateCopyWith<$Res> {
  factory _$GroupAndBadgeStateCopyWith(
          _GroupAndBadgeState value, $Res Function(_GroupAndBadgeState) then) =
      __$GroupAndBadgeStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      int totalGroupCount,
      int favoriteGroupCount,
      int badgeCount});
}

/// @nodoc
class __$GroupAndBadgeStateCopyWithImpl<$Res>
    extends _$GroupAndBadgeStateCopyWithImpl<$Res>
    implements _$GroupAndBadgeStateCopyWith<$Res> {
  __$GroupAndBadgeStateCopyWithImpl(
      _GroupAndBadgeState _value, $Res Function(_GroupAndBadgeState) _then)
      : super(_value, (v) => _then(v as _GroupAndBadgeState));

  @override
  _GroupAndBadgeState get _value => super._value as _GroupAndBadgeState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? totalGroupCount = freezed,
    Object? favoriteGroupCount = freezed,
    Object? badgeCount = freezed,
  }) {
    return _then(_GroupAndBadgeState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      totalGroupCount: totalGroupCount == freezed
          ? _value.totalGroupCount
          : totalGroupCount // ignore: cast_nullable_to_non_nullable
              as int,
      favoriteGroupCount: favoriteGroupCount == freezed
          ? _value.favoriteGroupCount
          : favoriteGroupCount // ignore: cast_nullable_to_non_nullable
              as int,
      badgeCount: badgeCount == freezed
          ? _value.badgeCount
          : badgeCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_GroupAndBadgeState implements _GroupAndBadgeState {
  _$_GroupAndBadgeState(
      {required this.isLoading,
      required this.totalGroupCount,
      required this.favoriteGroupCount,
      required this.badgeCount});

  @override
  final bool isLoading;
  @override
  final int totalGroupCount;
  @override
  final int favoriteGroupCount;
  @override
  final int badgeCount;

  @override
  String toString() {
    return 'GroupAndBadgeState(isLoading: $isLoading, totalGroupCount: $totalGroupCount, favoriteGroupCount: $favoriteGroupCount, badgeCount: $badgeCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GroupAndBadgeState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.totalGroupCount, totalGroupCount) &&
            const DeepCollectionEquality()
                .equals(other.favoriteGroupCount, favoriteGroupCount) &&
            const DeepCollectionEquality()
                .equals(other.badgeCount, badgeCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(totalGroupCount),
      const DeepCollectionEquality().hash(favoriteGroupCount),
      const DeepCollectionEquality().hash(badgeCount));

  @JsonKey(ignore: true)
  @override
  _$GroupAndBadgeStateCopyWith<_GroupAndBadgeState> get copyWith =>
      __$GroupAndBadgeStateCopyWithImpl<_GroupAndBadgeState>(this, _$identity);
}

abstract class _GroupAndBadgeState implements GroupAndBadgeState {
  factory _GroupAndBadgeState(
      {required bool isLoading,
      required int totalGroupCount,
      required int favoriteGroupCount,
      required int badgeCount}) = _$_GroupAndBadgeState;

  @override
  bool get isLoading;
  @override
  int get totalGroupCount;
  @override
  int get favoriteGroupCount;
  @override
  int get badgeCount;
  @override
  @JsonKey(ignore: true)
  _$GroupAndBadgeStateCopyWith<_GroupAndBadgeState> get copyWith =>
      throw _privateConstructorUsedError;
}
