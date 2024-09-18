import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thuprai_clone/app/app.locator.dart';

class AppInterceptor extends Interceptor {
  final NavigationService _navigationService = locator<NavigationService>();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    /// Retrieve token from storage and add to headers if it exists
    // String? token = await _storageService.read(key: 'token');
    // if (token != null) {
    //   options.headers['Authorization'] = 'Bearer $token';
    // }
    // debugPrint('Interceptor: Sending request to ${options.path}');
    // handler.next(options); // Proceed with the request
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    debugPrint(
        'Interceptor: Received response from ${response.requestOptions.path}');
    handler.next(response);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    debugPrint('Interceptor: Error occurred for ${err.requestOptions.path}');

    if (err.response?.statusCode == 401) {
      debugPrint('Unauthorized error (401). Logging out user.');
      // await _storageService.delete(key: 'token');
      // _navigationService.pushNamedAndRemoveUntil(Routes.loginView);
    }

    handler.next(err);
  }
}
