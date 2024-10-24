import 'package:flutter/material.dart';
import 'package:thuprai_clone/ui/views/cart/model/cart_model.dart';

class CartService with ChangeNotifier {
  CartModel? _cartModel;
  CartModel? get cartModel => _cartModel;

  void updateCart(CartModel? newCart) {
    _cartModel = newCart;
    notifyListeners();
  }
}
