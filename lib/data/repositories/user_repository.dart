import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/data/datasources/remote/retrofit/district_client.dart';
import 'package:momo_flutter/data/datasources/remote/retrofit/favorite_client.dart';
import 'package:momo_flutter/data/datasources/remote/retrofit/user_client.dart';
import 'package:momo_flutter/data/datasources/remote/retrofit_client_provider.dart';
import 'package:momo_flutter/data/models/common/category_request.dart';
import 'package:momo_flutter/data/models/common/district_response.dart';
import 'package:momo_flutter/data/models/user/user_response.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  final userClient = ref.watch(userClientProvider);
  final districtClient = ref.watch(districtClientProvider);
  final favoriteClient = ref.watch(favoriteClientProvider);
  return UserRepository(
    districtClient: districtClient,
    userClient: userClient,
    favoriteClient: favoriteClient,
  );
});

class UserRepository {
  final DistrictClient districtClient;
  final UserClient userClient;
  final FavoriteClient favoriteClient;

  const UserRepository({
    required this.districtClient,
    required this.userClient,
    required this.favoriteClient,
  });

  Future<UserResponse> getUserData() {
    return userClient.getUserInfo();
  }

  Future<List<DistrictResponse>> getDistrcts(String cityCode) {
    return districtClient.getDistricts(cityCode);
  }

  Future<dynamic> updateCategory(CategoryRequest categoryRequest) {
    return favoriteClient.updateCategory(categoryRequest);
  }
}
