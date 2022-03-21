// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'group_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GroupResponse _$GroupResponseFromJson(Map<String, dynamic> json) {
  return _GroupResponse.fromJson(json);
}

/// @nodoc
class _$GroupResponseTearOff {
  const _$GroupResponseTearOff();

  _GroupResponse call(
      {required int id,
      required String name,
      required bool offline,
      required int participantCnt,
      required String startDate,
      String? imageUrl,
      required bool favoriteGroup}) {
    return _GroupResponse(
      id: id,
      name: name,
      offline: offline,
      participantCnt: participantCnt,
      startDate: startDate,
      imageUrl: imageUrl,
      favoriteGroup: favoriteGroup,
    );
  }

  GroupResponse fromJson(Map<String, Object?> json) {
    return GroupResponse.fromJson(json);
  }
}

/// @nodoc
const $GroupResponse = _$GroupResponseTearOff();

/// @nodoc
mixin _$GroupResponse {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get offline => throw _privateConstructorUsedError;
  int get participantCnt => throw _privateConstructorUsedError;
  String get startDate => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  bool get favoriteGroup => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GroupResponseCopyWith<GroupResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupResponseCopyWith<$Res> {
  factory $GroupResponseCopyWith(
          GroupResponse value, $Res Function(GroupResponse) then) =
      _$GroupResponseCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String name,
      bool offline,
      int participantCnt,
      String startDate,
      String? imageUrl,
      bool favoriteGroup});
}

/// @nodoc
class _$GroupResponseCopyWithImpl<$Res>
    implements $GroupResponseCopyWith<$Res> {
  _$GroupResponseCopyWithImpl(this._value, this._then);

  final GroupResponse _value;
  // ignore: unused_field
  final $Res Function(GroupResponse) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? offline = freezed,
    Object? participantCnt = freezed,
    Object? startDate = freezed,
    Object? imageUrl = freezed,
    Object? favoriteGroup = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      offline: offline == freezed
          ? _value.offline
          : offline // ignore: cast_nullable_to_non_nullable
              as bool,
      participantCnt: participantCnt == freezed
          ? _value.participantCnt
          : participantCnt // ignore: cast_nullable_to_non_nullable
              as int,
      startDate: startDate == freezed
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      favoriteGroup: favoriteGroup == freezed
          ? _value.favoriteGroup
          : favoriteGroup // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$GroupResponseCopyWith<$Res>
    implements $GroupResponseCopyWith<$Res> {
  factory _$GroupResponseCopyWith(
          _GroupResponse value, $Res Function(_GroupResponse) then) =
      __$GroupResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String name,
      bool offline,
      int participantCnt,
      String startDate,
      String? imageUrl,
      bool favoriteGroup});
}

/// @nodoc
class __$GroupResponseCopyWithImpl<$Res>
    extends _$GroupResponseCopyWithImpl<$Res>
    implements _$GroupResponseCopyWith<$Res> {
  __$GroupResponseCopyWithImpl(
      _GroupResponse _value, $Res Function(_GroupResponse) _then)
      : super(_value, (v) => _then(v as _GroupResponse));

  @override
  _GroupResponse get _value => super._value as _GroupResponse;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? offline = freezed,
    Object? participantCnt = freezed,
    Object? startDate = freezed,
    Object? imageUrl = freezed,
    Object? favoriteGroup = freezed,
  }) {
    return _then(_GroupResponse(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      offline: offline == freezed
          ? _value.offline
          : offline // ignore: cast_nullable_to_non_nullable
              as bool,
      participantCnt: participantCnt == freezed
          ? _value.participantCnt
          : participantCnt // ignore: cast_nullable_to_non_nullable
              as int,
      startDate: startDate == freezed
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      favoriteGroup: favoriteGroup == freezed
          ? _value.favoriteGroup
          : favoriteGroup // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GroupResponse implements _GroupResponse {
  _$_GroupResponse(
      {required this.id,
      required this.name,
      required this.offline,
      required this.participantCnt,
      required this.startDate,
      this.imageUrl,
      required this.favoriteGroup});

  factory _$_GroupResponse.fromJson(Map<String, dynamic> json) =>
      _$$_GroupResponseFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final bool offline;
  @override
  final int participantCnt;
  @override
  final String startDate;
  @override
  final String? imageUrl;
  @override
  final bool favoriteGroup;

  @override
  String toString() {
    return 'GroupResponse(id: $id, name: $name, offline: $offline, participantCnt: $participantCnt, startDate: $startDate, imageUrl: $imageUrl, favoriteGroup: $favoriteGroup)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GroupResponse &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.offline, offline) &&
            const DeepCollectionEquality()
                .equals(other.participantCnt, participantCnt) &&
            const DeepCollectionEquality().equals(other.startDate, startDate) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl) &&
            const DeepCollectionEquality()
                .equals(other.favoriteGroup, favoriteGroup));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(offline),
      const DeepCollectionEquality().hash(participantCnt),
      const DeepCollectionEquality().hash(startDate),
      const DeepCollectionEquality().hash(imageUrl),
      const DeepCollectionEquality().hash(favoriteGroup));

  @JsonKey(ignore: true)
  @override
  _$GroupResponseCopyWith<_GroupResponse> get copyWith =>
      __$GroupResponseCopyWithImpl<_GroupResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GroupResponseToJson(this);
  }
}

abstract class _GroupResponse implements GroupResponse {
  factory _GroupResponse(
      {required int id,
      required String name,
      required bool offline,
      required int participantCnt,
      required String startDate,
      String? imageUrl,
      required bool favoriteGroup}) = _$_GroupResponse;

  factory _GroupResponse.fromJson(Map<String, dynamic> json) =
      _$_GroupResponse.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  bool get offline;
  @override
  int get participantCnt;
  @override
  String get startDate;
  @override
  String? get imageUrl;
  @override
  bool get favoriteGroup;
  @override
  @JsonKey(ignore: true)
  _$GroupResponseCopyWith<_GroupResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
