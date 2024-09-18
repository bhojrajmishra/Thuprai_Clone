import 'package:dio/dio.dart';
import 'package:thuprai_clone/ui/views/login/model/login_request.dart';
import 'package:thuprai_clone/ui/views/login/model/login_response.dart';
import 'package:thuprai_clone/utils/api_path.dart';

class LoginService {
  final Dio _dio = Dio();

  Future<LoginResponse?> requestLoginApi(LoginRequest loginRequest) async {
    final payload = {
      'username': loginRequest.email,
      'password': loginRequest.password,
    };
    try {
      Response response = await _dio.post(
        ApiPath.loginUrl,
        data: payload,
      );

      if (response.statusCode == 200) {
        final data = response.data;
        return LoginResponse.fromJson(data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
