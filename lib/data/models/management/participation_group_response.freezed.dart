// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'participation_group_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ParticipationGroupResponse _$ParticipationGroupResponseFromJson(
    Map<String, dynamic> json) {
  return _ParticipationGroupResponse.fromJson(json);
}

/// @nodoc
class _$ParticipationGroupResponseTearOff {
  const _$ParticipationGroupResponseTearOff();

  _ParticipationGroupResponse call(
      {required int id,
      required String name,
      required bool offline,
      required int participantCnt,
      required String startDate,
      String? imageUrl,
      required bool end}) {
    return _ParticipationGroupResponse(
      id: id,
      name: name,
      offline: offline,
      participantCnt: participantCnt,
      startDate: startDate,
      imageUrl: imageUrl,
      end: end,
    );
  }

  ParticipationGroupResponse fromJson(Map<String, Object?> json) {
    return ParticipationGroupResponse.fromJson(json);
  }
}

/// @nodoc
const $ParticipationGroupResponse = _$ParticipationGroupResponseTearOff();

/// @nodoc
mixin _$ParticipationGroupResponse {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get offline => throw _privateConstructorUsedError;
  int get participantCnt => throw _privateConstructorUsedError;
  String get startDate => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  bool get end => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ParticipationGroupResponseCopyWith<ParticipationGroupResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParticipationGroupResponseCopyWith<$Res> {
  factory $ParticipationGroupResponseCopyWith(ParticipationGroupResponse value,
          $Res Function(ParticipationGroupResponse) then) =
      _$ParticipationGroupResponseCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String name,
      bool offline,
      int participantCnt,
      String startDate,
      String? imageUrl,
      bool end});
}

/// @nodoc
class _$ParticipationGroupResponseCopyWithImpl<$Res>
    implements $ParticipationGroupResponseCopyWith<$Res> {
  _$ParticipationGroupResponseCopyWithImpl(this._value, this._then);

  final ParticipationGroupResponse _value;
  // ignore: unused_field
  final $Res Function(ParticipationGroupResponse) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? offline = freezed,
    Object? participantCnt = freezed,
    Object? startDate = freezed,
    Object? imageUrl = freezed,
    Object? end = freezed,
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
      end: end == freezed
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$ParticipationGroupResponseCopyWith<$Res>
    implements $ParticipationGroupResponseCopyWith<$Res> {
  factory _$ParticipationGroupResponseCopyWith(
          _ParticipationGroupResponse value,
          $Res Function(_ParticipationGroupResponse) then) =
      __$ParticipationGroupResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String name,
      bool offline,
      int participantCnt,
      String startDate,
      String? imageUrl,
      bool end});
}

/// @nodoc
class __$ParticipationGroupResponseCopyWithImpl<$Res>
    extends _$ParticipationGroupResponseCopyWithImpl<$Res>
    implements _$ParticipationGroupResponseCopyWith<$Res> {
  __$ParticipationGroupResponseCopyWithImpl(_ParticipationGroupResponse _value,
      $Res Function(_ParticipationGroupResponse) _then)
      : super(_value, (v) => _then(v as _ParticipationGroupResponse));

  @override
  _ParticipationGroupResponse get _value =>
      super._value as _ParticipationGroupResponse;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? offline = freezed,
    Object? participantCnt = freezed,
    Object? startDate = freezed,
    Object? imageUrl = freezed,
    Object? end = freezed,
  }) {
    return _then(_ParticipationGroupResponse(
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
      end: end == freezed
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ParticipationGroupResponse implements _ParticipationGroupResponse {
  _$_ParticipationGroupResponse(
      {required this.id,
      required this.name,
      required this.offline,
      required this.participantCnt,
      required this.startDate,
      this.imageUrl,
      required this.end});

  factory _$_ParticipationGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ParticipationGroupResponseFromJson(json);

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
  final bool end;

  @override
  String toString() {
    return 'ParticipationGroupResponse(id: $id, name: $name, offline: $offline, participantCnt: $participantCnt, startDate: $startDate, imageUrl: $imageUrl, end: $end)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ParticipationGroupResponse &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.offline, offline) &&
            const DeepCollectionEquality()
                .equals(other.participantCnt, participantCnt) &&
            const DeepCollectionEquality().equals(other.startDate, startDate) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl) &&
            const DeepCollectionEquality().equals(other.end, end));
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
      const DeepCollectionEquality().hash(end));

  @JsonKey(ignore: true)
  @override
  _$ParticipationGroupResponseCopyWith<_ParticipationGroupResponse>
      get copyWith => __$ParticipationGroupResponseCopyWithImpl<
          _ParticipationGroupResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ParticipationGroupResponseToJson(this);
  }
}

abstract class _ParticipationGroupResponse
    implements ParticipationGroupResponse {
  factory _ParticipationGroupResponse(
      {required int id,
      required String name,
      required bool offline,
      required int participantCnt,
      required String startDate,
      String? imageUrl,
      required bool end}) = _$_ParticipationGroupResponse;

  factory _ParticipationGroupResponse.fromJson(Map<String, dynamic> json) =
      _$_ParticipationGroupResponse.fromJson;

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
  bool get end;
  @override
  @JsonKey(ignore: true)
  _$ParticipationGroupResponseCopyWith<_ParticipationGroupResponse>
      get copyWith => throw _privateConstructorUsedError;
}
