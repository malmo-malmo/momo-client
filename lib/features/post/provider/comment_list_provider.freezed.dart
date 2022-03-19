// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'comment_list_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CommentListStateTearOff {
  const _$CommentListStateTearOff();

  _CommentListState call(
      {required List<Comment> comments,
      int? nextPage,
      required int commentCnt,
      dynamic error}) {
    return _CommentListState(
      comments: comments,
      nextPage: nextPage,
      commentCnt: commentCnt,
      error: error,
    );
  }
}

/// @nodoc
const $CommentListState = _$CommentListStateTearOff();

/// @nodoc
mixin _$CommentListState {
  List<Comment> get comments => throw _privateConstructorUsedError;
  int? get nextPage => throw _privateConstructorUsedError;
  int get commentCnt => throw _privateConstructorUsedError;
  dynamic get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CommentListStateCopyWith<CommentListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentListStateCopyWith<$Res> {
  factory $CommentListStateCopyWith(
          CommentListState value, $Res Function(CommentListState) then) =
      _$CommentListStateCopyWithImpl<$Res>;
  $Res call(
      {List<Comment> comments, int? nextPage, int commentCnt, dynamic error});
}

/// @nodoc
class _$CommentListStateCopyWithImpl<$Res>
    implements $CommentListStateCopyWith<$Res> {
  _$CommentListStateCopyWithImpl(this._value, this._then);

  final CommentListState _value;
  // ignore: unused_field
  final $Res Function(CommentListState) _then;

  @override
  $Res call({
    Object? comments = freezed,
    Object? nextPage = freezed,
    Object? commentCnt = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      comments: comments == freezed
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>,
      nextPage: nextPage == freezed
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as int?,
      commentCnt: commentCnt == freezed
          ? _value.commentCnt
          : commentCnt // ignore: cast_nullable_to_non_nullable
              as int,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$CommentListStateCopyWith<$Res>
    implements $CommentListStateCopyWith<$Res> {
  factory _$CommentListStateCopyWith(
          _CommentListState value, $Res Function(_CommentListState) then) =
      __$CommentListStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<Comment> comments, int? nextPage, int commentCnt, dynamic error});
}

/// @nodoc
class __$CommentListStateCopyWithImpl<$Res>
    extends _$CommentListStateCopyWithImpl<$Res>
    implements _$CommentListStateCopyWith<$Res> {
  __$CommentListStateCopyWithImpl(
      _CommentListState _value, $Res Function(_CommentListState) _then)
      : super(_value, (v) => _then(v as _CommentListState));

  @override
  _CommentListState get _value => super._value as _CommentListState;

  @override
  $Res call({
    Object? comments = freezed,
    Object? nextPage = freezed,
    Object? commentCnt = freezed,
    Object? error = freezed,
  }) {
    return _then(_CommentListState(
      comments: comments == freezed
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>,
      nextPage: nextPage == freezed
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as int?,
      commentCnt: commentCnt == freezed
          ? _value.commentCnt
          : commentCnt // ignore: cast_nullable_to_non_nullable
              as int,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$_CommentListState implements _CommentListState {
  _$_CommentListState(
      {required this.comments,
      this.nextPage,
      required this.commentCnt,
      this.error});

  @override
  final List<Comment> comments;
  @override
  final int? nextPage;
  @override
  final int commentCnt;
  @override
  final dynamic error;

  @override
  String toString() {
    return 'CommentListState(comments: $comments, nextPage: $nextPage, commentCnt: $commentCnt, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CommentListState &&
            const DeepCollectionEquality().equals(other.comments, comments) &&
            const DeepCollectionEquality().equals(other.nextPage, nextPage) &&
            const DeepCollectionEquality()
                .equals(other.commentCnt, commentCnt) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(comments),
      const DeepCollectionEquality().hash(nextPage),
      const DeepCollectionEquality().hash(commentCnt),
      const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$CommentListStateCopyWith<_CommentListState> get copyWith =>
      __$CommentListStateCopyWithImpl<_CommentListState>(this, _$identity);
}

abstract class _CommentListState implements CommentListState {
  factory _CommentListState(
      {required List<Comment> comments,
      int? nextPage,
      required int commentCnt,
      dynamic error}) = _$_CommentListState;

  @override
  List<Comment> get comments;
  @override
  int? get nextPage;
  @override
  int get commentCnt;
  @override
  dynamic get error;
  @override
  @JsonKey(ignore: true)
  _$CommentListStateCopyWith<_CommentListState> get copyWith =>
      throw _privateConstructorUsedError;
}
