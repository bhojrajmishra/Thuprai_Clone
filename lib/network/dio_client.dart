import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:thuprai_clone/network/interceptor.dart';
import 'package:thuprai_clone/utils/api_path.dart';

class DioClient {
  late final Dio dio;

  DioClient(String baseUrl) {
    dio = Dio(BaseOptions(baseUrl: ApiPath.baseUrl));
    dio.interceptors.add(DioInterceptor());
    AwesomeDioInterceptor(
      // Disabling headers and timeout would minimize the logging output.
      // Optional, defaults to true
      logRequestTimeout: true,
      logRequestHeaders: true,
      logResponseHeaders: true,

      logger: debugPrint,
    );
  }
}
