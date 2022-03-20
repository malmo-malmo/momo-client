import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/features/group/favorite_group_list_page.dart';
import 'package:momo_flutter/features/main/mypage/provider/mypage_count_provider.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/widgets/indicator/loading_indicator.dart';

class GroupAndBadgeCountCard extends StatelessWidget {
  const GroupAndBadgeCountCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.only(top: 16, right: 45, left: 45),
      decoration: AppStyles.containerDecoration(
        radius: 20,
        color: AppColors.backgroundPurple,
      ),
      child: Consumer(
        builder: (context, ref, child) {
          final mypageCounts = ref.watch(mypageCountStateProvider);
          return mypageCounts.isLoading
              ? const LoadingIndicator()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _CountColumn(
                      count: mypageCounts.totalGroupCount,
                      title: AppStrings.totalGroup,
                      onTap: () {},
                    ),
                    _CountColumn(
                      count: mypageCounts.favoriteGroupCount,
                      title: AppStrings.favoriteGroup,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          FavoriteGroupListPage.routeName,
                        );
                      },
                    ),
                    _CountColumn(
                      count: mypageCounts.badgeCount,
                      title: AppStrings.takeBadge,
                      onTap: () {},
                    ),
                  ],
                );
        },
      ),
    );
  }
}

class _CountColumn extends StatelessWidget {
  const _CountColumn({
    Key? key,
    required this.count,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final int count;
  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            onTap();
          },
          child: SizedBox(
            height: 44,
            width: 44,
            child: Center(
              child: Text(
                '$count',
                style: AppStyles.bold24.copyWith(
                  decoration: TextDecoration.underline,
                  color: AppColors.gray6,
                ),
              ),
            ),
          ),
        ),
        Text(
          title,
          style: AppStyles.regular14,
        ),
      ],
    );
  }
}
