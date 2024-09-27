import 'package:thuprai_clone/ui/views/registration/model/registration_request.dart';
import 'package:thuprai_clone/ui/views/registration/model/registration_response.dart';

abstract class RegistrationRepository {
  Future<RegistrationResponse> requestRegisterApi(
      RegistrationRequest registrationRequest);
}
