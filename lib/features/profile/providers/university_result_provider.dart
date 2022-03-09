import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/data/repositories/user_repository.dart';

final universityResultProvider = FutureProvider.family.autoDispose<List<String>, String>(
  (ref, universityName) async {
    final userRepository = ref.watch(userRepositoryProvider);
    final universities = await userRepository.getUniversities(universityName);
    return universities.map((e) => e.name).toList();
  },
);

final universityCheckProvider = StateNotifierProvider.family.autoDispose<UniversityCheckState, List<bool>, int>(
  (ref, count) => UniversityCheckState(count),
);

class UniversityCheckState extends StateNotifier<List<bool>> {
  UniversityCheckState(int count) : super(List.generate(count, (index) => false));

  void checkOne(int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index) true else false
    ];
  }
}
