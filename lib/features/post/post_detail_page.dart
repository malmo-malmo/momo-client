import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/features/post/provider/comment_list_provider.dart';
import 'package:momo_flutter/features/post/provider/post_detail_provider.dart';
import 'package:momo_flutter/features/post/widgets/comment_list_view.dart';
import 'package:momo_flutter/features/post/widgets/post_detail_card.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/utils/load_asset.dart';
import 'package:momo_flutter/widgets/indicator/loading_indicator.dart';
import 'package:momo_flutter/widgets/input_field/floating_input_field.dart';

class PostDetailPage extends ConsumerWidget {
  const PostDetailPage(this.postId, {Key? key}) : super(key: key);

  static const routeName = 'PostDetailPage';

  final int postId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postDetail = ref.watch(postDetailStateProvider(postId));

    if (postDetail.authorId == -1) {
      return const Scaffold(
        body: LoadingIndicator(),
      );
    }
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(CupertinoIcons.back),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: InkWell(
                  child: loadAsset(
                    AppIcons.ooo,
                  ),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      PostDetailCard(postDetail),
                      CommentListView(postDetail.id),
                    ],
                  ),
                ),
                FloatingInputField(
                  hintText: AppStrings.commentHint,
                  sendMessage: (text) async {
                    await ref.read(commentListStateProvider(postDetail.id).notifier).createComment(text);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
