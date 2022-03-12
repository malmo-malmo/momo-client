import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/app_consts.dart';

final photoDataStateProvider = StateProvider.autoDispose<String>((ref) => '');

final photoDatasStateProvider =
    StateNotifierProvider.autoDispose<PhotoListState, List<String>>((ref) => PhotoListState());

final isSelectPhoto = Provider.autoDispose<bool>(
  (ref) {
    final photoDatas = ref.watch(photoDatasStateProvider);
    return photoDatas.isNotEmpty;
  },
);

final checkMaxPhoto = Provider.autoDispose<bool>(
  (ref) {
    final photoDatas = ref.watch(photoDatasStateProvider);
    return photoDatas.length == AppConsts.maxSelectCount;
  },
);

class PhotoListState extends StateNotifier<List<String>> {
  PhotoListState() : super([]);

  void setData({
    required bool check,
    required String image,
  }) {
    if (check) {
      state.remove(image);
    } else {
      state = [...state, image];
    }
  }
}
