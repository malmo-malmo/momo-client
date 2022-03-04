// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'my_group_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MyGroupResponse _$MyGroupResponseFromJson(Map<String, dynamic> json) {
  return _MyGroupResponse.fromJson(json);
}

/// @nodoc
class _$MyGroupResponseTearOff {
  const _$MyGroupResponseTearOff();

  _MyGroupResponse call(
      {required int id,
      required String name,
      String? imageUrl,
      int? achievementRate}) {
    return _MyGroupResponse(
      id: id,
      name: name,
      imageUrl: imageUrl,
      achievementRate: achievementRate,
    );
  }

  MyGroupResponse fromJson(Map<String, Object?> json) {
    return MyGroupResponse.fromJson(json);
  }
}

/// @nodoc
const $MyGroupResponse = _$MyGroupResponseTearOff();

/// @nodoc
mixin _$MyGroupResponse {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  int? get achievementRate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyGroupResponseCopyWith<MyGroupResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyGroupResponseCopyWith<$Res> {
  factory $MyGroupResponseCopyWith(
          MyGroupResponse value, $Res Function(MyGroupResponse) then) =
      _$MyGroupResponseCopyWithImpl<$Res>;
  $Res call({int id, String name, String? imageUrl, int? achievementRate});
}

/// @nodoc
class _$MyGroupResponseCopyWithImpl<$Res>
    implements $MyGroupResponseCopyWith<$Res> {
  _$MyGroupResponseCopyWithImpl(this._value, this._then);

  final MyGroupResponse _value;
  // ignore: unused_field
  final $Res Function(MyGroupResponse) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? imageUrl = freezed,
    Object? achievementRate = freezed,
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
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      achievementRate: achievementRate == freezed
          ? _value.achievementRate
          : achievementRate // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$MyGroupResponseCopyWith<$Res>
    implements $MyGroupResponseCopyWith<$Res> {
  factory _$MyGroupResponseCopyWith(
          _MyGroupResponse value, $Res Function(_MyGroupResponse) then) =
      __$MyGroupResponseCopyWithImpl<$Res>;
  @override
  $Res call({int id, String name, String? imageUrl, int? achievementRate});
}

/// @nodoc
class __$MyGroupResponseCopyWithImpl<$Res>
    extends _$MyGroupResponseCopyWithImpl<$Res>
    implements _$MyGroupResponseCopyWith<$Res> {
  __$MyGroupResponseCopyWithImpl(
      _MyGroupResponse _value, $Res Function(_MyGroupResponse) _then)
      : super(_value, (v) => _then(v as _MyGroupResponse));

  @override
  _MyGroupResponse get _value => super._value as _MyGroupResponse;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? imageUrl = freezed,
    Object? achievementRate = freezed,
  }) {
    return _then(_MyGroupResponse(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      achievementRate: achievementRate == freezed
          ? _value.achievementRate
          : achievementRate // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MyGroupResponse implements _MyGroupResponse {
  _$_MyGroupResponse(
      {required this.id,
      required this.name,
      this.imageUrl,
      this.achievementRate});

  factory _$_MyGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$$_MyGroupResponseFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? imageUrl;
  @override
  final int? achievementRate;

  @override
  String toString() {
    return 'MyGroupResponse(id: $id, name: $name, imageUrl: $imageUrl, achievementRate: $achievementRate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MyGroupResponse &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl) &&
            const DeepCollectionEquality()
                .equals(other.achievementRate, achievementRate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(imageUrl),
      const DeepCollectionEquality().hash(achievementRate));

  @JsonKey(ignore: true)
  @override
  _$MyGroupResponseCopyWith<_MyGroupResponse> get copyWith =>
      __$MyGroupResponseCopyWithImpl<_MyGroupResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MyGroupResponseToJson(this);
  }
}

abstract class _MyGroupResponse implements MyGroupResponse {
  factory _MyGroupResponse(
      {required int id,
      required String name,
      String? imageUrl,
      int? achievementRate}) = _$_MyGroupResponse;

  factory _MyGroupResponse.fromJson(Map<String, dynamic> json) =
      _$_MyGroupResponse.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get imageUrl;
  @override
  int? get achievementRate;
  @override
  @JsonKey(ignore: true)
  _$MyGroupResponseCopyWith<_MyGroupResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
