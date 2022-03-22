import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:momo_flutter/app_config.dart';

part 'search_data_provider.freezed.dart';

final categoryFilterStateProvider = StateNotifierProvider.autoDispose<SearchRequestFilterState, List<CodeCheckPair>>(
  (ref) => SearchRequestFilterState(
    AppConfig.categoryCodeNamePair.length,
  ),
);

final locationFilterStateProvider = StateNotifierProvider.autoDispose<SearchRequestFilterState, List<CodeCheckPair>>(
  (ref) => SearchRequestFilterState(
    AppConfig.locationCodeNamePair.length,
  ),
);

final searchFilterCheckProvider = Provider.autoDispose<bool>((ref) {
  final categoryChecks = ref.watch(searchCategoryStateProvider);
  final cityChecks = ref.watch(searchLocationStateProvider);

  for (int i = 0; i < categoryChecks.length; i++) {
    if (categoryChecks[i]) {
      return true;
    }
  }
  for (int i = 0; i < cityChecks.length; i++) {
    if (cityChecks[i]) {
      return true;
    }
  }
  return false;
});

final searchCategoryStateProvider = StateNotifierProvider.autoDispose<ToggleState, List<bool>>(
  (ref) {
    final state = ref.watch(categoryFilterStateProvider).map((e) => e.check).toList();
    return ToggleState(state);
  },
);

final searchLocationStateProvider = StateNotifierProvider.autoDispose<ToggleState, List<bool>>(
  (ref) {
    final state = ref.watch(locationFilterStateProvider).map((e) => e.check).toList();
    return ToggleState(state);
  },
);

class ToggleState extends StateNotifier<List<bool>> {
  ToggleState(List<bool> state) : super(state);

  void toggle(int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index) state[index] = !state[index] else state[i]
    ];
  }
}

class SearchRequestFilterState extends StateNotifier<List<CodeCheckPair>> {
  SearchRequestFilterState(int count)
      : super(
          count == AppConfig.categoryCodeNamePair.length
              ? List.generate(
                  AppConfig.categoryCodeNamePair.length,
                  (index) => CodeCheckPair(
                    check: false,
                    code: AppConfig.categoryCodeNamePair[index].code,
                  ),
                )
              : List.generate(
                  AppConfig.locationCodeNamePair.length,
                  (index) => CodeCheckPair(
                    check: false,
                    code: AppConfig.locationCodeNamePair[index].code,
                  ),
                ),
        );

  void checkFilter(List<bool> checks) {
    state = [for (int i = 0; i < checks.length; i++) state[i].copyWith(check: checks[i])];
  }

  List<String> makeRequestFilter() {
    return [
      for (int i = 0; i < state.length; i++)
        if (state[i].check) state[i].code
    ];
  }
}

@freezed
class CodeCheckPair with _$CodeCheckPair {
  factory CodeCheckPair({
    required String code,
    required bool check,
  }) = _CodeCheckPair;
}
