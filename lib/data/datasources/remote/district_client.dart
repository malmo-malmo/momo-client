import 'package:dio/dio.dart';
import 'package:momo_flutter/app_config.dart';
import 'package:momo_flutter/data/models/common/code_name_pair.dart';
import 'package:momo_flutter/data/models/common/district_response.dart';
import 'package:retrofit/retrofit.dart';

part 'district_client.g.dart';

@RestApi(baseUrl: AppConfig.baseUrl)
abstract class DistrictClient {
  factory DistrictClient(
    Dio dio, {
    String baseUrl,
  }) = _DistrictClient;

  @GET('/district/cities')
  Future<List<CodeNamePair>> getCities();

  @GET('/district/districts')
  Future<List<DistrictResponse>> getDistricts(
    @Query('cityCode') String cityCode,
  );
}
