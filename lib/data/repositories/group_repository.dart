import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/app_consts.dart';
import 'package:momo_flutter/data/datasources/remote/form_data_client_provider.dart';
import 'package:momo_flutter/data/datasources/remote/retrofit/favorite_client.dart';
import 'package:momo_flutter/data/datasources/remote/retrofit/group_client.dart';
import 'package:momo_flutter/data/datasources/remote/retrofit/management_client.dart';
import 'package:momo_flutter/data/datasources/remote/retrofit_client_provider.dart';
import 'package:momo_flutter/data/models/common/image_url_response.dart';
import 'package:momo_flutter/data/models/group/group_create_response.dart';
import 'package:momo_flutter/data/models/group/group_detail_response.dart';
import 'package:momo_flutter/data/models/group/group_like_request.dart';
import 'package:momo_flutter/data/models/group/group_request.dart';
import 'package:momo_flutter/data/models/group/group_response.dart';
import 'package:momo_flutter/data/models/group/wish_group_response.dart';
import 'package:momo_flutter/data/models/management/group_summary_response.dart';
import 'package:momo_flutter/data/models/management/my_group_response.dart';
import 'package:momo_flutter/data/models/management/participation_group_response.dart';
import 'package:momo_flutter/data/models/user/participant_user_response.dart';

final groupRepositoryProvider = Provider<GroupRepository>((ref) {
  final groupClient = ref.watch(groupClientProvider);
  final formDataClient = ref.watch(formDataClientProvider);
  final managementClient = ref.watch(managementClientProvider);
  final favoriteClient = ref.watch(favoriteClientProvider);

  return GroupRepository(
    groupClient: groupClient,
    formDataClient: formDataClient,
    managementClient: managementClient,
    favoriteClient: favoriteClient,
  );
});

class GroupRepository {
  final GroupClient groupClient;
  final FormDataClient formDataClient;
  final ManagementClient managementClient;
  final FavoriteClient favoriteClient;

  GroupRepository({
    required this.groupClient,
    required this.formDataClient,
    required this.managementClient,
    required this.favoriteClient,
  });

  Future<GroupDetailResponse> getGroupDetail(int groupId) {
    return groupClient.getGroupDetail(groupId);
  }

  Future<List<MyGroupResponse>> getMyGroups() {
    return managementClient.getMyGroupDetail();
  }

  Future<List<GroupSummaryReseponse>> getParticipationGroups() {
    return managementClient.getParticipationGroupSummary();
  }

  Future<GroupCreateResponse> createGroup(GroupRequest groupRequest) {
    return formDataClient.createGroup(groupRequest);
  }

  Future<dynamic> createGroupLike(int groupId) {
    return favoriteClient.createGroupLike(GroupLikeRequest(groupId: groupId));
  }

  Future<dynamic> deleteGroupLike(int groupId) {
    return favoriteClient.deleteGroupLike(groupId);
  }

  Future<List<GroupResponse>> getGroupsBySearch(
    int page, {
    String? groupName,
    List<String>? categories,
    List<String>? cities,
  }) {
    return groupClient.getGroupsBySearch(
      groupName,
      page,
      AppConsts.pageSize,
      categories ?? [],
      cities ?? [],
    );
  }

  Future<List<GroupResponse>> getGroupsByCategories(
      {int? lastGroupId, int size = AppConsts.pageSize}) {
    return groupClient.getGroupsByCategories(lastGroupId, size);
  }

  Future<List<GroupResponse>> getGroupsByLocation(
      {int? lastGroupId, int size = AppConsts.pageSize}) {
    return groupClient.getGroupsByDistrict(lastGroupId, size);
  }

  Future<List<GroupResponse>> getGroupsByUniversity(
      {int? lastGroupId, int size = AppConsts.pageSize}) {
    return groupClient.getGroupsByUniversity(lastGroupId, size);
  }

  Future<dynamic> participantGroup(int groupId) {
    return groupClient.participantGroup(groupId);
  }

  Future<dynamic> withdrawalGroup(int groupId) {
    return groupClient.withdrawalGroup(groupId);
  }

  Future<dynamic> endGropu(int id) {
    return groupClient.endGroup(id);
  }

  Future<dynamic> managerGroup({
    required int id,
    required int userId,
  }) {
    return groupClient.managerGroup(id, userId);
  }

  Future<List<ParticipantUserResponse>> getParticipantUsers(int groupId) {
    return groupClient.getParticipantUsers(groupId);
  }

  Future<List<WishGroupResponse>> getFavoriteGroups() {
    return favoriteClient.getFavoriteGroups();
  }

  Future<List<ParticipationGroupResponse>> getParticipantGroups() {
    return managementClient.getParticipationGroupDetail();
  }

  Future<ImageUrlResponse> updateImage({
    required int groupId,
    required String imagePath,
  }) {
    return formDataClient.updateGroupImage(groupId: groupId, imagePath: imagePath);
  }
}
