import 'package:thuprai_clone/ui/views/cart/model/cart_model.dart';
import 'package:thuprai_clone/ui/views/cart/model/cart_request_model.dart';

abstract class CartRepository {
  Future<CartModel> getCart();
  Future<void> deleteCartItem(String cartId, String linesId);
  Future<void> updateCartItem(
      String cartId, String linesId, CartRequestModel updateCart);
}
