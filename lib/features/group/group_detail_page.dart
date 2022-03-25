import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:momo_flutter/data/models/group/group_detail_response.dart';
import 'package:momo_flutter/features/group/providers/group_detail_provider.dart';
import 'package:momo_flutter/features/group/providers/upcoming_schedule_provider.dart';
import 'package:momo_flutter/features/group/widgets/admin_bottom_sheet.dart';
import 'package:momo_flutter/features/group/widgets/group_contents_card.dart';
import 'package:momo_flutter/features/group/widgets/group_detail_image_card.dart';
import 'package:momo_flutter/features/group/widgets/normal_bottom_sheet.dart';
import 'package:momo_flutter/features/post/widgets/notice_horizontal_list_view.dart';
import 'package:momo_flutter/features/post/widgets/post_list_view.dart';
import 'package:momo_flutter/features/schedule/schedule_list_page.dart';
import 'package:momo_flutter/provider/loading_provider.dart';
import 'package:momo_flutter/provider/user_provider.dart';
import 'package:momo_flutter/resources/app_error_strings.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/utils/load_asset.dart';
import 'package:momo_flutter/widgets/button/bottom_button.dart';
import 'package:momo_flutter/widgets/card/error_card.dart';
import 'package:momo_flutter/widgets/indicator/custom_loader.dart';
import 'package:momo_flutter/widgets/indicator/loading_indicator.dart';
import 'package:momo_flutter/widgets/title/sub_title.dart';
import 'package:momo_flutter/widgets/toast/cutom_toast.dart';

class GroupDetailPage extends ConsumerStatefulWidget {
  const GroupDetailPage(this.groupId, {Key? key}) : super(key: key);

  final int groupId;

  static const routeName = 'GroupDetailPage';

  @override
  ConsumerState<GroupDetailPage> createState() => _GroupDetailPageState();
}

class _GroupDetailPageState extends ConsumerState<GroupDetailPage> {
  final _fToast = FToast();

  @override
  void initState() {
    super.initState();
    _fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<GroupDetailResponse>(
      groupDetailStateProvider(widget.groupId),
      (pre, next) {
        if (pre != null && (pre.participant && !next.participant)) {
          _fToast.showToast(
            child: const CustomToast(
              AppStrings.toastWithdrawalGroup,
            ),
            gravity: ToastGravity.BOTTOM,
          );
          Navigator.pop(context);
        }
        if (pre != null && (pre.managerId != -1 && pre.managerId != next.managerId)) {
          _fToast.showToast(
            child: const CustomToast(AppStrings.toastAuthority),
            gravity: ToastGravity.BOTTOM,
          );
        }
        if (pre != null && (pre.end && !next.end)) {
          _fToast.showToast(
            child: const CustomToast(AppStrings.toastEndGroup),
            gravity: ToastGravity.BOTTOM,
          );
        }
      },
    );

    final groupDetail = ref.watch(groupDetailStateProvider(widget.groupId));
    final userId = ref.watch(userDataStateProvider).id;

    if (groupDetail.managerId == -1) {
      return const Scaffold(
        body: LoadingIndicator(),
      );
    }
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: AppColors.backgroundPurple,
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              leading: InkWell(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  CupertinoIcons.back,
                  color: AppColors.backgroundWhite,
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: InkWell(
                    onTap: !groupDetail.end && groupDetail.participant
                        ? () {
                            if (userId == groupDetail.managerId) {
                              showModalBottomSheet(
                                context: context,
                                builder: (_) => AdminBottomSheet(groupDetail.id),
                              );
                            } else {
                              showModalBottomSheet(
                                context: context,
                                builder: (_) => NormalBottomSheet(groupDetail.id),
                              );
                            }
                          }
                        : null,
                    child: loadAsset(AppIcons.oooWhite),
                  ),
                ),
              ],
            ),
            body: _BuildBody(groupDetail),
          ),
          ...customLoader,
        ],
      ),
    );
  }
}

class _BuildBody extends StatelessWidget {
  const _BuildBody(this.group, {Key? key}) : super(key: key);

  final GroupDetailResponse group;

