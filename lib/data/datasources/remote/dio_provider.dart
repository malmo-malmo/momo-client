import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:momo_flutter/data/datasources/remote/auth_client_provider.dart';
import 'package:momo_flutter/data/models/auth/refresh_request.dart';
import 'package:momo_flutter/data/models/auth/token_data.dart';

final dioProvider = Provider<Dio>((ref) {
  TokenData tokenData = Hive.box('auth').get('tokenData');

  final dio = Dio(
    BaseOptions(
      headers: {
        'Authorization': '${tokenData.accessTokenType} ${tokenData.accessToken}'
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
              .refreshLogin(RefreshRequest(
                  refreshToken: tokenData.refreshToken, deviceCode: ''))
              .then(
            (response) {
              Hive.box('auth').put('tokenData', response);
              options.headers['Authorization'] =
                  '${response.accessTokenType} ${response.accessToken}';
            },
          ).then(
            (e) => dio.fetch(options).then((r) => handler.resolve(r)),
          );
        }
        return handler.next(error);
      },
    ),
  );
  return dio;
});
