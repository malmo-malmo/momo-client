import 'package:flutter/material.dart';
import 'package:momo_flutter/data/models/group/group_detail_response.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/utils/load_asset.dart';
import 'package:momo_flutter/widgets/card/on_off_card.dart';
import 'package:momo_flutter/widgets/title/member_date_row.dart';

class GroupDetailImageCard extends StatelessWidget {
  const GroupDetailImageCard(this.group, {Key? key}) : super(key: key);

  final GroupDetailResponse group;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 290,
        width: double.infinity,
        child: Stack(
          children: [
            InkWell(
              onTap: () {},
              child: Image.network(
                group.imageUrl ??
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSo2lT2My2ZPXDPGCTKi6DvpSDEXB5woZPNDw&usqp=CAU',
                height: 290,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 88),
                  OnOffCard(group.offline),
                  const SizedBox(height: 10),
                  Text(
                    group.name,
                    style: AppStyles.bold20.copyWith(
                      color: AppColors.gray0,
                    ),
                  ),
                  const SizedBox(height: 46),
                  _TitleRow(
                    icon: AppIcons.locationWhite,
                    title: group.city + ' ' + group.district,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _TitleRow(
                        icon: AppIcons.universityWhite,
                        title: group.university ?? AppStrings.noUniversity,
                      ),
                      MemberDateRow(
                        headNum: group.participantCnt,
                        startDay: group.startDate,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TitleRow extends StatelessWidget {
  const _TitleRow({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        loadAsset(icon),
        const SizedBox(width: 8),
        Text(
          title,
          style: AppStyles.regular12,
        ),
      ],
    );
  }
}
