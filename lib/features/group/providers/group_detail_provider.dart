import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/data/models/group/group_detail_response.dart';
import 'package:momo_flutter/data/repositories/group_repository.dart';

final groupDetailStateProvider =
    StateNotifierProvider.autoDispose.family<GroupDetailReponseState, GroupDetailResponse, int>(
  (ref, groupId) {
    final groupRepository = ref.watch(groupRepositoryProvider);
    final stateNotifier = GroupDetailReponseState(
      groupRepository: groupRepository,
      groupId: groupId,
    );
    stateNotifier.getGroupDetail();
    return stateNotifier;
  },
);

class GroupDetailReponseState extends StateNotifier<GroupDetailResponse> {
  GroupDetailReponseState({
    required this.groupRepository,
    required int groupId,
  }) : super(
          GroupDetailResponse(
            id: groupId,
            managerId: -1,
            city: '',
            district: '',
            introduction: '',
            name: '',
            offline: false,
            participant: false,
            participantCnt: 0,
            startDate: '',
            end: false,
            recruitmentCnt: -1,
          ),
        );

  final GroupRepository groupRepository;

  void getGroupDetail() async {
    final response = await groupRepository.getGroupDetail(state.id);
    state = response;
  }

  Future<dynamic> participantGroup() async {
    await groupRepository.participantGroup(state.id);
    state = state.copyWith(
      participant: true,
      participantCnt: state.participantCnt + 1,
    );
  }

  Future<dynamic> endGroup() async {
    await groupRepository.endGropu(state.id);
    state = state.copyWith(end: true);
  }

  Future<dynamic> managerGroup(int userId) async {
    await groupRepository.managerGroup(id: state.id, userId: userId);
    state = state.copyWith(managerId: userId);
  }

  Future<dynamic> withdrawalGroup() async {
    await groupRepository.withdrawalGroup(state.id);
    state = state.copyWith(
      participant: false,
      participantCnt: state.participantCnt - 1,
    );
  }
}
