import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thuprai_clone/app/app.locator.dart';
import 'package:thuprai_clone/app/app.router.dart';
import 'package:thuprai_clone/ui/views/cart/model/cart_model.dart';
import 'package:thuprai_clone/ui/views/cart/model/cart_request_model.dart';
import 'package:thuprai_clone/ui/views/cart/repository/cart_repository_implementation.dart';

class CartViewModel extends BaseViewModel {
  final NavigationService _navigation = locator<NavigationService>();

  final SnackbarService _snackbarService = locator<SnackbarService>();

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
    debugPrint('cartId: $cartId, linesId: $linesId');
    setBusy(true);
    try {
      await _cartRepositoryImplementation.deleteCartItem(cartId, linesId);
      debugPrint('Removed item from cart');
      _snackbarService.showSnackbar(
        message: 'Item removed from cart',
        duration: Duration(seconds: 2),
      );
      debugPrint('response of cart response: ${_cartModel?.toJson()}');
      await fetchCart(); // Refresh cart after removing item
    } catch (e) {
      // Handle error
      debugPrint('Error removing item from cart: $e');
      _snackbarService.closeSnackbar();
      _snackbarService.showSnackbar(
        message: 'Error removing item from cart',
        duration: Duration(seconds: 2),
      );
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
      debugPrint('Updated item in cart');
      _snackbarService.closeSnackbar();
      _snackbarService.showSnackbar(
        message: 'Item updated in cart',
        duration: Duration(seconds: 2),
      );
      await fetchCart(); // Refresh cart after updating item
    } catch (e) {
      // Handle error
      debugPrint('Error updating item in cart: $e');
      _snackbarService.closeSnackbar();
      _snackbarService.showSnackbar(
        message: 'Error updating item in cart',
        duration: Duration(seconds: 2),
      );
    } finally {
      setBusy(false);
    }
  }

  void onDeleteCartShowDialog(
      BuildContext context, String cartId, String linesId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Item'),
          content: Text('Are you sure you want to delete this item?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                removeCartItem(cartId, linesId);
                Navigator.of(context).pop();
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );

    void onItemSelected(String slug) {
      _navigation.navigateTo(
        Routes.detailView,
        arguments: DetailViewArguments(slug: slug),
      );
    }
  }
}
