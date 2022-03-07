import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/data/models/common/code_name_pair.dart';
import 'package:momo_flutter/data/models/user/user_response.dart';
import 'package:momo_flutter/data/repositories/user_repository.dart';

final userDataStateProvider = StateNotifierProvider<UserDataStateNotifier, UserResponse>((ref) {
  final userRepository = ref.watch(userRepositoryProvider);
  return UserDataStateNotifier(userRepository: userRepository);
});

class UserDataStateNotifier extends StateNotifier<UserResponse> {
  UserDataStateNotifier({
    required this.userRepository,
  }) : super(
          UserResponse(
            id: -1,
            nickname: '',
            city: CodeNamePair(
              code: '',
              name: '',
            ),
            district: '',
            university: '',
            categories: [],
          ),
        );

  final UserRepository userRepository;

  Future<dynamic> getUserData() async {
    final userResponse = await userRepository.getUserData();
    state = userResponse;
  }

  Future<bool> isFirstLogin() async {
    try {
      final userResponse = await userRepository.getUserData();
      if (userResponse.nickname.isNotEmpty) {
        state = userResponse;
        return false;
      }
      return true;
    } catch (e) {
      return true;
    }
  }
}
