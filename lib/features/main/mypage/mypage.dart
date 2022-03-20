import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/data/models/group/group_response.dart';
import 'package:momo_flutter/features/main/main_bottom_navigation_bar.dart';
import 'package:momo_flutter/features/main/mypage/widgets/achievement_card.dart';
import 'package:momo_flutter/features/main/mypage/widgets/group_and_badge_count_card.dart';
import 'package:momo_flutter/features/main/mypage/widgets/user_category_list.dart';
import 'package:momo_flutter/features/setting/setting_page.dart';
import 'package:momo_flutter/provider/user_provider.dart';
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
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: InkWell(
              onTap: () => Navigator.pushNamed(context, SettingPage.routeName),
              child: loadAsset(AppIcons.setting),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const MainBottomNavigationBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 16),
              Consumer(builder: (context, ref, child) {
                final userData = ref.watch(userDataStateProvider);

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MainTitle('${userData.nickname}님의\n마이페이지'),
                    ProfileImageCard(
                      img: userData.image!,
                      rad: 34,
                      backgroundColor: AppColors.purple,
                    ),
                  ],
                );
              }),
              const SizedBox(height: 30),
              const GroupAndBadgeCountCard(),
              const SizedBox(height: 14),
              const AchievementCard(),
              const Padding(
                padding: EdgeInsets.only(top: 40, bottom: 14),
                child: SubTitleRow(
                  title: AppStrings.favoriteCategory,
                  icon: AppIcons.favoriteCategory,
                ),
              ),
              const UserCategoryList(),
              const Padding(
                padding: EdgeInsets.only(top: 40, bottom: 14),
                child: SubTitleRow(
                  title: AppStrings.recentGroup,
                  icon: AppIcons.recentGroup,
                ),
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
                      setLike: () {},
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(width: 14),
                  itemCount: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
