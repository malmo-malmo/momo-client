import 'package:flutter/material.dart';
import 'package:momo_flutter/features/main/main_bottom_navigation_bar.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/widgets/button/header_chat_button.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MainBottomNavigationBar(),
      appBar: AppBar(
        backgroundColor: AppColors.backgroundPurple,
        actions: const [
          HeaderChatButton(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    !isSearch ? '검색' : '검색결과',
                    style: MomoTextStyle.mainTitle,
                  ),
                  SizedBox(height: 12.h),
                  const SearchBox(),
                ],
              ),
            ),
            !isSearch
                ? SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        SubTitle(title: '최근검색어', icon: 'assets/icon/search/icon_recentsearch_28.svg'),
                        SearchedWordCards(),
                        SubTitle(title: '최근 본 모임', icon: 'assets/icon/search/icon_recentsee_28.svg')
                      ],
                    ),
                  )
                : SliverPadding(
                    padding: const EdgeInsets.only(top: 30),
                    sliver: SearchResultList(
                      pagingController: pagingController,
                    ),
                  ),
            !isSearch ? const RecentMeetingList() : const SliverToBoxAdapter(),
          ],
        ),
      ),
    );
  }
}
