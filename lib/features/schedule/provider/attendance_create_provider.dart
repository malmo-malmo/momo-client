import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:momo_flutter/data/models/attendance/attendance_check_create_request.dart';
import 'package:momo_flutter/data/models/attendance/attendance_create_request.dart';
import 'package:momo_flutter/data/models/user/participant_user_response.dart';
import 'package:momo_flutter/data/repositories/group_repository.dart';
import 'package:momo_flutter/data/repositories/schedule_repository.dart';

part 'attendance_create_provider.freezed.dart';

final attendacneCreateStateProvider = StateNotifierProvider.family
    .autoDispose<AttendanceCreateState, AttendanceCheckCreateRequest, AttendanceProviderArg>(
  (ref, arg) {
    final scheduleRepository = ref.watch(scheduleRepositoryProvider);
    return AttendanceCreateState(
      arg: arg,
      scheduleRepository: scheduleRepository,
    );
  },
);

final attendanceUserProvider = FutureProvider.autoDispose.family<List<ParticipantUserResponse>, int>(
  (ref, groupId) {
    final groupRepository = ref.watch(groupRepositoryProvider);
    return groupRepository.getParticipantUsers(groupId);
  },
);

class AttendanceCreateState extends StateNotifier<AttendanceCheckCreateRequest> {
  AttendanceCreateState({
    required this.arg,
    required this.scheduleRepository,
  }) : super(
          AttendanceCheckCreateRequest(
            scheduleId: arg.scheduleId,
            attendanceCreateRequests: List.generate(
              arg.userIds.length,
              (index) => AttendanceCreateRequest(
                participantId: arg.userIds[index],
                attend: false,
              ),
            ),
          ),
        );

  final AttendanceProviderArg arg;
  final ScheduleRepository scheduleRepository;

  void checkAttendacne({
    required userId,
    required bool isAttend,
  }) {
    state = state.copyWith(
      attendanceCreateRequests: state.attendanceCreateRequests
          .map(
            (e) => e.participantId == userId ? e.copyWith(attend: isAttend) : e,
          )
          .toList(),
    );
  }

  Future<dynamic> createAttendance() async {
    final response = await scheduleRepository.createAttendace(state);
    return response;
  }
}

@freezed
class AttendanceProviderArg with _$AttendanceProviderArg {
  factory AttendanceProviderArg({
    required int scheduleId,
    required List<int> userIds,
  }) = _AttendanceProviderArg;
}
