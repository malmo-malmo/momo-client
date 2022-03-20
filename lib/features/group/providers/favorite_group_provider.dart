import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:momo_flutter/data/models/group/group_response.dart';
import 'package:momo_flutter/data/repositories/group_repository.dart';

part 'favorite_group_provider.freezed.dart';

final favoriteGroupListProvider =
    StateNotifierProvider.autoDispose<FavoriteGroupListStateNotifier, FavoriteGroupListState>(
  (ref) {
    final groupRepository = ref.watch(groupRepositoryProvider);
    final stateNotifier = FavoriteGroupListStateNotifier(groupRepository: groupRepository);
    stateNotifier.getFavoriteGroups();
    return stateNotifier;
  },
);

class FavoriteGroupListStateNotifier extends StateNotifier<FavoriteGroupListState> {
  FavoriteGroupListStateNotifier({
    required this.groupRepository,
  }) : super(
          FavoriteGroupListState(
            favoriteGroups: [],
            isLoading: false,
          ),
        );

  final GroupRepository groupRepository;

  Future<void> getFavoriteGroups() async {
    state = state.copyWith(isLoading: true);
    try {
      final response = await groupRepository.getFavoriteGroups();
      state = state.copyWith(
        favoriteGroups: [
          ...state.favoriteGroups,
          ...response.map((e) => e.groupCardResponse).toList(),
        ],
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        error: e.toString(),
        isLoading: false,
      );
    }
  }

  Future<dynamic> createLike(int index) async {
    try {
      await groupRepository.createGroupLike(state.favoriteGroups[index].id);
      var cur = state.favoriteGroups;
      cur[index] = cur[index].copyWith(favoriteGroup: true);
      state = state.copyWith(favoriteGroups: [...cur]);
    } catch (e) {
      state = state.copyWith(error: e);
    }
  }

  Future<dynamic> deleteLike(int index) async {
    try {
      await groupRepository.deleteGroupLike(state.favoriteGroups[index].id);
      var cur = state.favoriteGroups;
      cur[index] = cur[index].copyWith(favoriteGroup: false);
      state = state.copyWith(favoriteGroups: [...cur]);
    } catch (e) {
      state = state.copyWith(error: e);
    }
  }
}

@freezed
class FavoriteGroupListState with _$FavoriteGroupListState {
  factory FavoriteGroupListState({
    required List<GroupResponse> favoriteGroups,
    dynamic error,
    required bool isLoading,
  }) = _FavoriteGroupListState;
}
