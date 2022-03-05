import 'package:dio/dio.dart';
import 'package:momo_flutter/app_config.dart';
import 'package:momo_flutter/data/models/common/code_name_pair.dart';
import 'package:momo_flutter/data/models/group/group_detail_response.dart';
import 'package:momo_flutter/data/models/group/group_response.dart';
import 'package:momo_flutter/data/models/user/participant_user_response.dart';
import 'package:retrofit/retrofit.dart';

part 'group_client.g.dart';

@RestApi(baseUrl: AppConfig.baseUrl)
abstract class GroupClient {
  factory GroupClient(
    Dio dio, {
    String baseUrl,
  }) = _GroupClient;

  @GET('/group/{groupId}')
  Future<GroupDetailResponse> getGroupDetail(@Path() int groupId);

  @GET('/group/categories')
  Future<List<CodeNamePair>> getGroupCategories();

  @GET('/groups/search/paging')
  Future<List<GroupResponse>> getGroupsBySearch(
    @Query('page') int page,
    @Query('size') int size,
    @Query('categories') List<String> categories,
    @Query('cities') List<String> cities,
  );

  @GET('/groups/user-categories/paging')
  Future<List<GroupResponse>> getGroupsByCategories(
    @Query('page') int page,
    @Query('size') int size,
  );

  @GET('/groups/user-district/paging')
  Future<List<GroupResponse>> getGroupsByDistrict(
    @Query('page') int page,
    @Query('size') int size,
  );

  @GET('/groups/user-university/paging')
  Future<List<GroupResponse>> getGroupsByUniversity(
    @Query('page') int page,
    @Query('size') int size,
  );

  @POST('/group/apply-participant')
  Future<dynamic> participantGroup(@Body() int groupId);

  @DELETE('/group/{groupId}/participant')
  Future<dynamic> withdrawalGroup(@Path() int groupId);

  @GET('/group/participants')
  Future<List<ParticipantUserResponse>> getParticipantUsers(
      @Query('groupId') int groupId);

  @PATCH('/group/{id}/end')
  Future<dynamic> endGroup(
    @Path() int id,
  );

  @PATCH('/group/{id}/manager/{userId}')
  Future<dynamic> managerGroup(
    @Path() int id,
    @Path() int userId,
  );
}
