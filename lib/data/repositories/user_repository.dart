import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/data/datasources/remote/retrofit/district_client.dart';
import 'package:momo_flutter/data/datasources/remote/retrofit/user_client.dart';
import 'package:momo_flutter/data/datasources/remote/retrofit_client_provider.dart';
import 'package:momo_flutter/data/models/common/district_response.dart';
import 'package:momo_flutter/data/models/user/user_response.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  final userClient = ref.watch(userClientProvider);
  final districtClient = ref.watch(districtClientProvider);
  return UserRepository(
    districtClient: districtClient,
    userClient: userClient,
  );
});

class UserRepository {
  final DistrictClient districtClient;
  final UserClient userClient;

  const UserRepository({
    required this.districtClient,
    required this.userClient,
  });

  Future<UserResponse> getUserData() {
    return userClient.getUserInfo();
  }

  Future<List<DistrictResponse>> getDistrcts(String cityCode) {
    return districtClient.getDistricts(cityCode);
  }
}
