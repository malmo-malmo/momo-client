import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/app_config.dart';

final categoryStateProvider = StateNotifierProvider.family.autoDispose<CategoryState, List<bool>, List<bool>?>(
  (ref, initialState) => CategoryState(initialState: initialState),
);

class CategoryState extends StateNotifier<List<bool>> {
  CategoryState({
    List<bool>? initialState,
  }) : super(
          initialState ??
              List.generate(
                AppConfig.categoryCodeNamePair.length,
                (index) => false,
              ),
        );

  void toggleCategory(int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index) state[index] = !state[index] else state[i]
    ];
  }

  bool isValid() {
    for (bool check in state) {
      if (check) {
        return true;
      }
    }
    return false;
  }
}
