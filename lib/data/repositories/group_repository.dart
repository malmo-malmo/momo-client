import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/app_consts.dart';
import 'package:momo_flutter/data/datasources/remote/form_data_client_provider.dart';
import 'package:momo_flutter/data/datasources/remote/retrofit/favorite_client.dart';
import 'package:momo_flutter/data/datasources/remote/retrofit/group_client.dart';
import 'package:momo_flutter/data/datasources/remote/retrofit/management_client.dart';
import 'package:momo_flutter/data/datasources/remote/retrofit_client_provider.dart';
import 'package:momo_flutter/data/models/group/group_detail_response.dart';
import 'package:momo_flutter/data/models/group/group_like_request.dart';
import 'package:momo_flutter/data/models/group/group_request.dart';
import 'package:momo_flutter/data/models/group/group_response.dart';
import 'package:momo_flutter/data/models/management/group_summary_response.dart';
import 'package:momo_flutter/data/models/management/my_group_response.dart';

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

  Future<GroupDetailResponse> createGroup(GroupRequest groupRequest) {
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
    List<String>? categories,
    List<String>? cities,
  }) {
    return groupClient.getGroupsBySearch(page, AppConsts.pageSize, categories ?? [], cities ?? []);
  }

  Future<List<GroupResponse>> getGroupsByCategories(int page, {int size = AppConsts.pageSize}) {
    return groupClient.getGroupsByCategories(page, size);
  }

  Future<List<GroupResponse>> getGroupsByLocation(int page, {int size = AppConsts.pageSize}) {
    return groupClient.getGroupsByDistrict(page, size);
  }

  Future<List<GroupResponse>> getGroupsByUniversity(int page, {int size = AppConsts.pageSize}) {
    return groupClient.getGroupsByUniversity(page, size);
  }

  Future<dynamic> participantGroup(int groupId) {
    return groupClient.participantGroup(groupId);
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
}
