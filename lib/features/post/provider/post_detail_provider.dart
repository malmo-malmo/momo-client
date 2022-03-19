import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/data/models/post/post_detail_response.dart';
import 'package:momo_flutter/data/repositories/post_repository.dart';

final postDetailStateProvider = StateNotifierProvider.family.autoDispose<PostDetailState, PostDetailResponse, int>(
  (ref, postId) {
    final postRepository = ref.watch(postRepositoryProvider);
    return PostDetailState(
      postId: postId,
      postRepository: postRepository,
    );
  },
);

class PostDetailState extends StateNotifier<PostDetailResponse> {
  PostDetailState({
    required int postId,
    required this.postRepository,
  }) : super(
          PostDetailResponse(
            id: postId,
            authorId: -1,
            authorNickname: '',
            title: '',
            contents: '',
            imageUrls: [],
            createdDate: '',
          ),
        );

  final PostRepository postRepository;

  Future<void> getPostDetail() async {
    final response = await postRepository.getPostDetail(state.id);
    state = response;
  }
}
