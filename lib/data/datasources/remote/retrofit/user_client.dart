import 'package:dio/dio.dart';
import 'package:momo_flutter/app_config.dart';
import 'package:momo_flutter/data/models/common/university_response.dart';
import 'package:momo_flutter/data/models/user/user_response.dart';
import 'package:momo_flutter/data/models/user/user_update_response.dart';
import 'package:retrofit/retrofit.dart';

part 'user_client.g.dart';

@RestApi(baseUrl: AppConfig.baseUrl)
abstract class UserClient {
  factory UserClient(
    Dio dio, {
    String baseUrl,
  }) = _UserClient;

  @GET('/user')
  Future<UserResponse> getUserInfo();

  @PUT('/user')
  Future<UserUpdateResponse> updateUserInfo(
    @Query('nickname') String nickname,
    @Query('university') String university,
    @Query('city') String city,
    @Query('district') String district,
  );

  @GET('/user/duplicate-nickname')
  Future<dynamic> validateNickname(
    @Query('nickname') String nickname,
  );

  @GET('/universities')
  Future<List<UniversityResponse>> getUniversities(
    @Query('universityName') String universityName,
  );

  @PATCH('/user/delete-image')
  Future<dynamic> deleteImage();
}
