import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:momo_flutter/data/models/group/group_response.dart';
import 'package:momo_flutter/data/repositories/group_repository.dart';

part 'home_group_provider.freezed.dart';

final homeGroupStateProvider = StateNotifierProvider.autoDispose<HomeGroupStateNotifier, HomeGroupState>((ref) {
  final groupRepository = ref.watch(groupRepositoryProvider);
  final stateNotifier = HomeGroupStateNotifier(groupRepository: groupRepository);
  stateNotifier.getGroups();
  return stateNotifier;
});

class HomeGroupStateNotifier extends StateNotifier<HomeGroupState> {
  HomeGroupStateNotifier({
    required this.groupRepository,
  }) : super(
          HomeGroupState(
            isLoading: true,
            categoryGroups: [],
            districtGroups: [],
            universityGroups: [],
          ),
        );

  final GroupRepository groupRepository;

  Future<void> getGroups() async {
    state = state.copyWith(isLoading: true);
    final categoryGroupResponse = groupRepository.getGroupsByCategories(0, size: 10);
    final districtGroupResponse = groupRepository.getGroupsByLocation(0, size: 10);
    final universityGroupResponse = groupRepository.getGroupsByUniversity(0, size: 10);

    final groupResponse = await Future.wait([
      categoryGroupResponse,
      districtGroupResponse,
      universityGroupResponse,
    ]);

    state = state.copyWith(
      categoryGroups: [...groupResponse[0]],
      districtGroups: [...groupResponse[1]],
      universityGroups: [...groupResponse[2]],
      isLoading: false,
    );
  }

  Future<void> createGroupLike(int groupId) async {
    await groupRepository.createGroupLike(groupId);
    state = state.copyWith(
      categoryGroups: [
        ...state.categoryGroups.map((e) => e.id == groupId ? e.copyWith(favoriteGroup: true) : e).toList()
      ],
      districtGroups: [
        ...state.districtGroups.map((e) => e.id == groupId ? e.copyWith(favoriteGroup: true) : e).toList()
      ],
      universityGroups: [
        ...state.universityGroups.map((e) => e.id == groupId ? e.copyWith(favoriteGroup: true) : e).toList()
      ],
    );
  }

  Future<void> deleteGroupLike(int groupId) async {
    await groupRepository.deleteGroupLike(groupId);
    state = state.copyWith(
      categoryGroups: [
        ...state.categoryGroups.map((e) => e.id == groupId ? e.copyWith(favoriteGroup: false) : e).toList()
      ],
      districtGroups: [
        ...state.districtGroups.map((e) => e.id == groupId ? e.copyWith(favoriteGroup: false) : e).toList()
      ],
      universityGroups: [
        ...state.universityGroups.map((e) => e.id == groupId ? e.copyWith(favoriteGroup: false) : e).toList()
      ],
    );
  }

  void groupLikeCallBack({
    required int groupId,
    required bool like,
  }) {
    state = state.copyWith(
      categoryGroups: [
        ...state.categoryGroups.map((e) => e.id == groupId ? e.copyWith(favoriteGroup: like) : e).toList()
      ],
      districtGroups: [
        ...state.districtGroups.map((e) => e.id == groupId ? e.copyWith(favoriteGroup: like) : e).toList()
      ],
      universityGroups: [
        ...state.universityGroups.map((e) => e.id == groupId ? e.copyWith(favoriteGroup: like) : e).toList()
      ],
    );
  }
}

@freezed
class HomeGroupState with _$HomeGroupState {
  factory HomeGroupState({
    required bool isLoading,
    required List<GroupResponse> categoryGroups,
    required List<GroupResponse> districtGroups,
    required List<GroupResponse> universityGroups,
  }) = _HomeGroupState;
}
