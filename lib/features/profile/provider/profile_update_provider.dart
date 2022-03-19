import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/app_config.dart';
import 'package:momo_flutter/data/models/user/user_update_request.dart';

final profileUpdateCheckProvider = Provider.autoDispose<bool>((ref) {
  final profileUpdateState = ref.watch(profileUpdateStateProvider);
  if (profileUpdateState.nickname.isNotEmpty &&
      profileUpdateState.university.isNotEmpty &&
      profileUpdateState.city.isNotEmpty &&
      profileUpdateState.district.isNotEmpty) {
    return true;
  }
  return false;
});

final vaildatioinNicknameProvider = StateProvider.autoDispose<bool>((ref) => true);

final profileUpdateStateProvider = StateNotifierProvider.autoDispose<ProfileUpdateState, UserUpdateRequest>(
  (ref) => ProfileUpdateState(),
);

class ProfileUpdateState extends StateNotifier<UserUpdateRequest> {
  ProfileUpdateState()
      : super(
          UserUpdateRequest(
            city: '',
            district: '',
            nickname: '',
            university: '',
            imagePath: '',
          ),
        );

  void initRequest(UserUpdateRequest userUpdateRequest) {
    state = state.copyWith(
      nickname: userUpdateRequest.nickname,
      city: userUpdateRequest.city,
      district: userUpdateRequest.district,
      university: userUpdateRequest.university,
    );
  }

  void setImagePath(String imagePath) => state = state.copyWith(imagePath: imagePath);

  void setUserNickname(String nickname) => state = state.copyWith(nickname: nickname);

  void setUserUniversity(String university) => state = state.copyWith(university: university);

  void setUserCity(String city) => state = state.copyWith(
        city: AppConfig.locationCodeNamePair.where((element) => element.name == city).first.code,
        district: '',
      );

  void setUserDistrict(String district) => state = state.copyWith(district: district);

  String get userCity => state.city.isEmpty
      ? ''
      : AppConfig.locationCodeNamePair.where((element) => element.code == state.city).first.name;
}
