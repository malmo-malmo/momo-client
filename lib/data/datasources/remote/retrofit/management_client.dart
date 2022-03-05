import 'package:dio/dio.dart';
import 'package:momo_flutter/app_config.dart';
import 'package:momo_flutter/data/models/common/count_response.dart';
import 'package:momo_flutter/data/models/management/group_summary_response.dart';
import 'package:momo_flutter/data/models/management/management_post_response.dart';
import 'package:momo_flutter/data/models/management/my_group_response.dart';
import 'package:momo_flutter/data/models/management/participation_group_response.dart';

import 'package:retrofit/retrofit.dart';

part 'management_client.g.dart';

@RestApi(baseUrl: AppConfig.baseUrl)
abstract class ManagementClient {
  factory ManagementClient(
    Dio dio, {
    String baseUrl,
  }) = _ManagementClient;

  @GET('/management/participation-group/count')
  Future<CountResponse> getParticipationGroupCount();

  @GET('/management/participation-groups/details')
  Future<List<ParticipationGroupResponse>> getParticipationGroupDetail();

  @GET('/management/my-posts')
  Future<List<ManagementPostResponse>> getManagementPosts(
    @Query('page') int page,
    @Query('size') int size,
  );

  @GET('/management/participation-groups/summary')
  Future<List<GroupSummaryReseponse>> getParticipationGroupSummary();

  @GET('/management/my-groups/details')
  Future<List<MyGroupResponse>> getMyGroupDetail();

  @GET('/management/my-groups/summary')
  Future<List<MyGroupResponse>> getMyGroupSummary();
}
