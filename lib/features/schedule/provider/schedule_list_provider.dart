import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:momo_flutter/app_consts.dart';
import 'package:momo_flutter/data/models/schedule/schedule_detail_response.dart';
import 'package:momo_flutter/data/repositories/schedule_repository.dart';

part 'schedule_list_provider.freezed.dart';

final scheduleDetailListProvider =
    StateNotifierProvider.autoDispose.family<ScheduleListStateNotifier, ScheduleListState, int>(
  (ref, groupId) {
    final scheduleRepository = ref.watch(scheduleRepositoryProvider);
    return ScheduleListStateNotifier(
      groupId: groupId,
      scheduleRepository: scheduleRepository,
    );
  },
);

class ScheduleListStateNotifier extends StateNotifier<ScheduleListState> {
  ScheduleListStateNotifier({
    required this.groupId,
    required this.scheduleRepository,
  }) : super(
          ScheduleListState(
            schedules: [],
            manageId: -1,
          ),
        );

  final ScheduleRepository scheduleRepository;
  final int groupId;

  Future<void> getSchedules(int page) async {
    try {
      final response = await scheduleRepository.getSchedules(
        lastScheduleStartDateTime: state.nextPage,
        groupId: groupId,
      );
      state = state.copyWith(
        manageId: response.managerId,
        schedules: [...state.schedules, ...response.groupScheduleResponses],
        nextPage: response.groupScheduleResponses.length == AppConsts.pageSize
            ? response.groupScheduleResponses.last.startDateTime
            : null,
      );
    } catch (e) {
      state = state.copyWith(error: e);
    }
  }

  void attendanceCallback(int index) {
    var cur = state.schedules;
    cur[index] = cur[index].copyWith(attendanceCheck: true);
    state = state.copyWith(schedules: [...cur]);
  }
}

@freezed
class ScheduleListState with _$ScheduleListState {
  factory ScheduleListState({
    required List<ScheduleDetailResponse> schedules,
    required int manageId,
    String? nextPage,
    dynamic error,
  }) = _ScheduleListState;
}
