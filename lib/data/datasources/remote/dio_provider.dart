import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/app_config.dart';
import 'package:momo_flutter/data/datasources/local/app_database.dart';
import 'package:momo_flutter/data/datasources/remote/auth_client_provider.dart';
import 'package:momo_flutter/data/models/auth/refresh_request.dart';
import 'package:momo_flutter/data/models/auth/token_data.dart';

final dioProvider = Provider<Dio>((ref) {
  final db = ref.watch(appDatabaseProvider);
  final tokenData = db.getTokenData() ??
      TokenData(
        accessToken: AppConfig.unknown,
        refreshToken: AppConfig.unknown,
        accessTokenType: AppConfig.unknown,
      );

  final dio = Dio(
    BaseOptions(
      headers: {
        'Authorization': '${tokenData.accessTokenType} ${tokenData.accessToken}',
      },
      connectTimeout: 10000,
    ),
  );

  final authClient = ref.watch(authClientProvider);

  dio.interceptors.add(
    QueuedInterceptorsWrapper(
      onError: (error, handler) {
        if (error.response?.statusCode == 401) {
          RequestOptions options = error.response!.requestOptions;

          authClient
              .refreshLogin(
            RefreshRequest(
              refreshToken: tokenData.refreshToken,
              deviceCode: AppConfig.deviceCode,
            ),
          )
              .then(
            (response) {
              db.setTokenData(response);
              options.headers['Authorization'] = '${response.accessTokenType} ${response.accessToken}';
            },
          ).then((e) => dio.fetch(options).then((r) => handler.resolve(r)));
        }
        return handler.next(error);
      },
    ),
  );
  return dio;
});
