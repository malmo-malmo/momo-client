import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:momo_flutter/data/models/attendance/attendance_check_update_request.dart';
import 'package:momo_flutter/data/models/attendance/attendance_response.dart';
import 'package:momo_flutter/data/models/attendance/attendance_update_request.dart';
import 'package:momo_flutter/data/repositories/schedule_repository.dart';

part 'attendance_list_provider.freezed.dart';

final attendanceResponseStateProvider =
    StateNotifierProvider.family.autoDispose<AttendanceResponseStateNotifier, AttendanceResponseState, int>(
  (ref, scheduleId) {
    final scheduleRepository = ref.watch(scheduleRepositoryProvider);
    final stateNotifier = AttendanceResponseStateNotifier(
      scheduleId: scheduleId,
      scheduleRepository: scheduleRepository,
    );
    stateNotifier.getAttendance();
    return stateNotifier;
  },
);

final isUpdateRequested = StateProvider.autoDispose<bool>((ref) => false);

class AttendanceResponseStateNotifier extends StateNotifier<AttendanceResponseState> {
  AttendanceResponseStateNotifier({
    required this.scheduleId,
    required this.scheduleRepository,
  }) : super(
          AttendanceResponseState(
            scheduleId: scheduleId,
            attendances: [],
            isLoading: false,
          ),
        );

  final ScheduleRepository scheduleRepository;
  final int scheduleId;

  Future<void> getAttendance() async {
    state = state.copyWith(isLoading: true);
    final response = await scheduleRepository.getAttendance(scheduleId);

    state = state.copyWith(
      attendances: [...response],
      isLoading: false,
    );
  }

  void checkAttendance({
    required int userId,
    required bool isAttend,
  }) {
    state = state.copyWith(
      attendances: [
        ...state.attendances
            .map(
              (e) => e.attendanceId == userId
                  ? e.copyWith(
                      isAttend: isAttend,
                    )
                  : e,
            )
            .toList(),
      ],
    );
  }

  Future<dynamic> updateAttendance() async {
    final response = await scheduleRepository.updateAttendace(
      AttendanceCheckUpdateRequest(
        scheduleId: scheduleId,
        attendanceUpdateRequests: List.generate(
          state.attendances.length,
          (index) => AttendanceUpdateRequest(
            attendanceId: state.attendances[index].attendanceId,
            attend: state.attendances[index].isAttend,
          ),
        ),
      ),
    );

    return response;
  }
}

@freezed
class AttendanceResponseState with _$AttendanceResponseState {
  factory AttendanceResponseState({
    required int scheduleId,
    required List<AttendanceResponse> attendances,
    required bool isLoading,
  }) = _AttendanceResponseState;
}
