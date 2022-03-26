import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:momo_flutter/data/models/enum/post_type.dart';
import 'package:momo_flutter/data/models/post/post_response.dart';
import 'package:momo_flutter/features/post/provider/post_list_provider.dart';
import 'package:momo_flutter/features/post/widgets/post_card.dart';
import 'package:momo_flutter/resources/app_error_strings.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/utils/load_asset.dart';
import 'package:momo_flutter/widgets/card/empty_item_card.dart';
import 'package:momo_flutter/widgets/indicator/loading_indicator.dart';

class NoticeListPage extends ConsumerStatefulWidget {
  const NoticeListPage(this.groupId, {Key? key}) : super(key: key);

  static const routeName = 'NoticeListPage';

  final int groupId;

  @override
  ConsumerState<NoticeListPage> createState() => _NoticeListPageState();
}

class _NoticeListPageState extends ConsumerState<NoticeListPage> {
  final _pagingController = PagingController<int, PostResponse>(firstPageKey: 0);
  @override
  void initState() {
    _pagingController.value = PagingState(
      itemList: ref.read(noticeListStateProvider(widget.groupId)).posts,
      nextPageKey: ref.read(noticeListStateProvider(widget.groupId)).nextPage,
      error: ref.read(noticeListStateProvider(widget.groupId)).error,
    );
    _pagingController.addPageRequestListener(
      (_) => ref.read(noticeListStateProvider(widget.groupId).notifier).getPosts(postType: PostType.NOTICE),
    );

    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<PostListState>(
      noticeListStateProvider(widget.groupId),
      (previous, next) {
        _pagingController.value = PagingState(
          itemList: next.posts,
          nextPageKey: next.nextPage,
          error: next.error,
        );
      },
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.gray1,
        appBar: AppBar(
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(CupertinoIcons.back),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: InkWell(
                onTap: () {},
                child: loadAsset(AppIcons.chat),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: SizedBox(height: 24),
              ),
              PagedSliverList<int, PostResponse>(
                pagingController: _pagingController,
                builderDelegate: PagedChildBuilderDelegate<PostResponse>(
                  itemBuilder: (context, item, index) => PostCard(item),
                  newPageProgressIndicatorBuilder: (context) => const LoadingIndicator(),
                  firstPageProgressIndicatorBuilder: (context) => const LoadingIndicator(),
                  noItemsFoundIndicatorBuilder: (context) => const EmptyItemCard(AppErrorString.noticeEmpty),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
