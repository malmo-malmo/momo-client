import 'package:flutter_riverpod/flutter_riverpod.dart';

final termsCheckStateProvider = StateNotifierProvider<TermsCheckState, List<bool>>((ref) => TermsCheckState());

class TermsCheckState extends StateNotifier<List<bool>> {
  TermsCheckState()
      : super(
          [
            false,
            false,
            false,
            false,
          ],
        );

  void checkAll(bool check) => state = List.generate(4, (index) => check);

  void checkTerm(int index) {
    state = [
      state[0],
      for (var i = 1; i < state.length; i++)
        if (i == index) !state[index] else state[i]
    ];

    if (state[1] && state[2] && state[3]) {
      state = List.generate(4, (index) => true);
    } else {
      state = [false, state[1], state[2], state[3]];
    }
  }

  bool isEnable() {
    if (state[0]) {
      return true;
    } else if (state[1] && state[2]) {
      return true;
    }
    return false;
  }
}
