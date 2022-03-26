import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:momo_flutter/app_consts.dart';
import 'package:momo_flutter/data/models/enum/post_type.dart';
import 'package:momo_flutter/data/models/post/post_detail_response.dart';
import 'package:momo_flutter/data/models/post/post_response.dart';
import 'package:momo_flutter/data/repositories/post_repository.dart';

part 'post_list_provider.freezed.dart';

final postListStateProvider = StateNotifierProvider.autoDispose.family<PostListStateNotifier, PostListState, int>(
  (ref, groupId) {
    final postRepository = ref.watch(postRepositoryProvider);
    return PostListStateNotifier(
      groupId: groupId,
      postRepository: postRepository,
    );
  },
);

final noticeListStateProvider = StateNotifierProvider.autoDispose.family<PostListStateNotifier, PostListState, int>(
  (ref, groupId) {
    final postRepository = ref.watch(postRepositoryProvider);
    return PostListStateNotifier(
      groupId: groupId,
      postRepository: postRepository,
    );
  },
);

class PostListStateNotifier extends StateNotifier<PostListState> {
  PostListStateNotifier({
    required this.groupId,
    required this.postRepository,
  }) : super(
          PostListState(posts: []),
        );

  final int groupId;
  final PostRepository postRepository;

  Future<void> getPosts({required PostType postType}) async {
    try {
      final response = await postRepository.getPosts(
        groupId: groupId,
        lastPostId: state.nextPage,
        type: postType,
      );

      state = state.copyWith(
        posts: [...state.posts, ...response],
        nextPage: response.length == AppConsts.pageSize ? response.last.id : null,
      );
    } catch (e) {
      state = state.copyWith(error: e);
    }
  }

  void createCallback(PostDetailResponse post) {
    final _post = PostResponse(
      id: post.id,
      authorNickname: post.authorNickname,
      title: post.title,
      contents: post.contents,
      createdDate: post.createdDate,
      commentCnt: 0,
      authorImage: post.authorImage,
    );

    state = state.copyWith(posts: [
      _post,
      ...state.posts,
    ]);
  }
}

@freezed
class PostListState with _$PostListState {
  factory PostListState({
    required List<PostResponse> posts,
    int? nextPage,
    dynamic error,
  }) = _PostListState;
}
