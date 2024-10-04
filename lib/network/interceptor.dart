import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:thuprai_clone/app/app.locator.dart';
import 'package:thuprai_clone/app/app.router.dart';
import 'package:thuprai_clone/network/secure_storage.dart';
import 'package:stacked_services/stacked_services.dart';

class DioInterceptor extends Interceptor {
  final SecureStorageService _secureStorage = locator<SecureStorageService>();
  final NavigationService _navigationService = locator<NavigationService>();

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      String? token = await _secureStorage.getData('token');

      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      }

      // Logging the request details
      debugPrint('Request Method: ${options.method}');
      debugPrint('Request URL: ${options.baseUrl}${options.path}');
      debugPrint('Request Headers: ${options.headers}');
      debugPrint('Request Query Params: ${options.queryParameters}');
      debugPrint('Request Body: ${options.data}');

      handler.next(options); // continue
    } catch (e) {
      debugPrint('Error during request: $e');
      handler.reject(DioException(requestOptions: options, error: e));
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Enhanced logging for the response
    debugPrint(
        'Response: [${response.statusCode}] ${response.requestOptions.uri}');
    debugPrint('Response Headers: ${response.headers}');
    if (response.data != null) {
      debugPrint('Response Body: ${response.data}');
    }

    handler.next(response); // continue
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Logging enhanced for error
    debugPrint('Error: ${err.response?.statusCode ?? 'Unknown status'}');
    debugPrint('Error Message: ${err.message}');
    if (err.response?.statusCode != null) {
      debugPrint('Error Response Data: ${err.response?.data}');
    }

    // Handling 401 status codes by logging out the user
    if (err.response?.statusCode == 401) {
      _secureStorage.deleteData('token');
      _navigationService.replaceWith(Routes.loginView);
      debugPrint('User is unauthorized, redirecting to login.');
    }

    handler.next(err); // continue the error
  }
}
