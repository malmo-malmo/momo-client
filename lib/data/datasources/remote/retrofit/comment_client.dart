import 'package:dio/dio.dart';
import 'package:momo_flutter/app_config.dart';
import 'package:momo_flutter/data/models/comment/comment.dart';
import 'package:momo_flutter/data/models/comment/comment_request.dart';
import 'package:momo_flutter/data/models/comment/comment_response.dart';
import 'package:retrofit/retrofit.dart';

part 'comment_client.g.dart';

@RestApi(baseUrl: AppConfig.baseUrl)
abstract class CommentClient {
  factory CommentClient(
    Dio dio, {
    String baseUrl,
  }) = _CommentClient;

  @POST('/comment')
  Future<Comment> createComment(@Body() CommentRequest commentRequest);

  @GET('/comments/paging')
  Future<CommentResponse> getComments(
    @Query('lastCommentId') int? lastCommentId,
    @Query('postId') int postId,
    @Query('size') int size,
  );
}
