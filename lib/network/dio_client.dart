import 'package:dio/dio.dart';
import 'package:thuprai_clone/network/interceptor.dart';
import 'package:thuprai_clone/utils/api_path.dart';

class DioClient {
  late final Dio dio;

  DioClient() {
    dio = Dio(BaseOptions(
      baseUrl: ApiPath.baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    ));

    // Add the custom DioInterceptor first
    dio.interceptors.addAll(
      [
        DioInterceptor(),
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          requestHeader: true,
          responseHeader: true,
          error: true,
        ),
      ],
    );

    // Add Dio's LogInterceptor to log all types of requests, responses, errors
  }
}
