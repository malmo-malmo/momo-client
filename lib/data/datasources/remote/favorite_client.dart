import 'package:dio/dio.dart';
import 'package:momo_flutter/app_config.dart';
import 'package:momo_flutter/data/models/common/category_request.dart';
import 'package:momo_flutter/data/models/common/count_response.dart';
import 'package:momo_flutter/data/models/group/group_like_request.dart';
import 'package:momo_flutter/data/models/group/wish_group_response.dart';
import 'package:retrofit/retrofit.dart';

part 'favorite_client.g.dart';

@RestApi(baseUrl: AppConfig.baseUrl)
abstract class FavoriteClient {
  factory FavoriteClient(
    Dio dio, {
    String baseUrl,
  }) = _FavoriteClient;

  @PATCH('/favorite/categories')
  Future<dynamic> updateCategory(
    @Body() CategoryRequest categoryRequest,
  );

  @GET('/favorite/groups')
  Future<List<WishGroupResponse>> getFavoriteGroups();

  @POST('/favorite/group')
  Future<dynamic> createGroupLike(
    @Body() GroupLikeRequest groupLikeRequest,
  );

  @GET('/favorite/group/count')
  Future<CountResponse> getFavoriteGroupCount();

  @DELETE('/favorite/group/{groupId}')
  Future<dynamic> deleteGroupLike(
    @Path() int groupId,
  );
}
