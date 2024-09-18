import 'package:thuprai_clone/ui/views/login/model/login_request.dart';
import 'package:thuprai_clone/ui/views/login/model/login_response.dart';

abstract class LoginRepository {
  Future<LoginResponse?> requestLoginApi(LoginRequest loginRequest);
}
