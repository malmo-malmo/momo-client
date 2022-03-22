import 'package:hive/hive.dart';
import 'package:momo_flutter/data/models/auth/token_data.dart';
import 'package:momo_flutter/provider/recent_searched_data.dart';

class AppDatabase {
  AppDatabase._internal();

  static final AppDatabase _instance = AppDatabase._internal();

  factory AppDatabase() => _instance;

  static const authKey = 'auth';
  static const tokenDataKey = 'tokenData';

  static const searchBoxKey = 'searched';
  static const searchedDataKey = 'searchedData';

  TokenData? getTokenData() => Hive.box<TokenData>(authKey).get(tokenDataKey);

  Future<void> setTokenData(TokenData tokenData) {
    return Hive.box<TokenData>(authKey).put(tokenDataKey, tokenData);
  }

  RecentSearchedData? getRecentSearchedData() => Hive.box<RecentSearchedData>(searchBoxKey).get(searchedDataKey);

  Future<void> putRecentSearchedData(RecentSearchedData recentSearchedData) {
    return Hive.box<RecentSearchedData>(searchBoxKey).put(searchedDataKey, recentSearchedData);
  }
}
