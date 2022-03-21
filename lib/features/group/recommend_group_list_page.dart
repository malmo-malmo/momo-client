import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:momo_flutter/app_config.dart';
import 'package:momo_flutter/app_consts.dart';
import 'package:momo_flutter/data/models/group/group_response.dart';
import 'package:momo_flutter/features/group/providers/group_category_check_provider.dart';
import 'package:momo_flutter/features/group/providers/group_list_provider.dart';
import 'package:momo_flutter/resources/app_error_strings.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/utils/load_asset.dart';
import 'package:momo_flutter/widgets/button/header_chat_button.dart';
import 'package:momo_flutter/widgets/card/empty_item_card.dart';
import 'package:momo_flutter/widgets/card/group_card.dart';
import 'package:momo_flutter/widgets/indicator/loading_indicator.dart';

class RecommendGroupListPage extends ConsumerStatefulWidget {
  const RecommendGroupListPage(this.likeCallback, {Key? key}) : super(key: key);

  final void Function({
    required int groupId,
    required bool like,
  }) likeCallback;

  static const routeName = 'RecommendGroupListPage';

  @override
  ConsumerState<RecommendGroupListPage> createState() => _RecommendGroupListPageState();
}

class _RecommendGroupListPageState extends ConsumerState<RecommendGroupListPage> {
  final _pagingController = PagingController<int, GroupResponse>(
    firstPageKey: 0,
  );

  @override
  void initState() {
    _pagingController.addPageRequestListener(
      (pageKey) => ref.read(groupListStateProvider.notifier).getGroupsByCategoriesDetail(
            pageKey,
            ref.read(groupCategoryCheckStateProvider.notifier).makeFilter(),
          ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<GroupListState>(
      groupListStateProvider,
      (pre, next) {
        _pagingController.value = PagingState(
          itemList: next.groups,
          nextPageKey: next.nextPage,
          error: next.error,
        );
      },
    );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(CupertinoIcons.back),
          ),
          title: const Text(AppStrings.recommendation + AppStrings.more),
          actions: const [
            HeaderChatButton(),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _CategoryList(
                refresh: () {
                  ref.read(groupListStateProvider.notifier).resetGroups();
                  _pagingController.refresh();
                },
              ),
              Expanded(
                child: PagedGridView(
                  pagingController: _pagingController,
                  builderDelegate: PagedChildBuilderDelegate<GroupResponse>(
                    newPageProgressIndicatorBuilder: (context) => const LoadingIndicator(),
                    firstPageProgressIndicatorBuilder: (context) => const LoadingIndicator(),
                    noItemsFoundIndicatorBuilder: (context) => const EmptyItemCard(AppErrorString.homeGroupEmpty),
                    itemBuilder: (context, item, index) => GroupCard(
                      item,
                      setLike: () async {
                        if (item.favoriteGroup) {
                          await ref.read(groupListStateProvider.notifier).deleteLike(index);
                          widget.likeCallback(groupId: item.id, like: false);
                        } else {
                          await ref.read(groupListStateProvider.notifier).createLike(index);
                          widget.likeCallback(groupId: item.id, like: true);
                        }
                      },
                      width: MediaQuery.of(context).size.width / 360 * 157,
                      height: MediaQuery.of(context).size.width / 360 * 200,
                    ),
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: MediaQuery.of(context).size.width / 360 * 200,
                    mainAxisSpacing: 14,
                    crossAxisSpacing: 14,
                    childAspectRatio: 100 / 150,
                  ),
                  showNewPageProgressIndicatorAsGridChild: false,
                  showNewPageErrorIndicatorAsGridChild: false,
                  showNoMoreItemsIndicatorAsGridChild: false,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryList extends ConsumerWidget {
  const _CategoryList({
    Key? key,
    required this.refresh,
  }) : super(key: key);

  final Function refresh;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checks = ref.watch(groupCategoryCheckStateProvider);

    return SizedBox(
      height: 80,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 18),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return _CatogoryFilterCard(
            check: checks[index],
            index: index,
            name: index == 0 ? '맞춤추천' : AppConfig.categoryCodeNamePair[index - 1].name,
            refresh: refresh,
          );
        },
        itemCount: 9,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
      ),
    );
  }
}

class _CatogoryFilterCard extends ConsumerWidget {
  const _CatogoryFilterCard({
    Key? key,
    required this.name,
    required this.index,
    required this.check,
    required this.refresh,
  }) : super(key: key);

  final String name;
  final int index;
  final bool check;
  final Function refresh;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      borderRadius: BorderRadius.circular(22),
      onTap: () {
        ref.read(groupCategoryCheckStateProvider.notifier).toggleCategory(index);
        refresh();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        height: 44,
        width: 67 + name.length * 13,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: name == '맞춤추천'
              ? (check ? AppColors.lightPurple : AppColors.gray1)
              : (check ? AppColors.gray5 : AppColors.gray1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            name == '맞춤추천'
                ? loadAsset('assets/icon/home/icon_recommend_28.svg', width: 28)
                : loadAsset(AppConsts.categoryIconOn[index], width: 28),
            Text(
              name,
              style: AppStyles.regular14.copyWith(
                color: check ? AppColors.gray0 : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
