import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:momo_flutter/app_config.dart';
import 'package:momo_flutter/data/models/group/group_request.dart';
import 'package:momo_flutter/data/models/management/my_group_response.dart';
import 'package:momo_flutter/data/repositories/group_repository.dart';

final groupRequestCheckProvider = Provider.autoDispose<bool>((ref) {
  final groupRequest = ref.watch(groupRequestStateProvider);

  if (groupRequest.name.isNotEmpty &&
      groupRequest.category.isNotEmpty &&
      groupRequest.city.isNotEmpty &&
      groupRequest.district.isNotEmpty &&
      groupRequest.imagePath.isNotEmpty &&
      groupRequest.city.isNotEmpty &&
      groupRequest.introduction.isNotEmpty &&
      groupRequest.startDate.isNotEmpty &&
      groupRequest.recruitmentCnt != 0) {
    return true;
  }
  return false;
});

final groupRequestStateProvider =
    StateNotifierProvider.autoDispose<GroupRequestState, GroupRequest>(
  (ref) {
    final groupRepository = ref.watch(groupRepositoryProvider);
    return GroupRequestState(groupRepository: groupRepository);
  },
);

class GroupRequestState extends StateNotifier<GroupRequest> {
  GroupRequestState({
    required this.groupRepository,
  }) : super(
          GroupRequest(
            name: '',
            category: '',
            city: '',
            district: '',
            imagePath: '',
            introduction: '',
            recruitmentCnt: 0,
            startDate: '',
            university: null,
            isOffline: true,
          ),
        );

  final GroupRepository groupRepository;
  void setGroupName(String name) => state = state.copyWith(name: name);

  void setGroupCategory(int index) => state = state.copyWith(
        category: AppConfig.categoryCodeNamePair[index].code,
      );

  void setCity(String city) => state = state.copyWith(
        city: AppConfig.locationCodeNamePair.where((element) => element.name == city).first.code,
        district: '',
      );

  String get groupCity => state.city.isEmpty
      ? ''
      : AppConfig.locationCodeNamePair.where((element) => element.code == state.city).first.name;

  void setOnOff(bool isOffline) => state = state.copyWith(isOffline: isOffline);

  void setRecruitmentCnt(String recruitmentCnt) =>
      state = state.copyWith(recruitmentCnt: int.parse(recruitmentCnt));

  void setStartDate(DateTime dateTime) =>
      state = state.copyWith(startDate: DateFormat('yyyy-MM-dd').format(dateTime));

  void setIntroduction(String introduction) => state = state.copyWith(introduction: introduction);

  void setUniversity(String university) => state = state.copyWith(university: university);

  void setDistrict(String district) => state = state.copyWith(district: district);

  void setImageUrl(String imageUrl) => state = state.copyWith(imagePath: imageUrl);

  Future<MyGroupResponse> createGroup() async {
    final response = await groupRepository.createGroup(state);
    final createdGroup = MyGroupResponse(
      id: response.id,
      imageUrl: response.imageUrl,
      achievementRate: 0,
      name: state.name,
    );
    return createdGroup;
  }
}
