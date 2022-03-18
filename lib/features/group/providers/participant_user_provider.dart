import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/data/models/user/participant_user_response.dart';
import 'package:momo_flutter/data/repositories/group_repository.dart';
import 'package:momo_flutter/provider/state_notifier/radio_check_state_notifier.dart';

final participantUserProvider = FutureProvider.autoDispose.family<List<ParticipantUserResponse>, int>(
  (ref, groupId) {
    final groupRepository = ref.watch(groupRepositoryProvider);
    return groupRepository.getParticipantUsers(groupId);
  },
);

final isCheckUserProvider = Provider.family.autoDispose<int, int>((ref, count) {
  final checkState = ref.watch(participantCheckStateProvider(count));
  for (int i = 0; i < checkState.length; i++) {
    if (checkState[i]) {
      return i;
    }
  }
  return -1;
});

final participantCheckStateProvider =
    StateNotifierProvider.family.autoDispose<RadioCheckStateNotifier, List<bool>, int>(
  (ref, count) => RadioCheckStateNotifier(count),
);
