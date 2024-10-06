import 'package:flutter/foundation.dart';
import 'package:thuprai_clone/app/app.locator.dart';
import 'package:thuprai_clone/network/retro_client.dart';
import 'package:thuprai_clone/ui/views/registration/model/registration_request.dart';
import 'package:thuprai_clone/ui/views/registration/model/registration_response.dart';
import 'package:thuprai_clone/ui/views/registration/repository/registration_repository.dart';

class RegistrationRepogitoryImplementation implements RegistrationRepository {
  final RetroClient _retroClient = locator<RetroClient>();

  @override
  Future<RegistrationResponse> requestRegisterApi(
      RegistrationRequest registrationRequest) async {
    try {
      final response = await _retroClient.signup(registrationRequest);
      debugPrint('response: $response');
      return response;
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }
}
