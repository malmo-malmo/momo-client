import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:momo_flutter/data/datasources/local/app_database.dart';
import 'package:momo_flutter/data/models/group/group_response.dart';
import 'package:momo_flutter/data/repositories/group_repository.dart';

part 'recent_searched_data.g.dart';
part 'recent_searched_data.freezed.dart';

final searchedDataStateProvider = StateNotifierProvider<RecentSearchedDataStateNotifier, RecentSearchedDataState>(
  (ref) {
    final groupRepository = ref.watch(groupRepositoryProvider);
    final searchedData = Hive.box<RecentSearchedData>(AppDatabase.searchBoxKey).get(AppDatabase.searchedDataKey);
    return RecentSearchedDataStateNotifier(
      groupIds: searchedData?.groupIds ?? [],
      words: searchedData?.words ?? [],
      groupRepository: groupRepository,
    );
  },
);

class RecentSearchedDataStateNotifier extends StateNotifier<RecentSearchedDataState> {
  RecentSearchedDataStateNotifier({
    required this.groupIds,
    required this.words,
    required this.groupRepository,
  }) : super(
          RecentSearchedDataState(
            words: words,
            groupIds: groupIds,
            groups: [],
            isLoading: false,
          ),
        );

  final List<String> words;
  final List<int> groupIds;
  final GroupRepository groupRepository;

  void addSearchedWord(String newWord) async {
    var curWords = state.words;
    curWords.remove(newWord);
    curWords.insert(0, newWord);
    if (curWords.length == 6) {
      curWords.removeLast();
    }

    state = state.copyWith(words: [...curWords]);
    await AppDatabase().putRecentSearchedData(RecentSearchedData(
      words: state.words,
      groupIds: state.groupIds,
    ));
  }

  void deleteSearchedWord(String word) async {
    var curWords = state.words;
    curWords.remove(word);
    state = state.copyWith(words: [...curWords]);

    await AppDatabase().putRecentSearchedData(RecentSearchedData(
      words: state.words,
      groupIds: state.groupIds,
    ));
  }

  void getRecentGroups() async {}
}

@freezed
class RecentSearchedDataState with _$RecentSearchedDataState {
  factory RecentSearchedDataState({
    required List<String> words,
    required List<int> groupIds,
    required List<GroupResponse> groups,
    required bool isLoading,
  }) = _RecentSearchDataState;
}

@freezed
class RecentSearchedData with _$RecentSearchedData {
  @HiveType(typeId: 2, adapterName: 'RecentSearchedDataAdapter')
  factory RecentSearchedData({
    @HiveField(0) required List<String> words,
    @HiveField(1) required List<int> groupIds,
  }) = _RecentSearchedData;
}
