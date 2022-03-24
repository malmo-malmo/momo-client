import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/data/models/attendance/attendance_response.dart';
import 'package:momo_flutter/features/schedule/provider/attendance_create_provider.dart';
import 'package:momo_flutter/features/schedule/provider/attendance_list_provider.dart';
import 'package:momo_flutter/features/schedule/widgets/attendance_card.dart';
import 'package:momo_flutter/provider/loading_provider.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/widgets/button/action_button.dart';
import 'package:momo_flutter/widgets/card/error_card.dart';
import 'package:momo_flutter/widgets/dialog/confirm_dialog.dart';
import 'package:momo_flutter/widgets/dialog/question_dialog.dart';
import 'package:momo_flutter/widgets/indicator/custom_loader.dart';
import 'package:momo_flutter/widgets/indicator/loading_indicator.dart';

class AttendanceListPageArg {
  final int groupId;
  final int scheduleId;
  final bool isCheck;

  AttendanceListPageArg({
    required this.groupId,
    required this.scheduleId,
    required this.isCheck,
  });
}

class AttendanceListPage extends ConsumerWidget {
  const AttendanceListPage(this.arg, {Key? key}) : super(key: key);

  static const routeName = 'AttendanceListPage';

  final AttendanceListPageArg arg;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (arg.isCheck) {
      final attendanceResponse = ref.watch(attendanceResponseStateProvider(arg.scheduleId));
      final isUpdateRequest = ref.watch(isUpdateRequested);

      return SafeArea(
        child: Stack(
          children: [
            Scaffold(
              backgroundColor: AppColors.gray1,
              appBar: AppBar(
                backgroundColor: AppColors.backgroundWhite,
                leading: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(CupertinoIcons.xmark),
                ),
                actions: [
                  ActionButton(
                    buttonTitle: !isUpdateRequest ? AppStrings.edit : AppStrings.complete,
                    isEnable: true,
                    onPressed: !isUpdateRequest
                        ? () => ref.read(isUpdateRequested.state).state = true
                        : () async {
                            final result = await showDialog<bool?>(
                              context: context,
                              builder: (_) => const QuestionDialog(
                                dialogText: '이미 출석체크를 완료했어요.\n수정하시겠어요?',
                                yesText: '수정하기',
                              ),
                            );
                            if (result != null && result) {
                              ref.read(loadingProvider.state).state = true;
                              await ref
                                  .read(attendanceResponseStateProvider(arg.scheduleId).notifier)
                                  .updateAttendance();
                              ref.read(loadingProvider.state).state = false;
                              Navigator.pop(context, true);
                            }
                          },
                  ),
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30, right: 24, left: 24, bottom: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('닉네임', style: AppStyles.bold16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                Text('출석', style: AppStyles.bold16),
                                SizedBox(width: 27),
                                Text('결석', style: AppStyles.bold16),
                              ],
                            ),
                          ],
                        ),
                      ),
                      attendanceResponse.isLoading
                          ? const Padding(
                              padding: EdgeInsets.only(top: 40),
                              child: LoadingIndicator(),
                            )
                          : Material(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              elevation: 2,
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                width: double.infinity,
                                height: 32 + 72.0 * attendanceResponse.attendances.length,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColors.backgroundWhite,
                                ),
                                child: ListView.builder(
                                  itemCount: attendanceResponse.attendances.length,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) => AttendanceCard(
                                    attendanceResponse.attendances[index],
                                    onSelect: ({
                                      required bool isAttend,
                                      required int userId,
                                    }) {
                                      if (isUpdateRequest) {
                                        ref
                                            .read(attendanceResponseStateProvider(arg.scheduleId).notifier)
                                            .checkAttendance(
                                              isAttend: isAttend,
                                              userId: userId,
                                            );
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ),
            ...customLoader,
          ],
        ),
      );
    } else {
      final memeberResponse = ref.watch(attendanceUserProvider(arg.groupId));

      return SafeArea(
        child: memeberResponse.when(
          error: (error, stackTrace) => const Scaffold(body: ErrorCard()),
          loading: () => const Scaffold(body: LoadingIndicator()),
          data: (users) {
            final attendacneCheckState = ref.watch(
              attendacneCreateStateProvider(
                AttendanceProviderArg(
                  scheduleId: arg.scheduleId,
                  userIds: users.map((e) => e.participantId).toList(),
                ),
              ),
            );

            return Stack(
              children: [
                Scaffold(
                  backgroundColor: AppColors.gray1,
                  appBar: AppBar(
                    backgroundColor: AppColors.backgroundWhite,
                    leading: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(CupertinoIcons.xmark),
                    ),
                    actions: [
                      ActionButton(
                        buttonTitle: AppStrings.complete,
                        isEnable: true,
                        onPressed: () async {
                          ref.read(loadingProvider.state).state = true;
                          await ref
                              .read(attendacneCreateStateProvider(
                                AttendanceProviderArg(
                                  scheduleId: arg.scheduleId,
                                  userIds: users.map((e) => e.participantId).toList(),
                                ),
                              ).notifier)
                              .createAttendance();
                          ref.read(loadingProvider.state).state = false;
                          await showDialog(
                            context: context,
                            builder: (_) => const ConfirmDialog('출석체크를 완료했어요'),
                          );
                          Navigator.pop(context, true);
                        },
                      ),
                    ],
                  ),
                  body: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 30, right: 24, left: 24, bottom: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(AppStrings.nickname, style: AppStyles.bold16),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const [
                                    Text('출석', style: AppStyles.bold16),
                                    SizedBox(width: 27),
                                    Text('결석', style: AppStyles.bold16),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Material(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            elevation: 1,
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              width: double.infinity,
                              height: 32 + 72.0 * users.length,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.backgroundWhite,
                              ),
                              child: ListView.builder(
                                itemCount: users.length,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) => AttendanceCard(
                                  AttendanceResponse(
                                    attendanceId: attendacneCheckState.attendanceCreateRequests[index].participantId,
                                    isAttend: attendacneCheckState.attendanceCreateRequests[index].attend,
                                    nickname: users[index].nickname,
                                    imageUrl: users[index].imageUrl,
                                    attendanceRate: users[index].attendanceRate,
                                  ),
                                  onSelect: ref
                                      .read(attendacneCreateStateProvider(AttendanceProviderArg(
                                        scheduleId: arg.scheduleId,
                                        userIds: users.map((e) => e.participantId).toList(),
                                      )).notifier)
                                      .checkAttendacne,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ...customLoader,
              ],
            );
          },
        ),
      );
    }
  }
}
