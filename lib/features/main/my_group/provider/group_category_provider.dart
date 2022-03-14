import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/app_config.dart';

final groupRequestCategoryStateProvider = StateNotifierProvider.autoDispose<GroupRequestCategoryState, List<bool>>(
  (ref) => GroupRequestCategoryState(),
);

class GroupRequestCategoryState extends StateNotifier<List<bool>> {
  GroupRequestCategoryState()
      : super(
          List.generate(
            AppConfig.categoryCodeNamePair.length,
            (index) => false,
          ),
        );

  void checkCategory(int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index) state[index] = true else false
    ];
  }
}
