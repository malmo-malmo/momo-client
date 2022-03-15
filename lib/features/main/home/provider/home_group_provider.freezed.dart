// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_group_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HomeGroupStateTearOff {
  const _$HomeGroupStateTearOff();

  _HomeGroupState call(
      {required bool isLoading,
      required List<GroupResponse> categoryGroups,
      required List<GroupResponse> districtGroups,
      required List<GroupResponse> universityGroups}) {
    return _HomeGroupState(
      isLoading: isLoading,
      categoryGroups: categoryGroups,
      districtGroups: districtGroups,
      universityGroups: universityGroups,
    );
  }
}

/// @nodoc
const $HomeGroupState = _$HomeGroupStateTearOff();

/// @nodoc
mixin _$HomeGroupState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<GroupResponse> get categoryGroups => throw _privateConstructorUsedError;
  List<GroupResponse> get districtGroups => throw _privateConstructorUsedError;
  List<GroupResponse> get universityGroups =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeGroupStateCopyWith<HomeGroupState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeGroupStateCopyWith<$Res> {
  factory $HomeGroupStateCopyWith(
          HomeGroupState value, $Res Function(HomeGroupState) then) =
      _$HomeGroupStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      List<GroupResponse> categoryGroups,
      List<GroupResponse> districtGroups,
      List<GroupResponse> universityGroups});
}

/// @nodoc
class _$HomeGroupStateCopyWithImpl<$Res>
    implements $HomeGroupStateCopyWith<$Res> {
  _$HomeGroupStateCopyWithImpl(this._value, this._then);

  final HomeGroupState _value;
  // ignore: unused_field
  final $Res Function(HomeGroupState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? categoryGroups = freezed,
    Object? districtGroups = freezed,
    Object? universityGroups = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      categoryGroups: categoryGroups == freezed
          ? _value.categoryGroups
          : categoryGroups // ignore: cast_nullable_to_non_nullable
              as List<GroupResponse>,
      districtGroups: districtGroups == freezed
          ? _value.districtGroups
          : districtGroups // ignore: cast_nullable_to_non_nullable
              as List<GroupResponse>,
      universityGroups: universityGroups == freezed
          ? _value.universityGroups
          : universityGroups // ignore: cast_nullable_to_non_nullable
              as List<GroupResponse>,
    ));
  }
}

/// @nodoc
abstract class _$HomeGroupStateCopyWith<$Res>
    implements $HomeGroupStateCopyWith<$Res> {
  factory _$HomeGroupStateCopyWith(
          _HomeGroupState value, $Res Function(_HomeGroupState) then) =
      __$HomeGroupStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      List<GroupResponse> categoryGroups,
      List<GroupResponse> districtGroups,
      List<GroupResponse> universityGroups});
}

/// @nodoc
class __$HomeGroupStateCopyWithImpl<$Res>
    extends _$HomeGroupStateCopyWithImpl<$Res>
    implements _$HomeGroupStateCopyWith<$Res> {
  __$HomeGroupStateCopyWithImpl(
      _HomeGroupState _value, $Res Function(_HomeGroupState) _then)
      : super(_value, (v) => _then(v as _HomeGroupState));

  @override
  _HomeGroupState get _value => super._value as _HomeGroupState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? categoryGroups = freezed,
    Object? districtGroups = freezed,
    Object? universityGroups = freezed,
  }) {
    return _then(_HomeGroupState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      categoryGroups: categoryGroups == freezed
          ? _value.categoryGroups
          : categoryGroups // ignore: cast_nullable_to_non_nullable
              as List<GroupResponse>,
      districtGroups: districtGroups == freezed
          ? _value.districtGroups
          : districtGroups // ignore: cast_nullable_to_non_nullable
              as List<GroupResponse>,
      universityGroups: universityGroups == freezed
          ? _value.universityGroups
          : universityGroups // ignore: cast_nullable_to_non_nullable
              as List<GroupResponse>,
    ));
  }
}

/// @nodoc

class _$_HomeGroupState implements _HomeGroupState {
  _$_HomeGroupState(
      {required this.isLoading,
      required this.categoryGroups,
      required this.districtGroups,
      required this.universityGroups});

  @override
  final bool isLoading;
  @override
  final List<GroupResponse> categoryGroups;
  @override
  final List<GroupResponse> districtGroups;
  @override
  final List<GroupResponse> universityGroups;

  @override
  String toString() {
    return 'HomeGroupState(isLoading: $isLoading, categoryGroups: $categoryGroups, districtGroups: $districtGroups, universityGroups: $universityGroups)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeGroupState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.categoryGroups, categoryGroups) &&
            const DeepCollectionEquality()
                .equals(other.districtGroups, districtGroups) &&
            const DeepCollectionEquality()
                .equals(other.universityGroups, universityGroups));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(categoryGroups),
      const DeepCollectionEquality().hash(districtGroups),
      const DeepCollectionEquality().hash(universityGroups));

  @JsonKey(ignore: true)
  @override
  _$HomeGroupStateCopyWith<_HomeGroupState> get copyWith =>
      __$HomeGroupStateCopyWithImpl<_HomeGroupState>(this, _$identity);
}

abstract class _HomeGroupState implements HomeGroupState {
  factory _HomeGroupState(
      {required bool isLoading,
      required List<GroupResponse> categoryGroups,
      required List<GroupResponse> districtGroups,
      required List<GroupResponse> universityGroups}) = _$_HomeGroupState;

  @override
  bool get isLoading;
  @override
  List<GroupResponse> get categoryGroups;
  @override
  List<GroupResponse> get districtGroups;
  @override
  List<GroupResponse> get universityGroups;
  @override
  @JsonKey(ignore: true)
  _$HomeGroupStateCopyWith<_HomeGroupState> get copyWith =>
      throw _privateConstructorUsedError;
}
