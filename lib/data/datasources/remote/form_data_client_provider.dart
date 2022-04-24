import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/app_config.dart';
import 'package:momo_flutter/data/datasources/remote/dio_provider.dart';
import 'package:momo_flutter/data/models/common/image_url_response.dart';
import 'package:momo_flutter/data/models/group/group_create_response.dart';
import 'package:momo_flutter/data/models/group/group_request.dart';
import 'package:momo_flutter/data/models/post/post_detail_response.dart';
import 'package:momo_flutter/data/models/post/post_request.dart';

final formDataClientProvider = Provider<FormDataClient>((ref) {
  final dio = ref.watch(dioProvider);
  return FormDataClient(dio);
});

class FormDataClient {
  final Dio dio;

  FormDataClient(this.dio);

  Future<GroupCreateResponse> createGroup(GroupRequest groupRequest) async {
    final response = await dio.post(
      AppConfig.baseUrl + '/group',
      data: FormData.fromMap(
        {
          'name': groupRequest.name,
          'category': groupRequest.category,
          'university': groupRequest.university,
          'city': groupRequest.city,
          'district': groupRequest.district,
          'startDate': groupRequest.startDate,
          'recruitmentCnt': groupRequest.recruitmentCnt,
          'introduction': groupRequest.introduction,
          'isOffline': groupRequest.isOffline,
          'image': await MultipartFile.fromFile(groupRequest.imagePath),
        },
      ),
    );

    return GroupCreateResponse.fromJson(response.data);
  }

  Future<PostDetailResponse> createPost(PostRequest postRequest) async {
    final formData = FormData.fromMap({
      'groupId': postRequest.groupId,
      'title': postRequest.title,
      'contents': postRequest.contents,
      'postType': postRequest.postType.name,
    });

    formData.files.addAll(
      postRequest.images
          .map(
            (e) => MapEntry(
              'images',
              MultipartFile.fromFileSync(e),
            ),
          )
          .toList(),
    );

    final response = await dio.post(
      AppConfig.baseUrl + '/post',
      data: formData,
    );

    return PostDetailResponse.fromJson(response.data);
  }

  Future<ImageUrlResponse> updateProfileImage(String imagePath) async {
    final response = await dio.patch(
      AppConfig.baseUrl + '/user/update-image',
      data: FormData.fromMap(
        {'imageFile': await MultipartFile.fromFile(imagePath)},
      ),
    );

    return ImageUrlResponse.fromJson(response.data);
  }

  Future<ImageUrlResponse> updateGroupImage({
    required int groupId,
    required String imagePath,
  }) async {
    final response = await dio.post(
      AppConfig.baseUrl + '/group/{groupId}/update-image',
      data: FormData.fromMap(
        {'imageFile': await MultipartFile.fromFile(imagePath)},
      ),
      queryParameters: {'gropuId': groupId},
    );

    return ImageUrlResponse.fromJson(response.data);
  }
}
