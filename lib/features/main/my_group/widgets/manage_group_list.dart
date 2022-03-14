import 'package:flutter/material.dart';
import 'package:momo_flutter/data/models/management/my_group_response.dart';
import 'package:momo_flutter/resources/app_error_strings.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/widgets/card/empty_item_card.dart';
import 'package:momo_flutter/widgets/title/member_date_row.dart';

class ManageGroupList extends StatelessWidget {
  const ManageGroupList(this.myGroups, {Key? key}) : super(key: key);

  final List<MyGroupResponse> myGroups;

  @override
  Widget build(BuildContext context) {
    return myGroups.isEmpty
        ? const EmptyItemCard(AppErrorString.myGroupEmpty)
        : ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: myGroups.length,
            itemBuilder: (context, index) => _ManageGroupCard(myGroups[index]),
            separatorBuilder: (_, index) => const SizedBox(width: 14),
          );
  }
}

class _ManageGroupCard extends StatelessWidget {
  const _ManageGroupCard(this.group, {Key? key}) : super(key: key);

  final MyGroupResponse group;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              group.imageUrl ?? '',
              fit: BoxFit.fill,
              height: 212,
              width: 197,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 93, left: 14, right: 14, bottom: 14),
            height: 212,
            width: 197,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.transparent,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  group.name,
                  style: AppStyles.bold16.copyWith(color: AppColors.gray0),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    SizedBox(
                      width: 102,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(
                          value: (group.achievementRate ?? 0).toDouble() / 100,
                          color: AppColors.purple,
                          backgroundColor: AppColors.gray0,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '${group.achievementRate}%',
                      style: AppStyles.regular12,
                    )
                  ],
                ),
                const SizedBox(height: 12),
                const MemberDateRow(
                  headNum: 3,
                  startDay: '11/2',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
