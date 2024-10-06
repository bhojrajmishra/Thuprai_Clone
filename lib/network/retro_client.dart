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

part 'retro_client.g.dart';

@RestApi(baseUrl: "https://tbe.thuprai.com/v1/")
abstract class RetroClient {
  factory RetroClient(Dio dio, {String? baseUrl}) = _RetroClient;
//get home page data
  @GET('index/')
  Future<HomeResponseModel?> getBooks();
//registration
  @POST('api/signup/')
  Future<RegistrationResponse> signup(
      @Body() RegistrationRequest registrationRequest);
//login
  @POST('api/login/')
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);
//get book data
  @GET("book/{slug}")
  Future<BookModel> getBookData(@Path("slug") String slug);
//logout
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
