import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/app_config.dart';
import 'package:momo_flutter/data/datasources/local/app_database.dart';
import 'package:momo_flutter/data/models/auth/token_data.dart';
import 'package:momo_flutter/utils/logger/dio_logger.dart';

final dioProvider = Provider<Dio>(
  (ref) {
    final tokenData = AppDatabase().getTokenData() ??
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

    final authDio = Dio()..interceptors.add(DioLogger('authdio'));
    dio.interceptors.add(DioLogger('dio'));
    dio.interceptors.add(
      QueuedInterceptorsWrapper(
        onRequest: (options, handler) {
          final _tokenData = AppDatabase().getTokenData();
          if (options.headers['Authorization'] !=
              '${_tokenData!.accessTokenType} ${_tokenData.accessToken}') {
            options.headers['Authorization'] =
                '${_tokenData.accessTokenType} ${_tokenData.accessToken}';
            handler.next(options);
          } else {
            return handler.next(options);
          }
        },
        onError: (error, handler) {
          final _tokenData = AppDatabase().getTokenData();
          if (error.response?.statusCode == 401) {
            RequestOptions options = error.response!.requestOptions;
            if (options.headers['Authorization'] !=
                '${_tokenData!.accessTokenType} ${_tokenData.accessToken}') {
              options.headers['Authorization'] =
                  '${_tokenData.accessTokenType} ${_tokenData.accessToken}';
              dio.fetch(options).then(
                    (r) => handler.resolve(r),
                    onError: (e) => handler.reject(e),
                  );
              return;
            }
            authDio.post(
              AppConfig.baseUrl + '/oauth/login/refresh',
              data: {
                'refreshToken': tokenData.refreshToken,
                'deviceCode': AppConfig.deviceCode,
              },
            ).then(
              (response) async {
                final _tokenData = TokenData.fromJson(response.data);
                await AppDatabase().setTokenData(_tokenData);
                options.headers['Authorization'] =
                    '${_tokenData.accessTokenType} ${_tokenData.accessToken}';
              },
            ).then(
              (_) => dio.fetch(options).then((value) => handler.resolve(value)),
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
