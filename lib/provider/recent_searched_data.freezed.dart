// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'recent_searched_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RecentSearchedDataStateTearOff {
  const _$RecentSearchedDataStateTearOff();

  _RecentSearchDataState call(
      {required List<String> words,
      required List<int> groupIds,
      required List<GroupResponse> groups,
      required bool isLoading}) {
    return _RecentSearchDataState(
      words: words,
      groupIds: groupIds,
      groups: groups,
      isLoading: isLoading,
    );
  }
}

/// @nodoc
const $RecentSearchedDataState = _$RecentSearchedDataStateTearOff();

/// @nodoc
mixin _$RecentSearchedDataState {
  List<String> get words => throw _privateConstructorUsedError;
  List<int> get groupIds => throw _privateConstructorUsedError;
  List<GroupResponse> get groups => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecentSearchedDataStateCopyWith<RecentSearchedDataState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentSearchedDataStateCopyWith<$Res> {
  factory $RecentSearchedDataStateCopyWith(RecentSearchedDataState value,
          $Res Function(RecentSearchedDataState) then) =
      _$RecentSearchedDataStateCopyWithImpl<$Res>;
  $Res call(
      {List<String> words,
      List<int> groupIds,
      List<GroupResponse> groups,
      bool isLoading});
}

/// @nodoc
class _$RecentSearchedDataStateCopyWithImpl<$Res>
    implements $RecentSearchedDataStateCopyWith<$Res> {
  _$RecentSearchedDataStateCopyWithImpl(this._value, this._then);

  final RecentSearchedDataState _value;
  // ignore: unused_field
  final $Res Function(RecentSearchedDataState) _then;

  @override
  $Res call({
    Object? words = freezed,
    Object? groupIds = freezed,
    Object? groups = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      words: words == freezed
          ? _value.words
          : words // ignore: cast_nullable_to_non_nullable
              as List<String>,
      groupIds: groupIds == freezed
          ? _value.groupIds
          : groupIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      groups: groups == freezed
          ? _value.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<GroupResponse>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$RecentSearchDataStateCopyWith<$Res>
    implements $RecentSearchedDataStateCopyWith<$Res> {
  factory _$RecentSearchDataStateCopyWith(_RecentSearchDataState value,
          $Res Function(_RecentSearchDataState) then) =
      __$RecentSearchDataStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<String> words,
      List<int> groupIds,
      List<GroupResponse> groups,
      bool isLoading});
}

/// @nodoc
class __$RecentSearchDataStateCopyWithImpl<$Res>
    extends _$RecentSearchedDataStateCopyWithImpl<$Res>
    implements _$RecentSearchDataStateCopyWith<$Res> {
  __$RecentSearchDataStateCopyWithImpl(_RecentSearchDataState _value,
      $Res Function(_RecentSearchDataState) _then)
      : super(_value, (v) => _then(v as _RecentSearchDataState));

  @override
  _RecentSearchDataState get _value => super._value as _RecentSearchDataState;

  @override
  $Res call({
    Object? words = freezed,
    Object? groupIds = freezed,
    Object? groups = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_RecentSearchDataState(
      words: words == freezed
          ? _value.words
          : words // ignore: cast_nullable_to_non_nullable
              as List<String>,
      groupIds: groupIds == freezed
          ? _value.groupIds
          : groupIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      groups: groups == freezed
          ? _value.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<GroupResponse>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_RecentSearchDataState implements _RecentSearchDataState {
  _$_RecentSearchDataState(
      {required this.words,
      required this.groupIds,
      required this.groups,
      required this.isLoading});

  @override
  final List<String> words;
  @override
  final List<int> groupIds;
  @override
  final List<GroupResponse> groups;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'RecentSearchedDataState(words: $words, groupIds: $groupIds, groups: $groups, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RecentSearchDataState &&
            const DeepCollectionEquality().equals(other.words, words) &&
            const DeepCollectionEquality().equals(other.groupIds, groupIds) &&
            const DeepCollectionEquality().equals(other.groups, groups) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(words),
      const DeepCollectionEquality().hash(groupIds),
      const DeepCollectionEquality().hash(groups),
      const DeepCollectionEquality().hash(isLoading));

  @JsonKey(ignore: true)
  @override
  _$RecentSearchDataStateCopyWith<_RecentSearchDataState> get copyWith =>
      __$RecentSearchDataStateCopyWithImpl<_RecentSearchDataState>(
          this, _$identity);
}

abstract class _RecentSearchDataState implements RecentSearchedDataState {
  factory _RecentSearchDataState(
      {required List<String> words,
      required List<int> groupIds,
      required List<GroupResponse> groups,
      required bool isLoading}) = _$_RecentSearchDataState;

  @override
  List<String> get words;
  @override
  List<int> get groupIds;
  @override
  List<GroupResponse> get groups;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$RecentSearchDataStateCopyWith<_RecentSearchDataState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$RecentSearchedDataTearOff {
  const _$RecentSearchedDataTearOff();

  _RecentSearchedData call(
      {@HiveField(0) required List<String> words,
      @HiveField(1) required List<int> groupIds}) {
    return _RecentSearchedData(
      words: words,
      groupIds: groupIds,
    );
  }
}

/// @nodoc
const $RecentSearchedData = _$RecentSearchedDataTearOff();

/// @nodoc
mixin _$RecentSearchedData {
  @HiveField(0)
  List<String> get words => throw _privateConstructorUsedError;
  @HiveField(1)
  List<int> get groupIds => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecentSearchedDataCopyWith<RecentSearchedData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentSearchedDataCopyWith<$Res> {
  factory $RecentSearchedDataCopyWith(
          RecentSearchedData value, $Res Function(RecentSearchedData) then) =
      _$RecentSearchedDataCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) List<String> words, @HiveField(1) List<int> groupIds});
}

/// @nodoc
class _$RecentSearchedDataCopyWithImpl<$Res>
    implements $RecentSearchedDataCopyWith<$Res> {
  _$RecentSearchedDataCopyWithImpl(this._value, this._then);

  final RecentSearchedData _value;
  // ignore: unused_field
  final $Res Function(RecentSearchedData) _then;

  @override
  $Res call({
    Object? words = freezed,
    Object? groupIds = freezed,
  }) {
    return _then(_value.copyWith(
      words: words == freezed
          ? _value.words
          : words // ignore: cast_nullable_to_non_nullable
              as List<String>,
      groupIds: groupIds == freezed
          ? _value.groupIds
          : groupIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
abstract class _$RecentSearchedDataCopyWith<$Res>
    implements $RecentSearchedDataCopyWith<$Res> {
  factory _$RecentSearchedDataCopyWith(
          _RecentSearchedData value, $Res Function(_RecentSearchedData) then) =
      __$RecentSearchedDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) List<String> words, @HiveField(1) List<int> groupIds});
}

/// @nodoc
class __$RecentSearchedDataCopyWithImpl<$Res>
    extends _$RecentSearchedDataCopyWithImpl<$Res>
    implements _$RecentSearchedDataCopyWith<$Res> {
  __$RecentSearchedDataCopyWithImpl(
      _RecentSearchedData _value, $Res Function(_RecentSearchedData) _then)
      : super(_value, (v) => _then(v as _RecentSearchedData));

  @override
  _RecentSearchedData get _value => super._value as _RecentSearchedData;

  @override
  $Res call({
    Object? words = freezed,
    Object? groupIds = freezed,
  }) {
    return _then(_RecentSearchedData(
      words: words == freezed
          ? _value.words
          : words // ignore: cast_nullable_to_non_nullable
              as List<String>,
      groupIds: groupIds == freezed
          ? _value.groupIds
          : groupIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 2, adapterName: 'RecentSearchedDataAdapter')
class _$_RecentSearchedData implements _RecentSearchedData {
  _$_RecentSearchedData(
      {@HiveField(0) required this.words,
      @HiveField(1) required this.groupIds});

  @override
  @HiveField(0)
  final List<String> words;
  @override
  @HiveField(1)
  final List<int> groupIds;

  @override
  String toString() {
    return 'RecentSearchedData(words: $words, groupIds: $groupIds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RecentSearchedData &&
            const DeepCollectionEquality().equals(other.words, words) &&
            const DeepCollectionEquality().equals(other.groupIds, groupIds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(words),
      const DeepCollectionEquality().hash(groupIds));

  @JsonKey(ignore: true)
  @override
  _$RecentSearchedDataCopyWith<_RecentSearchedData> get copyWith =>
      __$RecentSearchedDataCopyWithImpl<_RecentSearchedData>(this, _$identity);
}

abstract class _RecentSearchedData implements RecentSearchedData {
  factory _RecentSearchedData(
      {@HiveField(0) required List<String> words,
      @HiveField(1) required List<int> groupIds}) = _$_RecentSearchedData;

  @override
  @HiveField(0)
  List<String> get words;
  @override
  @HiveField(1)
  List<int> get groupIds;
  @override
  @JsonKey(ignore: true)
  _$RecentSearchedDataCopyWith<_RecentSearchedData> get copyWith =>
      throw _privateConstructorUsedError;
}
