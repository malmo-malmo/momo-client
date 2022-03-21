import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:momo_flutter/data/models/enum/post_type.dart';
import 'package:momo_flutter/data/models/post/post_response.dart';
import 'package:momo_flutter/features/post/provider/post_list_provider.dart';
import 'package:momo_flutter/features/post/widgets/post_card.dart';
import 'package:momo_flutter/resources/app_error_strings.dart';
import 'package:momo_flutter/widgets/card/empty_item_card.dart';
import 'package:momo_flutter/widgets/indicator/loading_indicator.dart';

class PostListView extends ConsumerStatefulWidget {
  const PostListView(
    this.groupId, {
    Key? key,
  }) : super(key: key);

  final int groupId;

  @override
  ConsumerState<PostListView> createState() => _PostListViewState();
}

class _PostListViewState extends ConsumerState<PostListView> {
  final _pagingController = PagingController<int, PostResponse>(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener(
      (pageKey) => ref.read(postListStateProvider(widget.groupId).notifier).getPosts(
            page: pageKey,
            postType: PostType.NORMAL,
          ),
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
      postListStateProvider(widget.groupId),
      (previous, next) {
        _pagingController.value = PagingState(
          itemList: next.posts,
          nextPageKey: next.nextPage,
          error: next.error,
        );
      },
    );

    return PagedSliverList<int, PostResponse>(
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<PostResponse>(
        itemBuilder: (context, item, index) => PostCard(item),
        newPageProgressIndicatorBuilder: (context) => const LoadingIndicator(),
        firstPageProgressIndicatorBuilder: (context) => const LoadingIndicator(),
        noItemsFoundIndicatorBuilder: (context) => const EmptyItemCard(AppErrorString.postEmpty),
      ),
    );
  }
}
