// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'my_group_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MyGroupStateTearOff {
  const _$MyGroupStateTearOff();

  _MyGroupState call(
      {required List<MyGroupResponse> myGroups,
      required List<GroupSummaryReseponse> etcGroups,
      required bool isLoading}) {
    return _MyGroupState(
      myGroups: myGroups,
      etcGroups: etcGroups,
      isLoading: isLoading,
    );
  }
}

/// @nodoc
const $MyGroupState = _$MyGroupStateTearOff();

/// @nodoc
mixin _$MyGroupState {
  List<MyGroupResponse> get myGroups => throw _privateConstructorUsedError;
  List<GroupSummaryReseponse> get etcGroups =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyGroupStateCopyWith<MyGroupState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyGroupStateCopyWith<$Res> {
  factory $MyGroupStateCopyWith(
          MyGroupState value, $Res Function(MyGroupState) then) =
      _$MyGroupStateCopyWithImpl<$Res>;
  $Res call(
      {List<MyGroupResponse> myGroups,
      List<GroupSummaryReseponse> etcGroups,
      bool isLoading});
}

/// @nodoc
class _$MyGroupStateCopyWithImpl<$Res> implements $MyGroupStateCopyWith<$Res> {
  _$MyGroupStateCopyWithImpl(this._value, this._then);

  final MyGroupState _value;
  // ignore: unused_field
  final $Res Function(MyGroupState) _then;

  @override
  $Res call({
    Object? myGroups = freezed,
    Object? etcGroups = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      myGroups: myGroups == freezed
          ? _value.myGroups
          : myGroups // ignore: cast_nullable_to_non_nullable
              as List<MyGroupResponse>,
      etcGroups: etcGroups == freezed
          ? _value.etcGroups
          : etcGroups // ignore: cast_nullable_to_non_nullable
              as List<GroupSummaryReseponse>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$MyGroupStateCopyWith<$Res>
    implements $MyGroupStateCopyWith<$Res> {
  factory _$MyGroupStateCopyWith(
          _MyGroupState value, $Res Function(_MyGroupState) then) =
      __$MyGroupStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<MyGroupResponse> myGroups,
      List<GroupSummaryReseponse> etcGroups,
      bool isLoading});
}

/// @nodoc
class __$MyGroupStateCopyWithImpl<$Res> extends _$MyGroupStateCopyWithImpl<$Res>
    implements _$MyGroupStateCopyWith<$Res> {
  __$MyGroupStateCopyWithImpl(
      _MyGroupState _value, $Res Function(_MyGroupState) _then)
      : super(_value, (v) => _then(v as _MyGroupState));

  @override
  _MyGroupState get _value => super._value as _MyGroupState;

  @override
  $Res call({
    Object? myGroups = freezed,
    Object? etcGroups = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_MyGroupState(
      myGroups: myGroups == freezed
          ? _value.myGroups
          : myGroups // ignore: cast_nullable_to_non_nullable
              as List<MyGroupResponse>,
      etcGroups: etcGroups == freezed
          ? _value.etcGroups
          : etcGroups // ignore: cast_nullable_to_non_nullable
              as List<GroupSummaryReseponse>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_MyGroupState implements _MyGroupState {
  _$_MyGroupState(
      {required this.myGroups,
      required this.etcGroups,
      required this.isLoading});

  @override
  final List<MyGroupResponse> myGroups;
  @override
  final List<GroupSummaryReseponse> etcGroups;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'MyGroupState(myGroups: $myGroups, etcGroups: $etcGroups, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MyGroupState &&
            const DeepCollectionEquality().equals(other.myGroups, myGroups) &&
            const DeepCollectionEquality().equals(other.etcGroups, etcGroups) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(myGroups),
      const DeepCollectionEquality().hash(etcGroups),
      const DeepCollectionEquality().hash(isLoading));

  @JsonKey(ignore: true)
  @override
  _$MyGroupStateCopyWith<_MyGroupState> get copyWith =>
      __$MyGroupStateCopyWithImpl<_MyGroupState>(this, _$identity);
}

abstract class _MyGroupState implements MyGroupState {
  factory _MyGroupState(
      {required List<MyGroupResponse> myGroups,
      required List<GroupSummaryReseponse> etcGroups,
      required bool isLoading}) = _$_MyGroupState;

  @override
  List<MyGroupResponse> get myGroups;
  @override
  List<GroupSummaryReseponse> get etcGroups;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$MyGroupStateCopyWith<_MyGroupState> get copyWith =>
      throw _privateConstructorUsedError;
}
