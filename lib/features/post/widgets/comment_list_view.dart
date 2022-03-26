import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:momo_flutter/app_consts.dart';
import 'package:momo_flutter/data/models/comment/comment.dart';
import 'package:momo_flutter/features/post/provider/comment_list_provider.dart';
import 'package:momo_flutter/features/post/widgets/delete_bottom_sheet.dart';
import 'package:momo_flutter/features/post/widgets/report_bottom_sheet.dart';
import 'package:momo_flutter/provider/user_provider.dart';
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
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.gray1,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileImageCard(
            img: comment.authorImage ?? AppConsts.defalutProfile,
            rad: 18,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 360 * 241,
                  child: Row(
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
                      const Spacer(),
                      Consumer(
                        builder: (context, ref, child) {
                          final userId = ref.watch(userDataStateProvider).id;
                          return InkWell(
                            onTap: userId == comment.authorId
                                ? () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (_) => DeleteBottomSheet(comment.id),
                                    );
                                  }
                                : () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (_) => ReportBottomSheet(comment.id),
                                    );
                                  },
                            child: Text(
                              userId == comment.authorId ? AppStrings.delete : AppStrings.report,
                              style: AppStyles.regular12.copyWith(
                                color: AppColors.gray5,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  comment.contents,
                  style: AppStyles.regular14.copyWith(
                    height: 22 / 14,
                    letterSpacing: -0.14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
