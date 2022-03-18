import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/data/repositories/user_repository.dart';
import 'package:momo_flutter/provider/state_notifier/radio_check_state_notifier.dart';

final universityResultProvider = FutureProvider.family.autoDispose<List<String>, String>(
  (ref, universityName) async {
    final userRepository = ref.watch(userRepositoryProvider);
    final universities = await userRepository.getUniversities(universityName);
    return universities.map((e) => e.name).toList();
  },
);

final universityCheckProvider = StateNotifierProvider.family.autoDispose<RadioCheckStateNotifier, List<bool>, int>(
  (ref, count) => RadioCheckStateNotifier(count),
);
