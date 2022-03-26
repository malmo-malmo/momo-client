import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:momo_flutter/data/models/management/group_summary_response.dart';
import 'package:momo_flutter/data/models/management/my_group_response.dart';
import 'package:momo_flutter/data/repositories/group_repository.dart';

part 'my_group_provider.freezed.dart';

final myGroupStateProvider = StateNotifierProvider.autoDispose<MyGroupStateNotifier, MyGroupState>(
  (ref) {
    final groupRepository = ref.watch(groupRepositoryProvider);
    final stateNotifier = MyGroupStateNotifier(groupRepository: groupRepository);
    stateNotifier.getMyGroups();
    return stateNotifier;
  },
);

class MyGroupStateNotifier extends StateNotifier<MyGroupState> {
  MyGroupStateNotifier({
    required this.groupRepository,
  }) : super(
          MyGroupState(
            myGroups: [],
            etcGroups: [],
            isLoading: true,
          ),
        );

  final GroupRepository groupRepository;

  Future<void> getMyGroups() async {
    state = state.copyWith(isLoading: true);
    final myGroupResponse = groupRepository.getMyGroups();
    final etcGroupReponse = groupRepository.getParticipationGroups();

    final groupResponses = await Future.wait([myGroupResponse, etcGroupReponse]);

    state = state.copyWith(
      isLoading: false,
      myGroups: groupResponses.first as List<MyGroupResponse>,
      etcGroups: groupResponses.last as List<GroupSummaryReseponse>,
    );
  }

  void createGroupCallback(MyGroupResponse group) {
    state = state.copyWith(
      myGroups: [group, ...state.myGroups],
    );
  }
}

@freezed
class MyGroupState with _$MyGroupState {
  factory MyGroupState({
    required List<MyGroupResponse> myGroups,
    required List<GroupSummaryReseponse> etcGroups,
    required bool isLoading,
  }) = _MyGroupState;
}
