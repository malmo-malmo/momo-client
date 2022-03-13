import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:momo_flutter/data/models/management/management_post_response.dart';
import 'package:momo_flutter/features/post/provider/manage_post_provider.dart';
import 'package:momo_flutter/features/post/widgets/manage_post_card.dart';
import 'package:momo_flutter/resources/app_error_strings.dart';
import 'package:momo_flutter/resources/resources.dart';
import 'package:momo_flutter/widgets/card/empty_item_card.dart';
import 'package:momo_flutter/widgets/indicator/loading_indicator.dart';

class ManagePostPage extends ConsumerStatefulWidget {
  const ManagePostPage({Key? key}) : super(key: key);

  static const routeName = 'ManagePostPage';

  @override
  ConsumerState<ManagePostPage> createState() => _ManagePostPageState();
}

class _ManagePostPageState extends ConsumerState<ManagePostPage> {
  final _pagingController = PagingController(firstPageKey: 0);

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener(
      (pageKey) => ref.read(managePostStateProvider.notifier).getManagePosts(pageKey),
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<ManagePostState>(
      managePostStateProvider,
      (pre, next) => _pagingController.value = PagingState(
        itemList: next.managePosts,
        nextPageKey: next.nextPage,
        error: next.error,
      ),
    );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(CupertinoIcons.back),
          ),
          backgroundColor: AppColors.backgroundWhite,
          title: const Text(AppStrings.managementPost),
        ),
        backgroundColor: AppColors.gray1,
        body: PagedListView.separated(
          padding: const EdgeInsets.only(top: 14, right: 16, left: 16),
          builderDelegate: PagedChildBuilderDelegate<ManagementPostResponse>(
            itemBuilder: (context, item, index) => ManagePostCard(item),
            newPageProgressIndicatorBuilder: (context) => const LoadingIndicator(),
            firstPageProgressIndicatorBuilder: (context) => const LoadingIndicator(),
            noItemsFoundIndicatorBuilder: (context) => const EmptyItemCard(AppErrorString.managePostEmpty),
          ),
          pagingController: _pagingController,
          separatorBuilder: (context, index) => const SizedBox(height: 14),
        ),
      ),
    );
  }
}
