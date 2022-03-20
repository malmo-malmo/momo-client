import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:momo_flutter/data/models/management/participation_group_response.dart';
import 'package:momo_flutter/data/repositories/group_repository.dart';

part 'total_group_list_provider.freezed.dart';

final totalGroupStateProvider = StateNotifierProvider<TotalGroupStateNotifier, TotalGroupListState>(
  (ref) {
    final groupRepository = ref.watch(groupRepositoryProvider);
    final stateNotifier = TotalGroupStateNotifier(groupRepository: groupRepository);
    stateNotifier.getTotalGroups();
    return stateNotifier;
  },
);

class TotalGroupStateNotifier extends StateNotifier<TotalGroupListState> {
  TotalGroupStateNotifier({
    required this.groupRepository,
  }) : super(
          TotalGroupListState(
            isLoading: true,
            groups: [],
          ),
        );

  final GroupRepository groupRepository;

  Future<void> getTotalGroups() async {
    state = state.copyWith(isLoading: true);
    final response = await groupRepository.getParticipantGroups();
    state = state.copyWith(
      isLoading: false,
      groups: [...response],
    );
  }
}

@freezed
class TotalGroupListState with _$TotalGroupListState {
  factory TotalGroupListState({
    required bool isLoading,
    required List<ParticipationGroupResponse> groups,
    dynamic error,
  }) = _TotalGroupListState;
}
