import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/app_consts.dart';
import 'package:momo_flutter/data/datasources/remote/form_data_client_provider.dart';
import 'package:momo_flutter/data/datasources/remote/retrofit/management_client.dart';
import 'package:momo_flutter/data/datasources/remote/retrofit/post_client.dart';
import 'package:momo_flutter/data/datasources/remote/retrofit_client_provider.dart';
import 'package:momo_flutter/data/models/enum/post_type.dart';
import 'package:momo_flutter/data/models/management/management_post_response.dart';
import 'package:momo_flutter/data/models/post/post_detail_response.dart';
import 'package:momo_flutter/data/models/post/post_request.dart';
import 'package:momo_flutter/data/models/post/post_response.dart';

final postRepositoryProvider = Provider<PostRepository>((ref) {
  final postClient = ref.watch(postClientProvider);
  final formDataClient = ref.watch(formDataClientProvider);
  final managementClient = ref.watch(managementClientProvider);

  return PostRepository(
    postClient: postClient,
    formDataClient: formDataClient,
    managementClient: managementClient,
  );
});

class PostRepository {
  final PostClient postClient;
  final ManagementClient managementClient;
  final FormDataClient formDataClient;

  const PostRepository({
    required this.postClient,
    required this.formDataClient,
    required this.managementClient,
  });

  Future<List<ManagementPostResponse>> getManagementPosts(int page) {
    return managementClient.getManagementPosts(page, AppConsts.pageSize);
  }

  Future<List<PostResponse>> getPosts({
    required int groupId,
    required int page,
    required PostType type,
  }) {
    return postClient.getPosts(groupId, page, AppConsts.pageSize, type.name);
  }

  Future<PostDetailResponse> getPostDetail(int postId) {
    return postClient.getPostDetail(postId);
  }

  Future<PostDetailResponse> createPost(PostRequest postRequest) {
    return formDataClient.createPost(postRequest);
  }
}
