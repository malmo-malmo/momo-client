// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'schedule_summary_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScheduleSummaryResponse _$ScheduleSummaryResponseFromJson(
    Map<String, dynamic> json) {
  return _ScheduleSummaryResponse.fromJson(json);
}

/// @nodoc
class _$ScheduleSummaryResponseTearOff {
  const _$ScheduleSummaryResponseTearOff();

  _ScheduleSummaryResponse call(
      {required int groupId,
      required String startDateTime,
      required String title,
      @JsonKey(name: 'groupCategory') required CodeNamePair category}) {
    return _ScheduleSummaryResponse(
      groupId: groupId,
      startDateTime: startDateTime,
      title: title,
      category: category,
    );
  }

  ScheduleSummaryResponse fromJson(Map<String, Object?> json) {
    return ScheduleSummaryResponse.fromJson(json);
  }
}

/// @nodoc
const $ScheduleSummaryResponse = _$ScheduleSummaryResponseTearOff();

/// @nodoc
mixin _$ScheduleSummaryResponse {
  int get groupId => throw _privateConstructorUsedError;
  String get startDateTime => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'groupCategory')
  CodeNamePair get category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScheduleSummaryResponseCopyWith<ScheduleSummaryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleSummaryResponseCopyWith<$Res> {
  factory $ScheduleSummaryResponseCopyWith(ScheduleSummaryResponse value,
          $Res Function(ScheduleSummaryResponse) then) =
      _$ScheduleSummaryResponseCopyWithImpl<$Res>;
  $Res call(
      {int groupId,
      String startDateTime,
      String title,
      @JsonKey(name: 'groupCategory') CodeNamePair category});

  $CodeNamePairCopyWith<$Res> get category;
}

/// @nodoc
class _$ScheduleSummaryResponseCopyWithImpl<$Res>
    implements $ScheduleSummaryResponseCopyWith<$Res> {
  _$ScheduleSummaryResponseCopyWithImpl(this._value, this._then);

  final ScheduleSummaryResponse _value;
  // ignore: unused_field
  final $Res Function(ScheduleSummaryResponse) _then;

  @override
  $Res call({
    Object? groupId = freezed,
    Object? startDateTime = freezed,
    Object? title = freezed,
    Object? category = freezed,
  }) {
    return _then(_value.copyWith(
      groupId: groupId == freezed
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int,
      startDateTime: startDateTime == freezed
          ? _value.startDateTime
          : startDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CodeNamePair,
    ));
  }

  @override
  $CodeNamePairCopyWith<$Res> get category {
    return $CodeNamePairCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value));
    });
  }
}

/// @nodoc
abstract class _$ScheduleSummaryResponseCopyWith<$Res>
    implements $ScheduleSummaryResponseCopyWith<$Res> {
  factory _$ScheduleSummaryResponseCopyWith(_ScheduleSummaryResponse value,
          $Res Function(_ScheduleSummaryResponse) then) =
      __$ScheduleSummaryResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {int groupId,
      String startDateTime,
      String title,
      @JsonKey(name: 'groupCategory') CodeNamePair category});

  @override
  $CodeNamePairCopyWith<$Res> get category;
}

/// @nodoc
class __$ScheduleSummaryResponseCopyWithImpl<$Res>
    extends _$ScheduleSummaryResponseCopyWithImpl<$Res>
    implements _$ScheduleSummaryResponseCopyWith<$Res> {
  __$ScheduleSummaryResponseCopyWithImpl(_ScheduleSummaryResponse _value,
      $Res Function(_ScheduleSummaryResponse) _then)
      : super(_value, (v) => _then(v as _ScheduleSummaryResponse));

  @override
  _ScheduleSummaryResponse get _value =>
      super._value as _ScheduleSummaryResponse;

  @override
  $Res call({
    Object? groupId = freezed,
    Object? startDateTime = freezed,
    Object? title = freezed,
    Object? category = freezed,
  }) {
    return _then(_ScheduleSummaryResponse(
      groupId: groupId == freezed
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int,
      startDateTime: startDateTime == freezed
          ? _value.startDateTime
          : startDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CodeNamePair,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ScheduleSummaryResponse implements _ScheduleSummaryResponse {
  _$_ScheduleSummaryResponse(
      {required this.groupId,
      required this.startDateTime,
      required this.title,
      @JsonKey(name: 'groupCategory') required this.category});

  factory _$_ScheduleSummaryResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ScheduleSummaryResponseFromJson(json);

  @override
  final int groupId;
  @override
  final String startDateTime;
  @override
  final String title;
  @override
  @JsonKey(name: 'groupCategory')
  final CodeNamePair category;

  @override
  String toString() {
    return 'ScheduleSummaryResponse(groupId: $groupId, startDateTime: $startDateTime, title: $title, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ScheduleSummaryResponse &&
            const DeepCollectionEquality().equals(other.groupId, groupId) &&
            const DeepCollectionEquality()
                .equals(other.startDateTime, startDateTime) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.category, category));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(groupId),
      const DeepCollectionEquality().hash(startDateTime),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(category));

  @JsonKey(ignore: true)
  @override
  _$ScheduleSummaryResponseCopyWith<_ScheduleSummaryResponse> get copyWith =>
      __$ScheduleSummaryResponseCopyWithImpl<_ScheduleSummaryResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScheduleSummaryResponseToJson(this);
  }
}

abstract class _ScheduleSummaryResponse implements ScheduleSummaryResponse {
  factory _ScheduleSummaryResponse(
          {required int groupId,
          required String startDateTime,
          required String title,
          @JsonKey(name: 'groupCategory') required CodeNamePair category}) =
      _$_ScheduleSummaryResponse;

  factory _ScheduleSummaryResponse.fromJson(Map<String, dynamic> json) =
      _$_ScheduleSummaryResponse.fromJson;

  @override
  int get groupId;
  @override
  String get startDateTime;
  @override
  String get title;
  @override
  @JsonKey(name: 'groupCategory')
  CodeNamePair get category;
  @override
  @JsonKey(ignore: true)
  _$ScheduleSummaryResponseCopyWith<_ScheduleSummaryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
