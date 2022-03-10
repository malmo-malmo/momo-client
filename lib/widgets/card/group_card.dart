import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:momo_flutter/data/models/group/group_response.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/widgets/card/cashed_image_card.dart';
import 'package:momo_flutter/widgets/card/on_off_card.dart';
import 'package:momo_flutter/widgets/title/member_date_row.dart';

class GroupCard extends StatelessWidget {
  const GroupCard(
    this.group, {
    Key? key,
    this.height = 200,
    this.width = 148,
  }) : super(key: key);

  final GroupResponse group;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedImageCard(
              imageUrl: group.imageUrl ?? 'http://m.pokjukworld.co.kr/web/product/big/pokjukworld_222.jpg',
              height: height,
              width: width,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(14),
            width: width,
            height: height,
            decoration: AppStyles.containerDecoration(
              radius: 20,
              color: Colors.transparent,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OnOffCard(group.offline),
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        group.favoriteGroup ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                        size: 24,
                        color: AppColors.gray0,
                      ),
                    )
                  ],
                ),
                const Spacer(),
                Text(
                  group.name,
                  style: AppStyles.bold16.copyWith(color: AppColors.gray0),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                MemberDateRow(
                  headNum: group.participantCnt,
                  startDay: group.startDate,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
