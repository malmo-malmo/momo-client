import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/features/schedule/provider/attendance_list_provider.dart';
import 'package:momo_flutter/features/schedule/widgets/attendance_card.dart';
import 'package:momo_flutter/provider/loading_provider.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/widgets/card/empty_item_card.dart';
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
    // if (arg.isCheck) {
    final attendanceResponse = ref.watch(attendanceResponseStateProvider(arg.scheduleId));

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.gray1,
        appBar: AppBar(),
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
                Material(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  elevation: 2,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    width: double.infinity,
                    height: 32 + 72.0 * attendanceResponse.length,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListView.builder(
                      itemCount: attendanceResponse.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => AttendanceCard(
                        attendanceResponse[index],
                        onSelect: ref.read(attendanceResponseStateProvider(arg.scheduleId).notifier).checkAttendance,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    // } else {
    //   final memeberResponse = ref.watch(participantUsersProvider(groupId));

    //   return SafeArea(
    //     child: memeberResponse.when(
    //       error: (error, stackTrace) => const Scaffold(body: ErrorCard()),
    //       loading: () => const Scaffold(body: LoadingCard()),
    //       data: (data) {
    //         final attendacneCheckState = ref.watch(
    //           attendacneCreateStateProvider(
    //             AttendanceProviderArg(
    //               scheduleId: scheduleId,
    //               userIds: data.map((e) => e.participantId).toList(),
    //             ),
    //           ),
    //         );

    //         return Scaffold(
    //           backgroundColor: MomoColor.backgroundColor,
    //           appBar: CustomAppBar(
    //             leadingIcon: CupertinoIcons.xmark,
    //             isAction: true,
    //             actionWidget: ConfirmActionIcon(
    //               check: true,
    //               title: isCheck ? '수정' : '완료',
    //               onTapIcon: () async {
    //                 await ref
    //                     .read(attendacneCreateStateProvider(AttendanceProviderArg(
    //                       scheduleId: scheduleId,
    //                       userIds: data.map((e) => e.participantId).toList(),
    //                     )).notifier)
    //                     .createAttendance();
    //                 ref.read(navigatorProvider).pop(result: true);
    //               },
    //               isShowDialog: true,
    //               dialogText: '출석체크를 완료했어요!',
    //             ),
    //           ),
    //           body: Padding(
    //             padding: const EdgeInsets.symmetric(horizontal: 16),
    //             child: SingleChildScrollView(
    //               child: Column(
    //                 children: [
    //                   Padding(
    //                     padding: const EdgeInsets.only(top: 30, right: 24, left: 24, bottom: 16),
    //                     child: Row(
    //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                       children: [
    //                         const Text('닉네임', style: MomoTextStyle.defaultStyle),
    //                         Row(
    //                           mainAxisAlignment: MainAxisAlignment.end,
    //                           children: const [
    //                             Text('출석', style: MomoTextStyle.defaultStyle),
    //                             SizedBox(width: 27),
    //                             Text('결석', style: MomoTextStyle.defaultStyle),
    //                           ],
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                   Material(
    //                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    //                     elevation: 2,
    //                     child: Container(
    //                       padding: const EdgeInsets.symmetric(vertical: 16),
    //                       width: double.infinity,
    //                       height: 32 + 72.0 * data.length,
    //                       decoration: BoxDecoration(
    //                         borderRadius: BorderRadius.circular(20),
    //                         color: MomoColor.flutterWhite,
    //                       ),
    //                       child: ListView.builder(
    //                         itemCount: data.length,
    //                         physics: const NeverScrollableScrollPhysics(),
    //                         itemBuilder: (context, index) => attendanceCard(
    //                           name: data[index].nickname,
    //                           profile: data[index].imageUrl ??
    //                               'https://img.insight.co.kr/static/2019/04/20/700/mev0r133kiy3hx0u4c48.jpg',
    //                           rate: data[index].attendanceRate,
    //                           onSelect: ref
    //                               .read(attendacneCreateStateProvider(AttendanceProviderArg(
    //                                 scheduleId: scheduleId,
    //                                 userIds: data.map((e) => e.participantId).toList(),
    //                               )).notifier)
    //                               .checkAttendacne,
    //                           attend: attendacneCheckState.attendanceCreateRequests[index].attend,
    //                           userId: attendacneCheckState.attendanceCreateRequests[index].participantId,
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         );
    //       },
    //     ),
    //   );
    // }
  }
}
