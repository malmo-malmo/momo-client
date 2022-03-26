import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:momo_flutter/app_consts.dart';
import 'package:momo_flutter/data/models/group/group_response.dart';
import 'package:momo_flutter/data/repositories/group_repository.dart';

part 'group_list_provider.freezed.dart';

final groupListStateProvider = StateNotifierProvider.autoDispose<GroupListStateNotifier, GroupListState>(
  (ref) {
    final groupRepository = ref.watch(groupRepositoryProvider);
    return GroupListStateNotifier(groupRepository: groupRepository);
  },
);

class GroupListStateNotifier extends StateNotifier<GroupListState> {
  GroupListStateNotifier({
    required this.groupRepository,
  }) : super(GroupListState(groups: []));

  final GroupRepository groupRepository;

  Future<void> getGroupsByCategoriesDetail(int page, List<String> categories) async {
    try {
      final response = await groupRepository.getGroupsBySearch(
        page,
        categories: categories,
      );
      state = state.copyWith(
        groups: [
          ...state.groups,
          ...response,
        ],
        nextPage: response.length == AppConsts.pageSize ? page : null,
      );
    } catch (e) {
      state = state.copyWith(error: e);
    }
  }

  void resetGroups() => state = state.copyWith(
        groups: [],
        nextPage: 0,
        error: null,
      );

  Future<void> getGroupsByDistrict() async {
    try {
      final response = await groupRepository.getGroupsByLocation(lastGroupId: state.nextPage);
      state = state.copyWith(
        groups: [
          ...state.groups,
          ...response,
        ],
        nextPage: response.length == AppConsts.pageSize ? response.last.id : null,
      );
    } catch (e) {
      state = state.copyWith(error: e);
    }
  }

  Future<void> getGroupsByCategories() async {
    try {
      final response = await groupRepository.getGroupsByCategories(lastGroupId: state.nextPage);
      state = state.copyWith(
        groups: [
          ...state.groups,
          ...response,
        ],
        nextPage: response.length == AppConsts.pageSize ? response.last.id : null,
      );
    } catch (e) {
      state = state.copyWith(error: e);
    }
  }

  Future<void> getGroupsByUniversity() async {
    try {
      final response = await groupRepository.getGroupsByUniversity(lastGroupId: state.nextPage);
      state = state.copyWith(
        groups: [
          ...state.groups,
          ...response,
        ],
        nextPage: response.length == AppConsts.pageSize ? response.last.id : null,
      );
    } catch (e) {
      state = state.copyWith(error: e);
    }
  }

  Future<void> createLike(int index) async {
    try {
      await groupRepository.createGroupLike(state.groups[index].id);
      var cur = state.groups;
      cur[index] = cur[index].copyWith(favoriteGroup: true);
      state = state.copyWith(groups: [...cur]);
    } catch (e) {
      state = state.copyWith(error: e);
    }
  }

  Future<void> deleteLike(int index) async {
    try {
      await groupRepository.deleteGroupLike(state.groups[index].id);
      var cur = state.groups;
      cur[index] = cur[index].copyWith(favoriteGroup: false);
      state = state.copyWith(groups: [...cur]);
    } catch (e) {
      state = state.copyWith(error: e);
    }
  }
}

@freezed
class GroupListState with _$GroupListState {
  factory GroupListState({
    required List<GroupResponse> groups,
    int? nextPage,
    dynamic error,
  }) = _GroupListState;
}
