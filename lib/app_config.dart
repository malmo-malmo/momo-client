import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:momo_flutter/data/datasources/local/app_database.dart';
import 'package:momo_flutter/data/datasources/remote/retrofit/district_client.dart';
import 'package:momo_flutter/data/datasources/remote/retrofit/group_client.dart';
import 'package:momo_flutter/data/models/auth/token_data.dart';
import 'package:momo_flutter/data/models/common/code_name_pair.dart';
import 'package:momo_flutter/provider/recent_searched_data.dart';

abstract class AppConfig {
  static const baseUrl = 'http://gunimon.iptime.org:8100/api';
  static const kakaoNaitiveAppKey = '51af7920a3ab81a3de0020af102e70cd';

  static const unknown = 'unknown';

  static late List<CodeNamePair> categoryCodeNamePair;
  static late List<CodeNamePair> locationCodeNamePair;
  static late String deviceCode;

  static Future<void> initConfig() async {
    await Hive.initFlutter();
    Hive.registerAdapter(TokenDataAdapter());
    Hive.registerAdapter(RecentSearchedDataAdapter());
    await Hive.openBox<TokenData>(AppDatabase.authKey);
    await Hive.openBox<TokenData>(AppDatabase.searchBoxKey);
    final androidInfo = await DeviceInfoPlugin().androidInfo;
    deviceCode = androidInfo.androidId ?? unknown;
  }

  static void initCategoryAndLocation() async {
    // final dio = Dio();
    // categoryCodeNamePair = await GroupClient(dio).getGroupCategories();
    // locationCodeNamePair = await DistrictClient(dio).getCities();
  }
}
