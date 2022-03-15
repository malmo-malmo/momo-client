import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/data/models/group/group_response.dart';
import 'package:momo_flutter/features/main/home/provider/home_group_provider.dart';
import 'package:momo_flutter/resources/app_error_strings.dart';
import 'package:momo_flutter/widgets/card/empty_item_card.dart';
import 'package:momo_flutter/widgets/card/group_card.dart';

class HomeGroupListView extends StatelessWidget {
  const HomeGroupListView(this.groups, {Key? key}) : super(key: key);

  final List<GroupResponse> groups;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: groups.isEmpty
          ? const EmptyItemCard(AppErrorString.homeGroupEmpty)
          : ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Consumer(
                builder: (context, ref, child) {
                  return GroupCard(
                    groups[index],
                    setLike: () {
                      if (groups[index].favoriteGroup) {
                        ref.read(homeGroupStateProvider.notifier).deleteGroupLike(groups[index].id);
                      } else {
                        ref.read(homeGroupStateProvider.notifier).createGroupLike(groups[index].id);
                      }
                    },
                  );
                },
              ),
              separatorBuilder: (context, index) => const SizedBox(width: 14),
              itemCount: groups.length,
            ),
    );
  }
}
