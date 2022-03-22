import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:momo_flutter/app_consts.dart';
import 'package:momo_flutter/data/models/group/group_response.dart';
import 'package:momo_flutter/data/repositories/group_repository.dart';
import 'package:momo_flutter/features/main/search/provider/search_data_provider.dart';

final isSearchedProvider = StateProvider<bool>((ref) => false);

final searchReulstPagingController = Provider.autoDispose<PagingController<int, GroupResponse>>(
  (ref) {
    final _pagingController = PagingController<int, GroupResponse>(firstPageKey: 0);

    final groupRepository = ref.watch(groupRepositoryProvider);

    Future<void> _fetchPage(int pageKey) async {
      final categories = ref.watch(categoryFilterStateProvider.notifier).makeRequestFilter();
      final cities = ref.watch(locationFilterStateProvider.notifier).makeRequestFilter();
      try {
        final newItems = await groupRepository.getGroupsBySearch(
          pageKey++,
          categories: categories,
          cities: cities,
        );
        final isLastPage = newItems.length < AppConsts.pageSize;

        if (isLastPage) {
          _pagingController.appendLastPage(newItems);
        } else {
          _pagingController.appendPage(newItems, pageKey);
        }
      } catch (error) {
        _pagingController.error = error;
      }
    }

    _pagingController.addPageRequestListener((pageKey) => _fetchPage(pageKey));

    return _pagingController;
  },
);
