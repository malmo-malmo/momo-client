import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:momo_flutter/data/repositories/user_repository.dart';

part 'mypage_count_provider.freezed.dart';

final mypageCountStateProvider = StateNotifierProvider.autoDispose<MypageCountStateNotifier, GroupAndBadgeState>(
  (ref) {
    final userRepository = ref.watch(userRepositoryProvider);
    final stateNotifier = MypageCountStateNotifier(userRepository: userRepository);
    stateNotifier.getGroupAndBadgeCount();
    return stateNotifier;
  },
);

class MypageCountStateNotifier extends StateNotifier<GroupAndBadgeState> {
  MypageCountStateNotifier({
    required this.userRepository,
  }) : super(
          GroupAndBadgeState(
            isLoading: false,
            totalGroupCount: 0,
            favoriteGroupCount: 0,
            badgeCount: 0,
          ),
        );

  final UserRepository userRepository;

  void getGroupAndBadgeCount() async {
    state = state.copyWith(isLoading: true);
    final totalGroupCountResponse = userRepository.getTotalGroupCount();
    final favoriteGroupCountResponse = userRepository.getFavoriteGroupCount();
    final counts = await Future.wait(
      [
        totalGroupCountResponse,
        favoriteGroupCountResponse,
      ],
    );

    state = state.copyWith(
      isLoading: false,
      totalGroupCount: counts[0].count,
      favoriteGroupCount: counts[1].count,
    );
  }
}

@freezed
class GroupAndBadgeState with _$GroupAndBadgeState {
  factory GroupAndBadgeState({
    required bool isLoading,
    required int totalGroupCount,
    required int favoriteGroupCount,
    required int badgeCount,
  }) = _GroupAndBadgeState;
}
