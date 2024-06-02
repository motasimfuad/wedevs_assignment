import 'package:dio/dio.dart';
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
    final apiToken = CacheService().getToken();

    _options.headers = <String, dynamic>{
      'Accept': 'application/json',
      'Content-type': 'application/json',
      if (needToken) 'Authorization': 'Bearer $apiToken',
    };

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
        );
  }
}
