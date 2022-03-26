import 'package:dio/dio.dart';
import 'package:momo_flutter/app_config.dart';
import 'package:momo_flutter/data/models/post/post_detail_response.dart';
import 'package:momo_flutter/data/models/post/post_response.dart';
import 'package:retrofit/retrofit.dart';

part 'post_client.g.dart';

@RestApi(baseUrl: AppConfig.baseUrl)
abstract class PostClient {
  factory PostClient(
    Dio dio, {
    String baseUrl,
  }) = _PostClient;

  @GET('/post/{postId}')
  Future<PostDetailResponse> getPostDetail(
    @Path() int postId,
  );

  @GET('/posts/paging')
  Future<List<PostResponse>> getPosts(
    @Query('groupId') int groupId,
    @Query('lastPostId') int? lastPostId,
    @Query('size') int size,
    @Query('postType') String type,
  );

  @DELETE('/post/{id}')
  Future<dynamic> deletePost(
    @Path() int id,
  );
}
