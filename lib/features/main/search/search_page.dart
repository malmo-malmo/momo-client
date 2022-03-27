import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:momo_flutter/data/models/group/group_response.dart';
import 'package:momo_flutter/features/main/main_bottom_navigation_bar.dart';
import 'package:momo_flutter/features/main/search/provider/search_data_provider.dart';
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
    return Scaffold(
      bottomNavigationBar: const MainBottomNavigationBar(),
      appBar: AppBar(),
      body: const Center(
        child: Text('검색 페이지'),
      ),
    );
  }
}

// class SearchPage extends ConsumerStatefulWidget {
//   const SearchPage({Key? key}) : super(key: key);

//   @override
//   ConsumerState<SearchPage> createState() => _SearchPageState();
// }

// class _SearchPageState extends ConsumerState<SearchPage> {
//   final _controller = PagingController<int, GroupResponse>(firstPageKey: 0);

//   @override
//   void initState() {
//     super.initState();

//     _controller.addPageRequestListener(
//       (pageKey) {
//         final categories = ref.read(categoryFilterStateProvider.notifier).makeRequestFilter();
//         final cities = ref.read(locationFilterStateProvider.notifier).makeRequestFilter();
//         final groupName = ref.read(searchQueryProvider);
//         ref.read(searchResultListProvider.notifier).getGroups(
//               pageKey,
//               groupName: groupName,
//               cities: cities,
//               categories: categories,
//             );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     ref.listen<SearchResultState>(
//       searchResultListProvider,
//       (pre, next) {
//         _controller.value = PagingState(
//           itemList: next.groups,
//           nextPageKey: next.nextPage,
//           error: next.error,
//         );
//       },
//     );

//     final isSearched = ref.watch(isSearchedProvider);

//     return GestureDetector(
//       onTap: () => FocusScope.of(context).unfocus(),
//       child: Scaffold(
//         bottomNavigationBar: const MainBottomNavigationBar(),
//         backgroundColor: AppColors.backgroundPurple,
//         appBar: AppBar(
//           automaticallyImplyLeading: false,
//           backgroundColor: AppColors.backgroundPurple,
//           actions: const [HeaderChatButton()],
//         ),
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: CustomScrollView(
//             slivers: [
//               SliverToBoxAdapter(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     MainTitle(!isSearched ? '검색' : '검색결과'),
//                     const SizedBox(height: 12),
//                     SearchQueryInputField(
//                       refresh: () {
//                         _controller.removePageRequestListener((pageKey) {});
//                         _controller.addPageRequestListener((pageKey) {
//                           final categories = ref.read(categoryFilterStateProvider.notifier).makeRequestFilter();
//                           final cities = ref.read(locationFilterStateProvider.notifier).makeRequestFilter();
//                           final groupName = ref.read(searchQueryProvider);
//                           ref.read(searchResultListProvider.notifier).getGroups(
//                                 pageKey,
//                                 groupName: groupName,
//                                 cities: cities,
//                                 categories: categories,
//                               );
//                         });
//                         _controller.refresh();
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//               !isSearched
//                   ? SliverToBoxAdapter(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: const [
//                           Padding(
//                             padding: EdgeInsets.only(top: 40, bottom: 16),
//                             child: SubTitleRow(
//                               title: '최근검색어',
//                               icon: 'assets/icon/search/icon_recentsearch_28.svg',
//                             ),
//                           ),
//                           SearchedWordsWrap(),
//                           Padding(
//                             padding: EdgeInsets.only(top: 40, bottom: 16),
//                             child: SubTitleRow(
//                               title: '최근 본 모임',
//                               icon: 'assets/icon/search/icon_recentsee_28.svg',
//                             ),
//                           )
//                         ],
//                       ),
//                     )
//                   : SliverPadding(
//                       padding: const EdgeInsets.only(top: 30),
//                       sliver: SearchResultListView(_controller),
//                     ),
//               !isSearched ? const RecentGroupListView() : const SliverToBoxAdapter(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
