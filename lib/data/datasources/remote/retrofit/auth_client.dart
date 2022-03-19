import 'package:dio/dio.dart';
import 'package:momo_flutter/app_config.dart';
import 'package:momo_flutter/data/models/auth/login_request.dart';
import 'package:momo_flutter/data/models/auth/refresh_request.dart';
import 'package:momo_flutter/data/models/auth/token_data.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_client.g.dart';

@RestApi(baseUrl: AppConfig.baseUrl)
abstract class AuthClient {
  factory AuthClient(
    Dio dio, {
    String baseUrl,
  }) = _AuthClient;

  @POST('/oauth/login')
  Future<TokenData> login(
    @Body() LoginRequest loginRequest,
  );

  @POST('/oauth/login/refresh')
  Future<TokenData> refreshLogin(
    @Body() RefreshRequest refreshRequest,
  );
}
