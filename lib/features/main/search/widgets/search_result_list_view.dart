import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:momo_flutter/data/models/group/group_response.dart';
import 'package:momo_flutter/features/group/group_detail_page.dart';
import 'package:momo_flutter/resources/app_error_strings.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/widgets/card/empty_item_card.dart';
import 'package:momo_flutter/widgets/card/on_off_card.dart';
import 'package:momo_flutter/widgets/indicator/loading_indicator.dart';
import 'package:momo_flutter/widgets/title/member_date_row.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView(this.controller, {Key? key}) : super(key: key);

  final PagingController<int, GroupResponse> controller;

  @override
  Widget build(BuildContext context) {
    return PagedSliverList.separated(
      pagingController: controller,
      builderDelegate: PagedChildBuilderDelegate<GroupResponse>(
        itemBuilder: (context, item, index) => _SearchResultCard(item),
        newPageProgressIndicatorBuilder: (context) => const LoadingIndicator(),
        firstPageProgressIndicatorBuilder: (context) => const LoadingIndicator(),
        noItemsFoundIndicatorBuilder: (context) => const EmptyItemCard(AppErrorString.homeGroupEmpty),
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 14),
    );
  }
}

class _SearchResultCard extends StatelessWidget {
  const _SearchResultCard(this.group, {Key? key}) : super(key: key);

  final GroupResponse group;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          GroupDetailPage.routeName,
          arguments: group.id,
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
                OnOffCard(group.offline),
                Text(
                  group.name,
                  style: AppStyles.bold14,
                ),
                MemberDateRow(
                  headNum: group.participantCnt,
                  startDay: group.startDate,
                  color: AppColors.gray6,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
