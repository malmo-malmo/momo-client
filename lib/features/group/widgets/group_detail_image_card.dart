import 'package:flutter/material.dart';
import 'package:momo_flutter/data/models/group/group_detail_response.dart';
import 'package:momo_flutter/features/images/full_image_page.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/widgets/card/on_off_card.dart';
import 'package:momo_flutter/widgets/title/member_date_row.dart';

class GroupDetailImageCard extends StatelessWidget {
  const GroupDetailImageCard(this.group, {Key? key}) : super(key: key);

  final GroupDetailResponse group;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      width: double.infinity,
      child: Stack(
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                FullImagePage.routeName,
                arguments:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSo2lT2My2ZPXDPGCTKi6DvpSDEXB5woZPNDw&usqp=CAU',
              );
            },
            child: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSo2lT2My2ZPXDPGCTKi6DvpSDEXB5woZPNDw&usqp=CAU',
              height: 280,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OnOffCard(group.offline),
                const SizedBox(height: 12),
                Text(
                  group.name,
                  style: AppStyles.bold20.copyWith(
                    color: AppColors.gray0,
                  ),
                ),
                const SizedBox(height: 12),
                MemberDateRow(
                  headNum: group.participantCnt,
                  startDay: group.startDate,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
