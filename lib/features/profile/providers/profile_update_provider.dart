import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/app_config.dart';
import 'package:momo_flutter/data/models/user/user_update_request.dart';

final vaildatioinNicknameProvider = StateProvider.autoDispose<bool>((ref) => false);

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

  bool isValid() {
    if (state.nickname.isNotEmpty &&
        state.university.isNotEmpty &&
        state.city.isNotEmpty &&
        state.district.isNotEmpty) {
      return true;
    }
    return false;
  }
}
