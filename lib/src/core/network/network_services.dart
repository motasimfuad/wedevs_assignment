import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:motasimfuad_wedevs/src/core/cache/cache_service.dart';

class NetworkService {
  final Dio _dio = Dio();
  final Options _options = Options();

  Future<Response<dynamic>> post(
    String path,
    Map<String, dynamic> data, {
    bool needToken = false,
    Map<String, dynamic>? headers,
  }) async {
    _setDioInterceptorList();
    final apiToken = CacheService().getToken();

    _options.headers = <String, dynamic>{
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      if (needToken) 'Authorization': 'Bearer $apiToken',
    };

    _options.responseType = ResponseType.json;

    if (headers != null) {
      _options.headers?.addAll(headers);
    }

    return _dio
        .post(
          path,
          data: data,
          options: _options,
        )
        .then(
          (value) => value,
        )
        .catchError(
          (error) => throw error,
        );
  }

  void _setDioInterceptorList() async {
    List<Interceptor> interceptorList = [];
    _dio.interceptors.clear();

    if (kDebugMode) {
      interceptorList.add(_CustomLoggerInterceptor());
    }

    _dio.interceptors.addAll(interceptorList);
  }
}

class _CustomLoggerInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('Request: ${options.path}, ${options.data}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('Response: ${response.statusCode}, ${response.data}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log('Error: ${err.message}');
    super.onError(err, handler);
  }
}
