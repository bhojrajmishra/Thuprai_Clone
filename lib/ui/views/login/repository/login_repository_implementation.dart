import 'package:thuprai_clone/app/app.locator.dart';
import 'package:thuprai_clone/ui/views/login/model/login_request.dart';
import 'package:thuprai_clone/ui/views/login/model/login_response.dart';
import 'package:thuprai_clone/ui/views/login/repository/login_repository.dart';
import 'package:thuprai_clone/ui/views/login/service/login_service.dart';

class LoginRepositoryImpl implements LoginRepository {
  @override
  Future<LoginResponse?> requestLoginApi(LoginRequest loginRequest) async {
    final loginService = locator<LoginService>();
    return await loginService.requestLoginApi(loginRequest);
  }
}
