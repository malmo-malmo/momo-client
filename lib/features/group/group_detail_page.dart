import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:momo_flutter/data/models/group/group_detail_response.dart';
import 'package:momo_flutter/features/group/providers/group_detail_provider.dart';
import 'package:momo_flutter/features/group/widgets/admin_bottom_sheet.dart';
import 'package:momo_flutter/features/group/widgets/group_contents_card.dart';
import 'package:momo_flutter/features/group/widgets/group_detail_image_card.dart';
import 'package:momo_flutter/features/group/widgets/normal_bottom_sheet.dart';
import 'package:momo_flutter/features/group/widgets/participant_group_body.dart';
import 'package:momo_flutter/provider/loading_provider.dart';
import 'package:momo_flutter/provider/user_provider.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/utils/load_asset.dart';
import 'package:momo_flutter/widgets/button/bottom_button.dart';
import 'package:momo_flutter/widgets/indicator/custom_loader.dart';
import 'package:momo_flutter/widgets/indicator/loading_indicator.dart';
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
        if (pre != null && (pre.managerId != next.managerId)) {
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
                    onTap: () {
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
                    },
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
    if (group.end) {
      return CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                GroupDetailImageCard(group),
                GroupContentsCard(group.introduction),
                BottomButton(
                  isEnable: false,
                  buttonTitle: AppStrings.end,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      );
    } else if (!group.participant) {
      final _check = group.participantCnt <= group.recruitmentCnt;
      return CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              children: [
                GroupDetailImageCard(group),
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
        ],
      );
    } else {
      return ParticipantGroupBody(group);
    }
  }
}
