import 'package:dio/dio.dart';
import 'package:thuprai_clone/network/interceptor.dart';
import 'package:thuprai_clone/utils/api_path.dart';

class DioClient {
  late final Dio dio;

  DioClient(String baseUrl) {
    dio = Dio(BaseOptions(baseUrl: ApiPath.baseUrl));
    dio.interceptors.add(DioInterceptor());
  }
}
