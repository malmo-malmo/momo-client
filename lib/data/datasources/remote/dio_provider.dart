import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/app_config.dart';
import 'package:momo_flutter/data/datasources/local/app_database.dart';
import 'package:momo_flutter/data/models/auth/token_data.dart';
import 'package:momo_flutter/utils/logger/dio_logger.dart';

final dioProvider = Provider<Dio>(
  (ref) {
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

    dio.interceptors.add(DioLogger('dio'));

    final authDio = Dio()..interceptors.add(DioLogger('authdio'));

    dio.interceptors.add(
      QueuedInterceptorsWrapper(
        onError: (error, handler) async {
          if (error.response?.statusCode == 401) {
            RequestOptions options = error.response!.requestOptions;
            await authDio.post(
              AppConfig.baseUrl + '/oauth/login/refresh',
              data: {
                'refreshToken': tokenData.refreshToken,
                'deviceCode': AppConfig.deviceCode,
              },
            ).then(
              (response) {
                final _tokenData = TokenData.fromJson(response.data);
                db.setTokenData(_tokenData);
                options.headers['Authorization'] = '${_tokenData.accessTokenType} ${_tokenData.accessToken}';
              },
            ).then(
              (value) => dio.fetch(options).then(
                    (value) => handler.resolve(value),
                  ),
              onError: (e) => handler.reject(e),
            );
            return;
          }
          return handler.next(error);
        },
      ),
    );
    return dio;
  },
);
