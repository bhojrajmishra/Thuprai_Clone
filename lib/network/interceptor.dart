import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:thuprai_clone/app/app.locator.dart';
import 'package:thuprai_clone/app/app.router.dart';
import 'package:thuprai_clone/network/secure_storage.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:logger/logger.dart';

class DioInterceptor extends Interceptor {
  final SecureStorageService _secureStorage = locator<SecureStorageService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  final Logger _logger = Logger();

  static const String _authHeaderKey = 'Authorization';
  static const String _tokenKey = 'token';
  static const String _tokenPrefix = 'Token';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _addAuthorizationHeader(options).then((_) {
      _logRequest(options);
      handler.next(options);
    }).catchError((error) {
      _logger.e('Error during request interception: $error');
      handler.reject(DioException(requestOptions: options, error: error));
    });
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _handleTokenFromResponse(response);
    _logResponse(response);
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _logError(err);
    _handleError(err);
    handler.next(err);
  }

  Future<void> _addAuthorizationHeader(RequestOptions options) async {
    final String? token = await _secureStorage.getData(_tokenKey);
    if (token != null && token.isNotEmpty) {
      options.headers[_authHeaderKey] = '$_tokenPrefix $token';
    }
  }

  Future<void> _handleTokenFromResponse(Response response) async {
    final String? token = response.data[_tokenKey];
    if (token != null) {
      await _secureStorage.saveData(_tokenKey, token);
      _logger.i('Token updated');
    }
  }

  void _handleError(DioException err) {
    switch (err.response?.statusCode) {
      case 401:
        _handleUnauthorizedError();
        break;
      case 403:
        _handleForbiddenError();
        break;
      case 404:
        _handleNotFoundError(err);
        break;
      case 500:
        _handleServerError();
        break;
      default:
        _handleGenericError(err);
    }
  }

  void _handleUnauthorizedError() {
    _secureStorage.deleteData(_tokenKey);
    _navigationService.clearStackAndShow(Routes.loginView);
    _dialogService.showDialog(
      title: 'Session Expired',
      description: 'Your session has expired. Please log in again.',
    );
    _logger.w('Unauthorized access, redirecting to login');
  }

  void _handleForbiddenError() {
    _dialogService.showDialog(
      title: 'Access Denied',
      description: 'You do not have permission to access this resource.',
    );
    _logger.w('Forbidden access');
  }

  void _handleNotFoundError(DioException err) {
    _dialogService.showDialog(
      title: 'Not Found',
      description: 'The requested resource was not found.',
    );
    _logger.w('Resource not found: ${err.requestOptions.path}');
  }

  void _handleServerError() {
    _dialogService.showDialog(
      title: 'Server Error',
      description:
          'An unexpected server error occurred. Please try again later.',
    );
    _logger.e('Server error occurred');
  }

  void _handleGenericError(DioException err) {
    _dialogService.showDialog(
      title: 'Error',
      description: 'An unexpected error occurred. Please try again.',
    );
    _logger.e('Generic error: ${err.message}');
  }

  void _logRequest(RequestOptions options) {
    _logger.i('REQUEST[${options.method}] => PATH: ${options.path}\n'
        'Headers: ${options.headers}\n'
        'Query Parameters: ${options.queryParameters}\n'
        'Body: ${options.data}');
  }

  void _logResponse(Response response) {
    _logger.i(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}\n'
        'Headers: ${response.headers.map}\n'
        'Body: ${response.data}');
  }

  void _logError(DioException err) {
    _logger.e(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}\n'
        'Type: ${err.type}\n'
        'Message: ${err.message}\n'
        'Response Data: ${err.response?.data}');
  }
}
