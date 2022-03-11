import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/data/datasources/remote/form_data_client_provider.dart';
import 'package:momo_flutter/data/datasources/remote/retrofit/district_client.dart';
import 'package:momo_flutter/data/datasources/remote/retrofit/favorite_client.dart';
import 'package:momo_flutter/data/datasources/remote/retrofit/management_client.dart';
import 'package:momo_flutter/data/datasources/remote/retrofit/user_client.dart';
import 'package:momo_flutter/data/datasources/remote/retrofit_client_provider.dart';
import 'package:momo_flutter/data/models/common/category_request.dart';
import 'package:momo_flutter/data/models/common/count_response.dart';
import 'package:momo_flutter/data/models/common/district_response.dart';
import 'package:momo_flutter/data/models/common/university_response.dart';
import 'package:momo_flutter/data/models/user/user_response.dart';
import 'package:momo_flutter/data/models/user/user_update_request.dart';
import 'package:momo_flutter/data/models/user/user_update_response.dart';

final userRepositoryProvider = Provider<UserRepository>(
  (ref) {
    final userClient = ref.watch(userClientProvider);
    final districtClient = ref.watch(districtClientProvider);
    final favoriteClient = ref.watch(favoriteClientProvider);
    final formDataClient = ref.watch(formDataClientProvider);
    final managementClient = ref.watch(managementClientProvider);

    return UserRepository(
      districtClient: districtClient,
      userClient: userClient,
      favoriteClient: favoriteClient,
      formDataClient: formDataClient,
      managementClient: managementClient,
    );
  },
);

class UserRepository {
  final DistrictClient districtClient;
  final UserClient userClient;
  final FavoriteClient favoriteClient;
  final FormDataClient formDataClient;
  final ManagementClient managementClient;

  const UserRepository({
    required this.districtClient,
    required this.userClient,
    required this.favoriteClient,
    required this.formDataClient,
    required this.managementClient,
  });

  Future<UserResponse> getUserData() {
    return userClient.getUserInfo();
  }

  Future<dynamic> validateNickname(String nickname) {
    return userClient.validateNickname(nickname);
  }

  Future<List<DistrictResponse>> getDistrcts(String cityCode) {
    return districtClient.getDistricts(cityCode);
  }

  Future<dynamic> updateCategory(CategoryRequest categoryRequest) {
    return favoriteClient.updateCategory(categoryRequest);
  }

  Future<List<UniversityResponse>> getUniversities(String universityName) {
    return userClient.getUniversities(universityName);
  }

  Future<UserUpdateResponse> updateUserData(UserUpdateRequest updateRequest) {
    if (updateRequest.imagePath.isEmpty) {
      return userClient.updateUserInfo(
        updateRequest.nickname,
        updateRequest.university,
        updateRequest.city,
        updateRequest.district,
      );
    }
    return formDataClient.updateUserInfo(updateRequest);
  }

  Future<CountResponse> getFavoriteGroupCount() {
    return favoriteClient.getFavoriteGroupCount();
  }

  Future<CountResponse> getTotalGroupCount() {
    return managementClient.getParticipationGroupCount();
  }
}
