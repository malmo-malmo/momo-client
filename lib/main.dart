import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:momo_flutter/app.dart';
import 'package:momo_flutter/app_config.dart';
import 'package:momo_flutter/utils/logger/provider_log.dart';

void main() async {
  await Hive.initFlutter();
  KakaoSdk.init(nativeAppKey: AppConfig.kakaoNaitiveAppKey);
  runApp(
    ProviderScope(
      child: const App(),
      observers: [
        ProviderLogger(),
      ],
    ),
  );
}
