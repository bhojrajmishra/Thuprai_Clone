import 'package:dio/dio.dart';
import 'package:thuprai_clone/network/dio_client.dart';
import 'package:thuprai_clone/ui/views/login/model/login_request.dart';
import 'package:thuprai_clone/ui/views/login/model/login_response.dart';
import 'package:thuprai_clone/utils/api_path.dart';

class LoginService {
  final DioClient _dioClient = DioClient(ApiPath.loginUrl);

  Future<LoginResponse> requestLoginApi(LoginRequest loginRequest) async {
    final payload = loginRequest.toJson();
    try {
      Response response =
          await _dioClient.dio.post(ApiPath.loginUrl, data: payload);

      if (response.statusCode == 200) {
        return LoginResponse.fromJson(response.data);
      } else {
        throw Exception('Failed to login: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      // Rethrow the Dio-specific error so it can be handled in the ViewModel
      throw Exception('Dio error: ${e.message}');
    } catch (e) {
      // Catch all other exceptions and throw them
      throw Exception('An error occurred: $e');
    }
  }
}
