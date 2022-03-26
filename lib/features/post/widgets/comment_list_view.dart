import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:momo_flutter/data/models/comment/comment.dart';
import 'package:momo_flutter/features/post/provider/comment_list_provider.dart';
import 'package:momo_flutter/resources/app_error_strings.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/utils/format/post_card_date_format.dart';
import 'package:momo_flutter/widgets/card/empty_item_card.dart';
import 'package:momo_flutter/widgets/card/profile_image_card.dart';
import 'package:momo_flutter/widgets/indicator/loading_indicator.dart';

class CommentListView extends ConsumerStatefulWidget {
  const CommentListView(this.postId, {Key? key}) : super(key: key);

  final int postId;

  @override
  ConsumerState<CommentListView> createState() => _CommentListViewState();
}

class _CommentListViewState extends ConsumerState<CommentListView> {
  final _pagingController = PagingController<int, Comment>(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener(
      (_) => ref.read(commentListStateProvider(widget.postId).notifier).getComments(),
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
    ref.listen<CommentListState>(
      commentListStateProvider(widget.postId),
      (pre, next) {
        _pagingController.value = PagingState(
          itemList: next.comments,
          nextPageKey: next.nextPage,
          error: next.error,
        );
      },
    );

    return PagedSliverList<int, Comment>.separated(
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<Comment>(
        itemBuilder: (context, item, index) => _CommentCard(item),
        newPageProgressIndicatorBuilder: (context) => const LoadingIndicator(),
        firstPageProgressIndicatorBuilder: (context) => const LoadingIndicator(),
        noItemsFoundIndicatorBuilder: (context) => const EmptyItemCard(AppErrorString.commentEmpty),
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 10),
    );
  }
}

class _CommentCard extends StatelessWidget {
  const _CommentCard(this.comment, {Key? key}) : super(key: key);

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.gray1,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ProfileImageCard(
                img: comment.authorImage ??
                    'https://biz.chosun.com/resizer/kh_pcdsIH0PJWIXenLBD4Oi94Wg=/464x0/smart/cloudfront-ap-northeast-1.images.arcpublishing.com/chosunbiz/HAXYB5XB4CCHXUB6VQVALOZFVY.jpg',
                rad: 18,
              ),
              const SizedBox(width: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        comment.authorNickname,
                        style: AppStyles.bold16,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        !comment.createdDate.contains('-')
                            ? comment.createdDate
                            : postCardDateFormat(comment.createdDate),
                        style: AppStyles.regular12.copyWith(
                          color: AppColors.gray4,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    comment.contents,
                    style: AppStyles.regular14,
                  ),
                ],
              ),
            ],
          ),
          Text(
            AppStrings.delete,
            style: AppStyles.regular12.copyWith(
              color: AppColors.gray5,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}
