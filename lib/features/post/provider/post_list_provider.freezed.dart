// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post_list_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PostListStateTearOff {
  const _$PostListStateTearOff();

  _PostListState call(
      {required List<PostResponse> posts, int? nextPage, dynamic error}) {
    return _PostListState(
      posts: posts,
      nextPage: nextPage,
      error: error,
    );
  }
}

/// @nodoc
const $PostListState = _$PostListStateTearOff();

/// @nodoc
mixin _$PostListState {
  List<PostResponse> get posts => throw _privateConstructorUsedError;
  int? get nextPage => throw _privateConstructorUsedError;
  dynamic get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PostListStateCopyWith<PostListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostListStateCopyWith<$Res> {
  factory $PostListStateCopyWith(
          PostListState value, $Res Function(PostListState) then) =
      _$PostListStateCopyWithImpl<$Res>;
  $Res call({List<PostResponse> posts, int? nextPage, dynamic error});
}

/// @nodoc
class _$PostListStateCopyWithImpl<$Res>
    implements $PostListStateCopyWith<$Res> {
  _$PostListStateCopyWithImpl(this._value, this._then);

  final PostListState _value;
  // ignore: unused_field
  final $Res Function(PostListState) _then;

  @override
  $Res call({
    Object? posts = freezed,
    Object? nextPage = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      posts: posts == freezed
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<PostResponse>,
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
abstract class _$PostListStateCopyWith<$Res>
    implements $PostListStateCopyWith<$Res> {
  factory _$PostListStateCopyWith(
          _PostListState value, $Res Function(_PostListState) then) =
      __$PostListStateCopyWithImpl<$Res>;
  @override
  $Res call({List<PostResponse> posts, int? nextPage, dynamic error});
}

/// @nodoc
class __$PostListStateCopyWithImpl<$Res>
    extends _$PostListStateCopyWithImpl<$Res>
    implements _$PostListStateCopyWith<$Res> {
  __$PostListStateCopyWithImpl(
      _PostListState _value, $Res Function(_PostListState) _then)
      : super(_value, (v) => _then(v as _PostListState));

  @override
  _PostListState get _value => super._value as _PostListState;

  @override
  $Res call({
    Object? posts = freezed,
    Object? nextPage = freezed,
    Object? error = freezed,
  }) {
    return _then(_PostListState(
      posts: posts == freezed
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<PostResponse>,
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

class _$_PostListState implements _PostListState {
  _$_PostListState({required this.posts, this.nextPage, this.error});

  @override
  final List<PostResponse> posts;
  @override
  final int? nextPage;
  @override
  final dynamic error;

  @override
  String toString() {
    return 'PostListState(posts: $posts, nextPage: $nextPage, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PostListState &&
            const DeepCollectionEquality().equals(other.posts, posts) &&
            const DeepCollectionEquality().equals(other.nextPage, nextPage) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(posts),
      const DeepCollectionEquality().hash(nextPage),
      const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$PostListStateCopyWith<_PostListState> get copyWith =>
      __$PostListStateCopyWithImpl<_PostListState>(this, _$identity);
}

abstract class _PostListState implements PostListState {
  factory _PostListState(
      {required List<PostResponse> posts,
      int? nextPage,
      dynamic error}) = _$_PostListState;

  @override
  List<PostResponse> get posts;
  @override
  int? get nextPage;
  @override
  dynamic get error;
  @override
  @JsonKey(ignore: true)
  _$PostListStateCopyWith<_PostListState> get copyWith =>
      throw _privateConstructorUsedError;
}
