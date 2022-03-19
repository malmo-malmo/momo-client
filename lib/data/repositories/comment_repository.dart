import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/app_consts.dart';
import 'package:momo_flutter/data/datasources/remote/retrofit/comment_client.dart';
import 'package:momo_flutter/data/datasources/remote/retrofit_client_provider.dart';
import 'package:momo_flutter/data/models/comment/comment.dart';
import 'package:momo_flutter/data/models/comment/comment_request.dart';
import 'package:momo_flutter/data/models/comment/comment_response.dart';

final commentRepositoryProvider = Provider<CommentRepository>(
  (ref) {
    final commentClient = ref.watch(commentClientProvider);
    return CommentRepository(commentClient: commentClient);
  },
);

class CommentRepository {
  final CommentClient commentClient;

  const CommentRepository({
    required this.commentClient,
  });

  Future<CommentResponse> getComments({
    required int page,
    required int postId,
  }) {
    return commentClient.getComments(page, postId, AppConsts.pageSize);
  }

  Future<Comment> createComment(CommentRequest commentRequest) {
    return commentClient.createComment(commentRequest);
  }
}
