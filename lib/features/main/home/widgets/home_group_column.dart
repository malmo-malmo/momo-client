import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/features/main/home/provider/home_group_provider.dart';
import 'package:momo_flutter/features/main/home/widgets/home_group_list_view.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/widgets/indicator/loading_indicator.dart';
import 'package:momo_flutter/widgets/title/sub_title_row.dart';

class HomeGroupColumn extends ConsumerWidget {
  const HomeGroupColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeGroup = ref.watch(homeGroupStateProvider);

    if (homeGroup.isLoading) {
      return const SizedBox(
        height: 300,
        child: LoadingIndicator(),
      );
    }
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40, bottom: 16),
          child: SubTitleRow(
            title: AppStrings.recommendation,
            icon: AppIcons.recommendation,
            actionIcon: InkWell(
              onTap: () {},
              child: const Icon(Icons.add),
            ),
          ),
        ),
        HomeGroupListView(homeGroup.categoryGroups),
        Padding(
          padding: const EdgeInsets.only(top: 40, bottom: 16),
          child: SubTitleRow(
            title: AppStrings.myUniversity,
            icon: AppIcons.myUniversity,
            actionIcon: InkWell(
              onTap: () {},
              child: const Icon(Icons.add),
            ),
          ),
        ),
        HomeGroupListView(homeGroup.universityGroups),
        Padding(
          padding: const EdgeInsets.only(top: 40, bottom: 16),
          child: SubTitleRow(
            title: AppStrings.around,
            icon: AppIcons.around,
            actionIcon: InkWell(
              onTap: () {},
              child: const Icon(Icons.add),
            ),
          ),
        ),
        HomeGroupListView(homeGroup.districtGroups),
      ],
    );
  }
}
