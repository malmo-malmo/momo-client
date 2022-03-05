import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:momo_flutter/data/datasources/remote/retrofit/auth_client.dart';
import 'package:momo_flutter/utils/logger/dio_logger.dart';

final authClientProvider = Provider<AuthClient>((ref) {
  final dio = Dio();
  dio.interceptors.add(DioLogger('authDio'));
  return AuthClient(dio);
});