  @override
  Widget build(BuildContext context) {
    if (!group.participant) {
      final _check = group.participantCnt <= group.recruitmentCnt;
      return CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Container(
              color: AppColors.backgroundWhite,
              height: MediaQuery.of(context).size.height >= 800 ? MediaQuery.of(context).size.height : 800,
              child: Column(
                children: [
                  GroupDetailImageCard(group),
                  _GroupInformationCard(
                    city: group.city,
                    district: group.district,
                    university: group.university ?? '대학교 없음',
                    managerId: group.managerId,
                    isEnd: group.end,
                  ),
                  Container(
                    height: 10,
                    color: AppColors.gray1,
                  ),
                  GroupContentsCard(group.introduction),
                  const Spacer(),
                  Consumer(
                    builder: (context, ref, child) {
                      return Padding(
                        padding: const EdgeInsets.all(16),
                        child: BottomButton(
                          isEnable: _check,
                          buttonTitle: _check ? AppStrings.canApply : AppStrings.deadLine,
                          onPressed: () async {
                            ref.read(loadingProvider.state).state = true;
                            await ref.read(groupDetailStateProvider(group.id).notifier).participantGroup();
                            ref.read(loadingProvider.state).state = false;
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    } else {
      return CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                GroupDetailImageCard(group),
                _GroupInformationCard(
                  city: group.city,
                  district: group.district,
                  university: group.university ?? '대학교 없음',
                  managerId: group.managerId,
                  isEnd: group.end,
                ),
                Container(
                  height: 10,
                  color: AppColors.gray1,
                ),
                _ScheduleCard(
                  group.id,
                  group.end,
                ),
                Container(
                  height: 10,
                  color: AppColors.gray1,
                ),
                NoticeHorizontalListView(
                  group.id,
                  group.end,
                ),
                Container(
                  height: 10,
                  color: AppColors.gray1,
                ),
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: PostListView(
              group.id,
              group.end,
            ),
          ),
        ],
      );
    }
  }
}

class _GroupInformationCard extends StatelessWidget {
  const _GroupInformationCard({
    Key? key,
    required this.city,
    required this.district,
    required this.university,
    required this.managerId,
    required this.isEnd,
  }) : super(key: key);

  final String city;
  final String district;
  final String university;
  final int managerId;
  final bool isEnd;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundWhite,
      height: 155,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SubTitle('모임정보'),
                Consumer(
                  builder: (context, ref, child) {
                    final userId = ref.watch(userDataStateProvider).id;
                    return userId != managerId
                        ? InkWell(
                            onTap: !isEnd ? () {} : null,
                            child: Text(
                              '모임 관리자 1:1 쪽지',
                              style: AppStyles.regular12.copyWith(
                                color: AppColors.purple,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          )
                        : const SizedBox();
                  },
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 16, bottom: 20),
              height: 1,
              color: AppColors.gray1,
            ),
            _TitleRow(
              icon: AppIcons.locationWhite,
              title: city + ' ' + district,
            ),
            _TitleRow(
              icon: AppIcons.universityWhite,
              title: university,
            ),
          ],
        ),
      ),
    );
  }
}

class _ScheduleCard extends ConsumerWidget {
  const _ScheduleCard(this.groupId, this.isEnd, {Key? key}) : super(key: key);

  final int groupId;
  final bool isEnd;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final response = ref.watch(upcomingScheduleProvider(groupId));
    return Container(
      color: AppColors.backgroundWhite,
      height: 148,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: response.when(
          error: (error, stackTrace) => const ErrorCard(errorMessage: AppErrorString.upcomingScheduleEmpty),
          loading: () => const LoadingIndicator(),
          data: (schedule) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SubTitle(AppStrings.upcomingSchedule),
                    InkWell(
                      onTap: !isEnd
                          ? () => Navigator.pushNamed(
                                context,
                                ScheduleListPage.routeName,
                                arguments: groupId,
                              )
                          : null,
                      child: Transform.rotate(
                        angle: pi,
                        child: const Icon(
                          CupertinoIcons.back,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(height: 1, color: AppColors.gray1),
                const SizedBox(height: 20),
                Text(
                  schedule.title ?? AppErrorString.upcomingScheduleEmpty,
                  style: AppStyles.bold16,
                ),
                const SizedBox(height: 8),
                Text(
                  schedule.startDateTime ?? '',
                  style: AppStyles.regular14,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _TitleRow extends StatelessWidget {
  const _TitleRow({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        loadAsset(icon, color: AppColors.gray6),
        const SizedBox(width: 8),
        Text(
          title,
          style: AppStyles.regular12.copyWith(color: AppColors.gray6),
        ),
      ],
    );
  }
}
