import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/provider/recent_searched_data.dart';
import 'package:momo_flutter/resources/app_error_strings.dart';
import 'package:momo_flutter/widgets/card/empty_item_card.dart';
import 'package:momo_flutter/widgets/card/group_card.dart';
import 'package:momo_flutter/widgets/indicator/loading_indicator.dart';

class RecentGroupListView extends ConsumerWidget {
  const RecentGroupListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recentData = ref.watch(searchedDataStateProvider);

    if (recentData.isLoading) {
      return const SliverToBoxAdapter(
        child: LoadingIndicator(),
      );
    }
    if (recentData.groups.isEmpty) {
      return const SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.only(top: 40),
          child: EmptyItemCard(AppErrorString.recentGroupEmpty),
        ),
      );
    }
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 14,
        crossAxisSpacing: 14,
        mainAxisExtent: MediaQuery.of(context).size.width / 360 * 200,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) => GroupCard(
          recentData.groups[index],
          setLike: () {},
          width: MediaQuery.of(context).size.width / 360 * 157,
          height: MediaQuery.of(context).size.width / 360 * 200,
        ),
        childCount: recentData.groups.length,
      ),
    );
  }
}
