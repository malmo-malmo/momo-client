import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:momo_flutter/data/models/group/group_response.dart';
import 'package:momo_flutter/features/group/providers/group_list_provider.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/utils/load_asset.dart';
import 'package:momo_flutter/widgets/card/group_card.dart';

class GroupListArg {
  final String name;
  final void Function({
    required int groupId,
    required bool like,
  }) likeCallback;

  GroupListArg({
    required this.name,
    required this.likeCallback,
  });
}

class GroupListPage extends ConsumerStatefulWidget {
  const GroupListPage({
    Key? key,
    required this.name,
    required this.likeCallback,
  }) : super(key: key);

  final String name;
  final void Function({
    required int groupId,
    required bool like,
  }) likeCallback;

  static const routeName = 'GroupListPage';

  @override
  ConsumerState<GroupListPage> createState() => _GroupListPageState();
}

class _GroupListPageState extends ConsumerState<GroupListPage> {
  final _pagingController = PagingController<int, GroupResponse>(
    firstPageKey: 0,
  );

  @override
  void initState() {
    if (widget.name == AppStrings.myUniversity) {
      _pagingController.addPageRequestListener(
        (pageKey) => ref.read(groupListStateProvider.notifier).getGroupsByUniversity(pageKey),
      );
    } else {
      _pagingController.addPageRequestListener(
        (pageKey) => ref.read(groupListStateProvider.notifier).getGroupsByDistrict(pageKey),
      );
    }
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
          title: Text(widget.name + AppStrings.more),
          actions: [
            loadAsset(AppIcons.chat),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: PagedGridView(
                  pagingController: _pagingController,
                  builderDelegate: PagedChildBuilderDelegate<GroupResponse>(
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
                    ),
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 200,
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