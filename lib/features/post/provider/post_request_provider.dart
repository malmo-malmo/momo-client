import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/data/models/post/post_request.dart';
import 'package:momo_flutter/data/repositories/post_repository.dart';
import 'package:momo_flutter/features/post/post_request_page.dart';

final postRequestCheckProvider = Provider.family.autoDispose<bool, PostRequestArg>(
  (ref, postRequestArg) {
    final postRequest = ref.watch(postRequestStateProvider(postRequestArg));

    if (postRequest.contents.isNotEmpty && postRequest.title.isNotEmpty && postRequest.images.isNotEmpty) {
      return true;
    }
    return false;
  },
);

final postRequestStateProvider =
    StateNotifierProvider.family.autoDispose<PostRequestState, PostRequest, PostRequestArg>(
  (ref, postRequestArg) {
    final postRepository = ref.watch(postRepositoryProvider);
    return PostRequestState(
      postRequestArg,
      postRepository: postRepository,
    );
  },
);

class PostRequestState extends StateNotifier<PostRequest> {
  PostRequestState(
    PostRequestArg postRequestArg, {
    required this.postRepository,
  }) : super(
          PostRequest(
            groupId: postRequestArg.groupId,
            postType: postRequestArg.postType,
            contents: '',
            title: '',
            images: [],
          ),
        );

  final PostRepository postRepository;

  void setContents(String text) {
    state = state.copyWith(contents: text);
  }

  void setImages(List<String> images) {
    state = state.copyWith(images: [...images]);
  }

  void setTitle(String title) {
    state = state.copyWith(title: title);
  }

  void deleteImg(String img) {
    state = state.copyWith(images: state.images.where((e) => e != img).toList());
  }

  Future<dynamic> createPost() async {
    final response = await postRepository.createPost(state);
    return response;
  }
}
