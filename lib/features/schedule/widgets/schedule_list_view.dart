import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:momo_flutter/data/models/schedule/schedule_detail_response.dart';
import 'package:momo_flutter/features/schedule/provider/schedule_list_provider.dart';
import 'package:momo_flutter/features/schedule/widgets/admin_schedule_card.dart';
import 'package:momo_flutter/features/schedule/widgets/schedule_card.dart';
import 'package:momo_flutter/provider/user_provider.dart';
import 'package:momo_flutter/resources/app_error_strings.dart';
import 'package:momo_flutter/widgets/card/empty_item_card.dart';
import 'package:momo_flutter/widgets/indicator/loading_indicator.dart';

class ScheduleListView extends ConsumerStatefulWidget {
  const ScheduleListView(this.groupId, {Key? key}) : super(key: key);

  final int groupId;

  @override
  ConsumerState<ScheduleListView> createState() => _ScheduleListViewState();
}

class _ScheduleListViewState extends ConsumerState<ScheduleListView> {
  final PagingController<int, ScheduleDetailResponse> _pagingController = PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener(
      (pageKey) => ref.read(scheduleDetailListProvider(widget.groupId).notifier).getSchedules(pageKey),
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
    ref.listen<ScheduleListState>(
      scheduleDetailListProvider(widget.groupId),
      (previous, next) {
        _pagingController.value = PagingState(
          itemList: next.schedules,
          nextPageKey: next.nextPage,
          error: next.error,
        );
      },
    );
    final userId = ref.watch(userDataStateProvider).id;
    final manageId = ref.watch(scheduleDetailListProvider(widget.groupId)).manageId;

    return PagedSliverList.separated(
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<ScheduleDetailResponse>(
        itemBuilder: (context, item, index) {
          return manageId == userId
              ? AdminScheduleCard(
                  groupId: widget.groupId,
                  schedule: item,
                  index: index,
                )
              : ScheduleCard(item);
        },
        newPageProgressIndicatorBuilder: (context) => const LoadingIndicator(),
        firstPageProgressIndicatorBuilder: (context) => const LoadingIndicator(),
        noItemsFoundIndicatorBuilder: (context) => const EmptyItemCard(AppErrorString.scheduleEmpty),
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 14),
    );
  }
}
