import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thuprai_clone/app/app.locator.dart';
import 'package:thuprai_clone/app/app.router.dart';
import 'package:thuprai_clone/ui/views/cart/model/cart_model.dart';

class BottomnavigationbarViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  CartModel? _cartModel;
  CartModel? get cartModel => _cartModel;

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  int cartCount() {
    debugPrint('cartCount: ${_cartModel?.lines?.length}');
    return _cartModel?.lines?.length ?? 0;
  }

  void navigateToCart() {
    _navigationService.navigateTo(Routes.cartView);
  }
}
