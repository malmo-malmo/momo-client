import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/data/models/management/participation_group_response.dart';
import 'package:momo_flutter/features/group/group_detail_page.dart';
import 'package:momo_flutter/features/group/providers/total_group_list_provider.dart';
import 'package:momo_flutter/resources/app_error_strings.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/widgets/card/empty_item_card.dart';
import 'package:momo_flutter/widgets/card/on_off_card.dart';
import 'package:momo_flutter/widgets/indicator/loading_indicator.dart';
import 'package:momo_flutter/widgets/title/member_date_row.dart';

class TotalGroupListPage extends ConsumerStatefulWidget {
  const TotalGroupListPage({Key? key}) : super(key: key);

  static const routeName = 'TotalGroupListPage';

  @override
  ConsumerState<TotalGroupListPage> createState() => _TotalGroupListPageState();
}

class _TotalGroupListPageState extends ConsumerState<TotalGroupListPage> {
  int _curretnIndex = 0;

  @override
  Widget build(BuildContext context) {
    final totalGroups = ref.watch(totalGroupStateProvider);

    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(CupertinoIcons.back),
            ),
            title: const Text(AppStrings.manageGroup),
            bottom: TabBar(
              onTap: (index) {
                _curretnIndex = index;
                setState(() {});
              },
              indicatorColor: AppColors.purple,
              physics: const NeverScrollableScrollPhysics(),
              tabs: [
                Tab(
                    child: Text('전체(${totalGroups.groups.length})',
                        style: AppStyles.regular14.copyWith(color: _curretnIndex == 0 ? AppColors.purple : null))),
                Tab(
                    child: Text('참여 중',
                        style: AppStyles.regular14.copyWith(color: _curretnIndex == 1 ? AppColors.purple : null))),
                Tab(
                    child: Text('종료',
                        style: AppStyles.regular14.copyWith(color: _curretnIndex == 2 ? AppColors.purple : null))),
              ],
            ),
          ),
          body: totalGroups.isLoading
              ? const LoadingIndicator()
              : TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _GroupListView(totalGroups.groups),
                    _GroupListView(totalGroups.groups.where((element) => !element.end).toList()),
                    _GroupListView(totalGroups.groups.where((element) => element.end).toList()),
                  ],
                ),
        ),
      ),
    );
  }
}

class _GroupListView extends StatelessWidget {
  const _GroupListView(
    this.groups, {
    Key? key,
  }) : super(key: key);

  final List<ParticipationGroupResponse> groups;

  @override
  Widget build(BuildContext context) {
    if (groups.isEmpty) {
      return const EmptyItemCard(AppErrorString.homeGroupEmpty);
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: ListView.separated(
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              GroupDetailPage.routeName,
              arguments: groups[index].id,
            );
          },
          child: SizedBox(
            height: 76,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    'https://file.mk.co.kr/meet/neds/2021/11/image_readtop_2021_1081514_16372040344854618.jpg',
                    height: 76,
                    width: 76,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(width: 14),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OnOffCard(groups[index].offline),
                    Text(
                      groups[index].name,
                      style: AppStyles.bold14,
                    ),
                    MemberDateRow(
                      headNum: groups[index].participantCnt,
                      startDay: groups[index].startDate,
                      color: AppColors.gray0,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(height: 14),
        itemCount: groups.length,
      ),
    );
  }
}
