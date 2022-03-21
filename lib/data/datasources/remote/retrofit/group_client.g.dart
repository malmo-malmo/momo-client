// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _GroupClient implements GroupClient {
  _GroupClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://gunimon.iptime.org:8100/api';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<GroupDetailResponse> getGroupDetail(groupId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GroupDetailResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/group/${groupId}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GroupDetailResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<List<CodeNamePair>> getGroupCategories() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<CodeNamePair>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/group/categories',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => CodeNamePair.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<GroupResponse>> getGroupsBySearch(
      page, size, categories, cities) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'size': size,
      r'categories': categories,
      r'cities': cities
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<GroupResponse>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/groups/search/paging',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => GroupResponse.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<GroupResponse>> getGroupsByCategories(page, size) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'page': page, r'size': size};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<GroupResponse>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/groups/user-categories/paging',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => GroupResponse.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<GroupResponse>> getGroupsByDistrict(page, size) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'page': page, r'size': size};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<GroupResponse>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/groups/user-district/paging',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => GroupResponse.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<GroupResponse>> getGroupsByUniversity(page, size) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'page': page, r'size': size};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<GroupResponse>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/groups/user-university/paging',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => GroupResponse.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<dynamic> participantGroup(groupId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = groupId;
    final _result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/group/apply-participant',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> withdrawalGroup(groupId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'DELETE', headers: _headers, extra: _extra)
            .compose(_dio.options, '/group/${groupId}/participant',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<List<ParticipantUserResponse>> getParticipantUsers(groupId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'groupId': groupId};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<ParticipantUserResponse>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/group/participants',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) =>
            ParticipantUserResponse.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<dynamic> endGroup(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'PATCH', headers: _headers, extra: _extra)
            .compose(_dio.options, '/group/${id}/end',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> managerGroup(id, userId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'PATCH', headers: _headers, extra: _extra)
            .compose(_dio.options, '/group/${id}/manager/${userId}',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
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
