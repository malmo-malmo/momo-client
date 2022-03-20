import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:momo_flutter/app_config.dart';
import 'package:momo_flutter/data/models/management/group_summary_response.dart';
import 'package:momo_flutter/resources/app_error_strings.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/utils/category_name_to_icon.dart';
import 'package:momo_flutter/utils/load_asset.dart';
import 'package:momo_flutter/widgets/card/empty_item_card.dart';

class ParticipantGroupList extends StatelessWidget {
  const ParticipantGroupList(this.participantGroups, {Key? key}) : super(key: key);

  final List<GroupSummaryReseponse> participantGroups;

  @override
  Widget build(BuildContext context) {
    if (participantGroups.isEmpty) {
      return const SizedBox(
        height: 300,
        child: EmptyItemCard(AppErrorString.etcGroupEmpty),
      );
    }
    return Column(
      children: [
        for (int i = 0; i < participantGroups.length; i++)
          _ParticipantGroupCard(
            participantGroups[i],
          ),
      ],
    );
  }
}

class _ParticipantGroupCard extends StatelessWidget {
  const _ParticipantGroupCard(this.group, {Key? key}) : super(key: key);

  final GroupSummaryReseponse group;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        height: 72,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.gray0,
          boxShadow: const [
            BoxShadow(
              color: AppColors.blur,
              offset: Offset(0, 3),
              blurRadius: 6,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                loadAsset(
                  categoryNameToIcon(
                    AppConfig.categoryCodeNamePair
                        .where(
                          (element) => element.code == group.category,
                        )
                        .first
                        .name,
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  group.name,
                  style: AppStyles.bold16,
                ),
              ],
            ),
            Transform.rotate(
              angle: pi,
              child: InkWell(
                onTap: () {},
                child: const Icon(
                  CupertinoIcons.back,
                  size: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
