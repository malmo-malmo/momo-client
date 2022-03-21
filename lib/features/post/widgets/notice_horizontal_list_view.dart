import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:momo_flutter/data/models/enum/post_type.dart';
import 'package:momo_flutter/data/models/post/post_response.dart';
import 'package:momo_flutter/features/post/notice_list_page.dart';
import 'package:momo_flutter/features/post/post_detail_page.dart';
import 'package:momo_flutter/features/post/provider/post_list_provider.dart';
import 'package:momo_flutter/resources/app_error_strings.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/widgets/card/empty_item_card.dart';
import 'package:momo_flutter/widgets/indicator/loading_indicator.dart';
import 'package:momo_flutter/widgets/title/sub_title.dart';

class NoticeHorizontalListView extends ConsumerStatefulWidget {
  const NoticeHorizontalListView(this.groupId, {Key? key}) : super(key: key);

  final int groupId;

  @override
  ConsumerState<NoticeHorizontalListView> createState() => _NoticeHorizontalListViewState();
}

class _NoticeHorizontalListViewState extends ConsumerState<NoticeHorizontalListView> {
  final _pagingController = PagingController<int, PostResponse>(firstPageKey: 0);

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener(
      (pageKey) => ref.read(noticeListStateProvider(widget.groupId).notifier).getPosts(
            page: pageKey,
            postType: PostType.NOTICE,
          ),
    );
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
      (pre, next) {
        _pagingController.value = PagingState(
          itemList: next.posts,
          nextPageKey: next.nextPage,
          error: next.error,
        );
      },
    );

    return SizedBox(
      height: 182,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SubTitle(PostType.NOTICE.postTypeToName),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      NoticeListPage.routeName,
                      arguments: widget.groupId,
                    );
                  },
                  child: Transform.rotate(
                    angle: pi,
                    child: const Icon(
                      CupertinoIcons.back,
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 17),
            SizedBox(
              height: 86,
              child: PagedListView.separated(
                pagingController: _pagingController,
                scrollDirection: Axis.horizontal,
                builderDelegate: PagedChildBuilderDelegate<PostResponse>(
                  itemBuilder: (context, item, index) => _NoticeCard(item),
                  newPageProgressIndicatorBuilder: (context) => const LoadingIndicator(),
                  firstPageProgressIndicatorBuilder: (context) => const LoadingIndicator(),
                  noItemsFoundIndicatorBuilder: (context) => const EmptyItemCard(AppErrorString.noticeEmpty),
                ),
                separatorBuilder: (context, index) => const SizedBox(width: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NoticeCard extends StatelessWidget {
  const _NoticeCard(
    this.post, {
    Key? key,
  }) : super(key: key);

  final PostResponse post;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        PostDetailPage.routeName,
        arguments: post.id,
      ),
      child: Container(
        height: 86,
        width: 304,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.purple,
        ),
        child: Center(
          child: Text(
            post.title,
            style: AppStyles.bold16.copyWith(
              color: AppColors.gray0,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
