import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:thuprai_clone/ui/views/home/model/home_response_model.dart';
import 'package:thuprai_clone/ui/views/login/model/login_request.dart';
import 'package:thuprai_clone/ui/views/login/model/login_response.dart';
import 'package:thuprai_clone/ui/views/registration/model/registration_request.dart';
import 'package:thuprai_clone/ui/views/registration/model/registration_response.dart';
import 'package:thuprai_clone/utils/api_path.dart';

part 'retro_client.g.dart';

@RestApi(baseUrl: ApiPath.baseUrl)
abstract class RetroClient {
  factory RetroClient(Dio dio, {String? baseUrl}) = _RetroClient;

  @GET('index/')
  Future<HomeResponseModel?> getBooks();
  @POST('api/signup/')
  Future<RegistrationResponse> signup(
      @Body() RegistrationRequest registrationRequest);
  @POST('api/login/')
  Future<LoginResponse> login(@Body() LoginRequest loginRequestM);
}
