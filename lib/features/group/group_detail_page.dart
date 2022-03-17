import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:momo_flutter/data/models/group/group_detail_response.dart';
import 'package:momo_flutter/features/group/providers/group_detail_provider.dart';
import 'package:momo_flutter/features/group/widgets/group_contents_card.dart';
import 'package:momo_flutter/features/group/widgets/group_detail_image_card.dart';
import 'package:momo_flutter/features/group/widgets/participant_group_body.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/utils/load_asset.dart';
import 'package:momo_flutter/widgets/button/bottom_button.dart';
import 'package:momo_flutter/widgets/indicator/loading_indicator.dart';

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
      (pre, next) {},
    );

    final groupDetail = ref.watch(groupDetailStateProvider(widget.groupId));

    if (groupDetail.managerId == -1) {
      return const Scaffold(
        body: LoadingIndicator(),
      );
    }
    return SafeArea(
      child: Scaffold(
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
            InkWell(
              onTap: () {},
              child: loadAsset(AppIcons.oooWhite),
            ),
          ],
        ),
        body: _BuildBody(groupDetail),
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
                const Spacer(),
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
      final _check = group.participantCnt >= group.recruitmentCnt;
      return CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                GroupDetailImageCard(group),
                GroupContentsCard(group.introduction),
                const Spacer(),
                Consumer(
                  builder: (context, ref, child) {
                    return BottomButton(
                      isEnable: _check,
                      buttonTitle: _check ? AppStrings.deadLine : AppStrings.canApply,
                      onPressed: () async {
                        await ref.read(groupDetailStateProvider(group.id).notifier).participantGroup();
                      },
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
