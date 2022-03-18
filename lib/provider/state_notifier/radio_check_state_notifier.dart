import 'package:flutter_riverpod/flutter_riverpod.dart';

class RadioCheckStateNotifier extends StateNotifier<List<bool>> {
  RadioCheckStateNotifier(int count)
      : super(
          List.generate(
            count,
            (index) => false,
          ),
        );

  void checkOne(int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index) true else false
    ];
  }
}
