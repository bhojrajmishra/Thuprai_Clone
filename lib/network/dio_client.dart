import 'package:dio/dio.dart';
import 'package:thuprai_clone/network/interceptor.dart';

class DioClient {
  late final Dio dio;

  DioClient(String baseUrl) {
    dio = Dio(BaseOptions(baseUrl: baseUrl));
    dio.interceptors.add(DioInterceptor());
  }
}
