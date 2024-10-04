import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thuprai_clone/app/app.locator.dart';
import 'package:thuprai_clone/app/app.router.dart';
import 'package:thuprai_clone/ui/views/cart/model/cart_model.dart';
import 'package:thuprai_clone/ui/views/cart/model/cart_request_model.dart';
import 'package:thuprai_clone/ui/views/cart/repository/cart_repository_implementation.dart';

class CartViewModel extends BaseViewModel {
  final NavigationService _navigation = locator<NavigationService>();

  final CartRepositoryImplementation _cartRepositoryImplementation =
      locator<CartRepositoryImplementation>();

  CartModel? _cartModel;
  CartModel? get cartModel => _cartModel;

  CartViewModel() {
    fetchCart();
  }

  Future<void> fetchCart() async {
    setBusy(true);
    try {
      _cartModel = await _cartRepositoryImplementation.getCart();
      debugPrint('Fetched cart: ${_cartModel?.toJson()}');
      notifyListeners();
    } catch (e) {
      debugPrint('Error fetching cart: $e');
    } finally {
      setBusy(false);
    }
  }

  Future<void> removeCartItem(String cartId, String linesId) async {
    setBusy(true);
    try {
      await _cartRepositoryImplementation.deleteCartItem(cartId, linesId);
      debugPrint('Removed item from cart');
      debugPrint('response of cart response: ${_cartModel?.toJson()}');
      await fetchCart(); // Refresh cart after removing item
    } catch (e) {
      // Handle error
    } finally {
      setBusy(false);
    }
  }

  Future<void> updateCartItem(
      String cartId, String linesId, CartRequestModel updateCart) async {
    setBusy(true);
    try {
      await _cartRepositoryImplementation.updateCartItem(
          cartId, linesId, updateCart);
      await fetchCart(); // Refresh cart after updating item
    } catch (e) {
      // Handle error
    } finally {
      setBusy(false);
    }
  }

  double totalPrice() {
    return double.tryParse(_cartModel?.totalInclTax ?? '0') ?? 0;
  }

  double discountAmount() {
    return totalPrice() * 0.1;
  }

  double totalAmount() {
    return totalPrice() - discountAmount();
  }

  void onItemSelected(String slug) {
    _navigation.navigateTo(
      Routes.detailView,
      arguments: DetailViewArguments(slug: slug),
    );
  }
}
