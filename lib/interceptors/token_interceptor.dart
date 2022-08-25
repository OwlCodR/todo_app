import 'package:dio/dio.dart';

import '../utils/logger.dart';

class TokenInterceptors extends Interceptor {
  TokenInterceptors(this._token);
  final String _token;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({'Authorization': 'Bearer $_token'});

    log.d('REQUEST[${options.method}] => PATH: ${options.path}');
    return super.onRequest(options, handler);
  }
}
