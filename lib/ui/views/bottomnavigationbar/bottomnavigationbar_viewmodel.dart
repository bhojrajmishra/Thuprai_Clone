import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thuprai_clone/app/app.locator.dart';
import 'package:thuprai_clone/app/app.router.dart';
import 'package:thuprai_clone/ui/views/cart/cart_service.dart';
import 'package:thuprai_clone/ui/views/cart/model/cart_model.dart';

class BottomnavigationbarViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final CartService _cartService = locator<CartService>();

  CartModel? _cartModel;
  CartModel? get cartModel => _cartModel;

  BottomnavigationbarViewModel() {
    _cartService.addListener(() {
      notifyListeners();
    });
  }

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  int cartCount() {
    return _cartService.cartModel?.lines?.length ?? 0;
  }

  void navigateToCart() {
    _navigationService.navigateTo(Routes.cartView);
  }

  @override
  void dispose() {
    _cartService.removeListener(() {});
    super.dispose();
  }
}
