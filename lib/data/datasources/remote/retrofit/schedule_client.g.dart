// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _ScheduleClient implements ScheduleClient {
  _ScheduleClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://gunimon.iptime.org:8100/api';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ScheduleDetailResponse> createSchedule(scheduleRequest) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(scheduleRequest.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ScheduleDetailResponse>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/schedule',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ScheduleDetailResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ScheduleResponse> getSchedules(groupId, page, size) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'groupId': groupId,
      r'page': page,
      r'size': size
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ScheduleResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/schedule/group-schedules',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ScheduleResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<List<ScheduleSummaryResponse>> getUserSchedules(
      searchStartDate, searchEndDate) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'searchStartDate': searchStartDate,
      r'searchEndDate': searchEndDate
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<ScheduleSummaryResponse>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/schedule/user-schedules',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) =>
            ScheduleSummaryResponse.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<UpcomingScheduleResponse> getUpcomingSchedule(groupId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'groupId': groupId};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UpcomingScheduleResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/schedule/upcoming',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UpcomingScheduleResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
