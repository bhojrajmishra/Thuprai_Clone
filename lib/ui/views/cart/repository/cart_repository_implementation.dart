import 'package:thuprai_clone/app/app.locator.dart';
import 'package:thuprai_clone/network/retro_client.dart';
import 'package:thuprai_clone/ui/views/cart/model/cart_model.dart';
import 'package:thuprai_clone/ui/views/cart/model/cart_request_model.dart';
import 'package:thuprai_clone/ui/views/cart/repository/cart_repository.dart';

class CartRepositoryImplementation implements CartRepository {
  final RetroClient _retroClient = locator<RetroClient>();
  @override
  Future<CartModel> getCart() async {
    return await _retroClient.getCart();
  }

  @override
  Future<void> deleteCartItem(String cartId, String linesId) async {
    await _retroClient.deleteCart(cartId, linesId);
  }

  @override
  Future<void> updateCartItem(
      String cartId, String linesId, CartRequestModel updateCart) async {
    await _retroClient.updateCart(cartId, linesId, updateCart);
  }
}
