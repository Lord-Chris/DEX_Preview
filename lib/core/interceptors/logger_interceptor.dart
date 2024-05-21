import 'dart:convert';

import 'package:dio/dio.dart';

import '../app/_app.dart';

class NetworkLoggerInterceptor implements Interceptor {
  final _logger = getLogger('ApiLoggerInterceptor');
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _logger.e(
      '\n'
      '------------------- METHOD: ${err.requestOptions.method}\n'
      '------------------- ENDPOINT: ${err.requestOptions.uri}\n'
      '------------------- STATUSCODE: ${err.response?.statusCode} \n'
      '------------------- MESSAGE: \n ${jsonEncode(err.response?.data ?? err.message ?? err.error.toString())}\n',
    );
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _logger.d(
      '\n'
      '''===================================================================\n\n'''
      '>>>>>>>>>>>>>>>>>>>> METHOD: ${options.method}\n'
      '>>>>>>>>>>>>>>>>>>>> ENDPOINT: ${options.uri}\n'
      '''>>>>>>>>>>>>>>>>>>>> REQUEST DATA:\n'''
      '''${options.data ?? options.queryParameters}\n'''
      '''===================================================================\n\n''',
    );
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _logger.d(
      '\n'
      '''===================================================================\n\n'''
      '<<<<<<<<<<<<<< METHOD: ${response.requestOptions.method}\n'
      '<<<<<<<<<<<<<< ENDPOINT: ${response.requestOptions.uri}\n'
      '<<<<<<<<<<<<<< STATUSCODE: ${response.statusCode}\n'
      '''<<<<<<<<<<<<<< RESPONSE DATA:\n '''
      '''$response\n'''
      '''===================================================================\n\n''',
    );
    handler.next(response);
  }
}
