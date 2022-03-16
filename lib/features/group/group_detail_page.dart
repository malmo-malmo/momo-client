import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/features/group/providers/group_detail_provider.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/utils/load_asset.dart';
import 'package:momo_flutter/widgets/indicator/loading_indicator.dart';

class GroupDetailPage extends ConsumerWidget {
  const GroupDetailPage(this.groupId, {Key? key}) : super(key: key);

  final int groupId;

  static const routeName = 'GroupDetailPage';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupDetail = ref.watch(groupDetailStateProvider(groupId));

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
        body: CustomScrollView(),
      ),
    );
  }
}
