import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:momo_flutter/data/models/schedule/schedule_detail_response.dart';
import 'package:momo_flutter/data/models/schedule/schedule_request.dart';
import 'package:momo_flutter/data/repositories/schedule_repository.dart';
part 'schedule_request_provider.freezed.dart';

final scheduleRequestCheckProvider = Provider.family.autoDispose<bool, int?>((ref, groupId) {
  final scheduleRequest = ref.watch(scheduleRequestStateProvider(groupId));

  if (scheduleRequest.title.isNotEmpty &&
      scheduleRequest.year != -1 &&
      scheduleRequest.month != -1 &&
      scheduleRequest.day != -1 &&
      scheduleRequest.hour != -1 &&
      scheduleRequest.minute != -1 &&
      scheduleRequest.groupId != -1 &&
      scheduleRequest.contents.isNotEmpty) {
    return true;
  }
  return false;
});

final scheduleRequestStateProvider =
    StateNotifierProvider.family.autoDispose<ScheduleRequestStateNotifier, ScheduleRequestState, int?>(
  (ref, groupId) {
    final scheduleRepositrory = ref.watch(scheduleRepositoryProvider);

    return ScheduleRequestStateNotifier(
      scheduleRepository: scheduleRepositrory,
      groupId: groupId,
    );
  },
);

class ScheduleRequestStateNotifier extends StateNotifier<ScheduleRequestState> {
  ScheduleRequestStateNotifier({
    required this.scheduleRepository,
    int? groupId,
  }) : super(
          ScheduleRequestState(
            groupId: groupId ?? -1,
            contents: '',
            isOffline: false,
            title: '',
            day: -1,
            hour: -1,
            minute: -1,
            month: -1,
            year: -1,
          ),
        );

  final ScheduleRepository scheduleRepository;

  void setGroupId(int groupId) => state = state.copyWith(groupId: groupId);

  void setTitle(String title) => state = state.copyWith(title: title);

  void setOnOff(bool isOffline) => state = state.copyWith(isOffline: isOffline);

  void setDate(DateTime dateTime) => state = state.copyWith(
        year: dateTime.year,
        month: dateTime.month,
        day: dateTime.day,
      );

  void setTime(int hour, int minute) => state = state.copyWith(hour: hour, minute: minute);

  void setContents(String contents) => state = state.copyWith(contents: contents);

  Future<ScheduleDetailResponse> createSchedule() async {
    final response = await scheduleRepository.createSchedule(
      ScheduleRequest(
        groupId: state.groupId,
        title: state.title,
        isOffline: state.isOffline,
        startDateTime: DateTime(
          state.year,
          state.month,
          state.day,
          state.hour,
          state.minute,
        ).toIso8601String(),
        contents: state.contents,
      ),
    );
    return response;
  }
}

@freezed
class ScheduleRequestState with _$ScheduleRequestState {
  factory ScheduleRequestState({
    required int groupId,
    required String title,
    required String contents,
    required bool isOffline,
    required int year,
    required int month,
    required int day,
    required int hour,
    required int minute,
  }) = _ScheduleRequestState;
}
