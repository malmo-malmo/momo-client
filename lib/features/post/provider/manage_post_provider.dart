import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:momo_flutter/app_consts.dart';
import 'package:momo_flutter/data/models/management/management_post_response.dart';
import 'package:momo_flutter/data/repositories/post_repository.dart';

part 'manage_post_provider.freezed.dart';

final managePostStateProvider = StateNotifierProvider.autoDispose<ManagePostStateNotifier, ManagePostState>(
  (ref) {
    final postRepository = ref.watch(postRepositoryProvider);
    return ManagePostStateNotifier(postRepository: postRepository);
  },
);

class ManagePostStateNotifier extends StateNotifier<ManagePostState> {
  ManagePostStateNotifier({
    required this.postRepository,
  }) : super(
          ManagePostState(
            managePosts: [],
          ),
        );

  final PostRepository postRepository;

  Future<void> getManagePosts(int page) async {
    try {
      final response = await postRepository.getManagementPosts(page++);
      state = state.copyWith(
        managePosts: [...state.managePosts, ...response],
        nextPage: response.length == AppConsts.pageSize ? page : null,
      );
    } catch (e) {
      state = state.copyWith(
        error: e,
      );
    }
  }
}

@freezed
class ManagePostState with _$ManagePostState {
  factory ManagePostState({
    required List<ManagementPostResponse> managePosts,
    int? nextPage,
    dynamic error,
  }) = _ManagePostState;
}
