import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/data/models/attendance/attendance_check_update_request.dart';
import 'package:momo_flutter/data/models/attendance/attendance_response.dart';
import 'package:momo_flutter/data/models/attendance/attendance_update_request.dart';
import 'package:momo_flutter/data/repositories/schedule_repository.dart';
import 'package:momo_flutter/provider/loading_provider.dart';

final attendanceResponseStateProvider =
    StateNotifierProvider.family.autoDispose<AttendanceResponseState, List<AttendanceResponse>, int>(
  (ref, scheduleId) {
    final scheduleRepository = ref.watch(scheduleRepositoryProvider);
    final stateNotifier = AttendanceResponseState(
      scheduleId: scheduleId,
      scheduleRepository: scheduleRepository,
    );
    stateNotifier.getAttendance();
    return stateNotifier;
  },
);

class AttendanceResponseState extends StateNotifier<List<AttendanceResponse>> {
  AttendanceResponseState({
    required this.scheduleId,
    required this.scheduleRepository,
  }) : super([]);

  final ScheduleRepository scheduleRepository;
  final int scheduleId;

  Future<void> getAttendance() async {
    final response = await scheduleRepository.getAttendance(scheduleId);

    state = response;
  }

  void checkAttendance({
    required int userId,
    required bool isAttend,
  }) {
    state = [
      ...state
          .map(
            (e) => e.attendanceId == userId
                ? e.copyWith(
                    isAttend: isAttend,
                  )
                : e,
          )
          .toList(),
    ];
  }

  Future<dynamic> updateAttendance() async {
    final response = await scheduleRepository.updateAttendace(
      AttendanceCheckUpdateRequest(
        scheduleId: scheduleId,
        attendanceUpdateRequests: List.generate(
          state.length,
          (index) => AttendanceUpdateRequest(
            attendanceId: state[index].attendanceId,
            attend: state[index].isAttend,
          ),
        ),
      ),
    );

    return response;
  }
}
