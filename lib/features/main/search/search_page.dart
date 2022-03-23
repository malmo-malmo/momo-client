import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/features/main/main_bottom_navigation_bar.dart';
import 'package:momo_flutter/features/main/search/provider/search_result_provider.dart';
import 'package:momo_flutter/features/main/search/widgets/recent_group_list_view.dart';
import 'package:momo_flutter/features/main/search/widgets/seached_words_wrap.dart';
import 'package:momo_flutter/features/main/search/widgets/search_query_input_field.dart';
import 'package:momo_flutter/features/main/search/widgets/search_result_list_view.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/widgets/button/header_chat_button.dart';
import 'package:momo_flutter/widgets/title/main_title.dart';
import 'package:momo_flutter/widgets/title/sub_title_row.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        bottomNavigationBar: const MainBottomNavigationBar(),
        backgroundColor: AppColors.backgroundPurple,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.backgroundPurple,
          actions: const [
            HeaderChatButton(),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Consumer(
            builder: (context, ref, child) {
              final isSearched = ref.watch(isSearchedProvider);
              final pagingController = ref.watch(searchReulstPagingController);
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MainTitle(!isSearched ? '검색' : '검색결과'),
                        const SizedBox(height: 12),
                        const SearchQueryInputField(),
                      ],
                    ),
                  ),
                  !isSearched
                      ? SliverToBoxAdapter(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(top: 40, bottom: 16),
                                child: SubTitleRow(
                                  title: '최근검색어',
                                  icon: 'assets/icon/search/icon_recentsearch_28.svg',
                                ),
                              ),
                              SearchedWordsWrap(),
                              Padding(
                                padding: EdgeInsets.only(top: 40, bottom: 16),
                                child: SubTitleRow(
                                  title: '최근 본 모임',
                                  icon: 'assets/icon/search/icon_recentsee_28.svg',
                                ),
                              )
                            ],
                          ),
                        )
                      : SliverPadding(
                          padding: const EdgeInsets.only(top: 30),
                          sliver: SearchResultListView(pagingController),
                        ),
                  !isSearched ? const RecentGroupListView() : const SliverToBoxAdapter(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
