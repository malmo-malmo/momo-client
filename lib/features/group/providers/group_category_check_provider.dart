import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/app_config.dart';
import 'package:momo_flutter/provider/user_provider.dart';

final groupCategoryCheckStateProvider = StateNotifierProvider.autoDispose<GroupCategoryListState, List<bool>>(
  (ref) => GroupCategoryListState(
    read: ref.read,
  ),
);

class GroupCategoryListState extends StateNotifier<List<bool>> {
  GroupCategoryListState({
    required this.read,
  }) : super(List.generate(9, (index) => index == 0 ? true : false));

  final Reader read;

  void toggleCategory(int index) {
    if (index == 0) {
      state = List.generate(9, (idx) => idx == 0 ? !state[index] : false);
    } else {
      state = [
        false,
        for (int i = 1; i < 9; i++)
          if (i == index) state[index] = !state[index] else state[i]
      ];
    }
  }

  List<String> makeFilter() {
    final userData = read(userDataStateProvider);
    if (state.first) {
      return userData.categories.map((e) => e.code).toList();
    } else {
      return [
        for (int i = 1; i < state.length; i++)
          if (state[i]) AppConfig.categoryCodeNamePair[i - 1].code
      ];
    }
  }
}
