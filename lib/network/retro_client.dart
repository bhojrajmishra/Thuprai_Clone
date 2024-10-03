import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:thuprai_clone/ui/views/cart/model/cart_model.dart';
import 'package:thuprai_clone/ui/views/cart/model/cart_request_model.dart';
import 'package:thuprai_clone/ui/views/detail/model/book_model.dart';
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
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);
  @GET("book/{slug}")
  Future<BookModel> getBookData(@Path("slug") String slug);
  @GET("api/logout/")
  Future<void> logout();

  //add cart accordint to product
  @POST('api/basket/add-product/')
  Future<CartRequestModel> addCart(@Body() CartRequestModel cartRequest);
//get cart list
  @GET('api/basket/')
  Future<CartModel> getCart();
//delete cart item
  @DELETE("api/baskets/{cartId}/lines/{linesId}/")
  Future<void> deleteCart(
      @Path('cartId') String cartId, @Path('linesId') String linesId);
//update cart item
  @PUT("api/baskets/{cartId}/lines/{linesId}/")
  Future<void> updateCart(@Path('cartId') String cartId,
      @Path('linesId') String linesId, @Body() CartRequestModel updateCart);
}
