import 'package:flutter/material.dart';
import 'package:momo_flutter/data/models/group/group_response.dart';
import 'package:momo_flutter/features/main/main_bottom_navigation_bar.dart';
import 'package:momo_flutter/features/main/mypage/widgets/achievement_card.dart';
import 'package:momo_flutter/features/main/mypage/widgets/group_and_badge_count_card.dart';
import 'package:momo_flutter/features/main/mypage/widgets/user_category_list.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/utils/load_asset.dart';
import 'package:momo_flutter/widgets/card/group_card.dart';
import 'package:momo_flutter/widgets/card/profile_image_card.dart';
import 'package:momo_flutter/widgets/title/main_title.dart';
import 'package:momo_flutter/widgets/title/sub_title_row.dart';

class Mypage extends StatelessWidget {
  const Mypage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {},
            child: loadAsset(AppIcons.setting),
          ),
        ],
      ),
      bottomNavigationBar: const MainBottomNavigationBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                MainTitle('모모님의\n마이페이지'),
                ProfileImageCard(
                  img: 'https://file.mk.co.kr/meet/neds/2020/08/image_readtop_2020_864116_15980534304326707.png',
                  rad: 34,
                  backgroundColor: AppColors.purple,
                ),
              ],
            ),
            const SizedBox(height: 30),
            const GroupAndBadgeCountCard(),
            const SizedBox(height: 14),
            const AchievementCard(),
            const SubTitleRow(
              title: AppStrings.favoriteCategory,
              icon: AppIcons.favoriteCategory,
            ),
            const UserCategoryList(),
            const SubTitleRow(
              title: AppStrings.recentGroup,
              icon: AppIcons.recentGroup,
            ),
            SizedBox(
              height: 240,
              child: ListView.separated(
                padding: const EdgeInsets.only(bottom: 40),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GroupCard(
                    GroupResponse(
                      id: 1,
                      name: '기초를 위한 영어 회화 모임',
                      offline: index % 2 == 0,
                      participantCnt: 10,
                      startDate: '2021-12-31',
                      favoriteGroup: index % 2 == 1,
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 14),
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
