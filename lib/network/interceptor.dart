import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Perform actions before the request is sent (e.g., attach headers)
    debugPrint('Request: ${options.method} ${options.path}');
    handler.next(options); // Continue with the request
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Perform actions when the response is received
    debugPrint('Response: ${response.statusCode} ${response.data}');
    handler.next(response); // Continue with the response
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Handle errors (e.g., log them)
    debugPrint('Error: ${err.message}');
    handler.next(err); // Continue with the error
  }
}
