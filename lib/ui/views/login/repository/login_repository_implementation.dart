import 'package:thuprai_clone/app/app.locator.dart';
import 'package:thuprai_clone/network/retro_client.dart';
import 'package:thuprai_clone/ui/views/login/model/login_request.dart';
import 'package:thuprai_clone/ui/views/login/model/login_response.dart';
import 'package:thuprai_clone/ui/views/login/repository/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final RetroClient _retroClient = locator<RetroClient>();

  @override
  Future<LoginResponse?> requestLoginApi(LoginRequest loginRequest) async {
    try {
      final response = await _retroClient.login(loginRequest);
      return response;
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }
}
