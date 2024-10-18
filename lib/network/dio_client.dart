import 'package:dio/dio.dart';
import 'package:thuprai_clone/network/interceptor.dart';
import 'package:thuprai_clone/utils/api_path.dart';

class DioClient {
  late final Dio _dio;

  DioClient() {
    _dio = Dio(BaseOptions(
      baseUrl: ApiPath.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ));
    _dio.interceptors.add(DioInterceptor());
  }

  Dio get client => _dio;
}
