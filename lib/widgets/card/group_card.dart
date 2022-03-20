import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:momo_flutter/data/models/group/group_response.dart';
import 'package:momo_flutter/features/group/group_detail_page.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/widgets/card/cashed_image_card.dart';
import 'package:momo_flutter/widgets/card/on_off_card.dart';
import 'package:momo_flutter/widgets/title/member_date_row.dart';

class GroupCard extends StatelessWidget {
  const GroupCard(
    this.group, {
    Key? key,
    required this.setLike,
    this.height = 200,
    this.width = 148,
  }) : super(key: key);

  final GroupResponse group;
  final double height;
  final double width;
  final Function setLike;

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
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedImageCard(
              imageUrl:
                  'https://s3.ap-northeast-2.amazonaws.com/img.kormedi.com/news/article/__icsFiles/artimage/2017/04/18/c_km601/shutterstock_369150029_540.jpg',
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
                      onTap: () => setLike(),
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
