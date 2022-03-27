import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:momo_flutter/app_consts.dart';
import 'package:momo_flutter/data/models/group/group_response.dart';
import 'package:momo_flutter/data/repositories/group_repository.dart';
import 'package:momo_flutter/features/main/search/provider/search_data_provider.dart';

part 'search_result_provider.freezed.dart';

final isSearchedProvider = StateProvider.autoDispose<bool>((ref) => false);

final searchQueryProvider = StateProvider.autoDispose<String>((ref) => '');

final searchResultListProvider = StateNotifierProvider.autoDispose<SearchResultStateNotifier, SearchResultState>((ref) {
  final groupRepository = ref.watch(groupRepositoryProvider);
  return SearchResultStateNotifier(
    groupRepository: groupRepository,
    read: ref.read,
  );
});

final searchReulstPagingController = Provider.autoDispose<PagingController<int, GroupResponse>>(
  (ref) {
    final _pagingController = PagingController<int, GroupResponse>(firstPageKey: 0);

    final groupRepository = ref.watch(groupRepositoryProvider);
    final groupName = ref.watch(searchQueryProvider);

    Future<void> _fetchPage(int pageKey) async {
      final categories = ref.watch(categoryFilterStateProvider.notifier).makeRequestFilter();
      final cities = ref.watch(locationFilterStateProvider.notifier).makeRequestFilter();
      try {
        final newItems = await groupRepository.getGroupsBySearch(
          pageKey++,
          groupName: groupName,
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

class SearchResultStateNotifier extends StateNotifier<SearchResultState> {
  SearchResultStateNotifier({
    required this.groupRepository,
    required this.read,
  }) : super(
          SearchResultState(
            groups: [],
            nextPage: 0,
          ),
        );

  final GroupRepository groupRepository;
  final Reader read;

  Future<void> getGroups(
    int page, {
    String? groupName,
    List<String>? cities,
    List<String>? categories,
  }) async {
    try {
      final response = await groupRepository.getGroupsBySearch(
        page++,
        groupName: groupName,
        cities: cities,
        categories: categories,
      );

      state = state.copyWith(
        groups: [...state.groups, ...response],
        nextPage: response.length == AppConsts.pageSize ? page : null,
      );
    } catch (e) {
      state = state.copyWith(error: e);
    }
  }

  void reset() {
    state = state.copyWith(
      groups: [],
      nextPage: 0,
      error: null,
    );
  }
}

@freezed
class SearchResultState with _$SearchResultState {
  factory SearchResultState({
    required List<GroupResponse> groups,
    int? nextPage,
    dynamic error,
  }) = _SearchResultState;
}
