import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:momo_flutter/app_consts.dart';
import 'package:momo_flutter/data/models/comment/comment.dart';
import 'package:momo_flutter/data/models/comment/comment_request.dart';
import 'package:momo_flutter/data/repositories/comment_repository.dart';

part 'comment_list_provider.freezed.dart';

final commentListStateProvider =
    StateNotifierProvider.family.autoDispose<CommentListStateNotifier, CommentListState, int>(
  (ref, postId) {
    final commentRepository = ref.watch(commentRepositoryProvider);
    return CommentListStateNotifier(
      postId: postId,
      commentRepository: commentRepository,
    );
  },
);

class CommentListStateNotifier extends StateNotifier<CommentListState> {
  CommentListStateNotifier({
    required this.postId,
    required this.commentRepository,
  }) : super(
          CommentListState(
            comments: [],
            nextPage: 0,
            commentCnt: 0,
          ),
        );

  final CommentRepository commentRepository;
  final int postId;

  Future<void> getComments(int page) async {
    try {
      final response = await commentRepository.getComments(page: page++, postId: postId);
      state = state.copyWith(
        comments: [
          ...state.comments,
          ...response.comments,
        ],
        nextPage: response.comments.length == AppConsts.pageSize ? page : null,
        commentCnt: response.commentCnt,
      );
    } catch (e) {
      state = state.copyWith(error: e);
    }
  }

  Future<void> createComment(String contents) async {
    final comment = await commentRepository.createComment(
      CommentRequest(
        postId: postId,
        contents: contents,
      ),
    );
    state = state.copyWith(
      comments: [
        comment,
        ...state.comments,
      ],
      commentCnt: state.commentCnt + 1,
    );
  }
}

@freezed
class CommentListState with _$CommentListState {
  factory CommentListState({
    required List<Comment> comments,
    int? nextPage,
    required int commentCnt,
    dynamic error,
  }) = _CommentListState;
}
