import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:momo_flutter/data/models/auth/token_data.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) => const AppDatabase());

class AppDatabase {
  const AppDatabase();

  static const authKey = 'auth';
  static const tokenDataKey = 'tokenData';

  TokenData? getTokenData() => Hive.box<TokenData>(authKey).get(tokenDataKey);

  void setTokenData(TokenData tokenData) async {
    await Hive.box<TokenData>(authKey).put(tokenDataKey, tokenData);
  }
}
