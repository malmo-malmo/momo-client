import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/data/datasources/remote/form_data_client_provider.dart';
import 'package:momo_flutter/data/datasources/remote/retrofit/favorite_client.dart';
import 'package:momo_flutter/data/datasources/remote/retrofit/group_client.dart';
import 'package:momo_flutter/data/datasources/remote/retrofit/management_client.dart';
import 'package:momo_flutter/data/datasources/remote/retrofit_client_provider.dart';
import 'package:momo_flutter/data/models/group/group_detail_response.dart';
import 'package:momo_flutter/data/models/group/group_request.dart';
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

  Future<List<MyGroupResponse>> getMyGroups() {
    return managementClient.getMyGroupDetail();
  }

  Future<List<GroupSummaryReseponse>> getParticipationGroups() {
    return managementClient.getParticipationGroupSummary();
  }

  Future<GroupDetailResponse> createGroup(GroupRequest groupRequest) {
    return formDataClient.createGroup(groupRequest);
  }
}
