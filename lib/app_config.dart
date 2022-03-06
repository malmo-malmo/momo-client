import 'package:hive_flutter/hive_flutter.dart';
import 'package:momo_flutter/data/models/auth/token_data.dart';

abstract class AppConfig {
  static const baseUrl = 'http://gunimon.iptime.org:8100/api';
  static const kakaoNaitiveAppKey = '51af7920a3ab81a3de0020af102e70cd';

  static void initConfig() async {
    await Hive.initFlutter();
    Hive.registerAdapter(TokenDataAdapter());
    await Hive.openBox('auth');
  }
}
