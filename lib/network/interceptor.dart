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
    String? token = await _secureStorage.getData('token');

    if (token != null && token.isNotEmpty) {
      // Token exists, add it to the request headers
      options.headers['Authorization'] = 'Bearer $token';
      debugPrint('Request: ${options.method} ${options.path}');
      debugPrint('Headers: ${options.headers}');
      debugPrint('Query Params: ${options.queryParameters}');
      handler.next(options); // Continue with the request
    } else {
      // No token, redirect to login
      debugPrint('No token found. Redirecting to login.');
      _navigationService.replaceWith(Routes.loginView);
      handler.reject(
        DioException(
          requestOptions: options,
          error: 'No authentication token found',
          type: DioExceptionType.cancel,
        ),
        true,
      );
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('Response: ${response.statusCode} ${response.data}');
    handler.next(response); // Continue with the response
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint('Error: ${err.message}');
    if (err.response?.statusCode == 401) {
      // Unauthorized error, token might be expired
      _secureStorage.deleteData('token'); // Clear the invalid token
      _navigationService.replaceWith(Routes.loginView);
    }
    handler.next(err); // Continue with the error
  }
}
