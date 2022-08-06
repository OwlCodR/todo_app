import 'package:dio/dio.dart';

import '../utils/logger.dart';

class TokenInterceptors extends Interceptor {
  final String _token;
  TokenInterceptors(this._token);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({"Authorization ": "Bearer $_token"});

    log.d('REQUEST[${options.method}] => PATH: ${options.path}');
    return super.onRequest(options, handler);
  }
}
