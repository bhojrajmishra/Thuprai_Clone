import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thuprai_clone/app/app.locator.dart';
import 'package:thuprai_clone/app/app.router.dart';

class BottomnavigationbarViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void cartItemCount() {
    notifyListeners();
  }

  void onTabTapped(int index) {
    setIndex(index);
    switch (index) {
      case 0:
        _navigationService.navigateTo(Routes.homeView);
        break;
      case 1:
        _navigationService.navigateTo(Routes.cartView);
        break;
      case 2:
        _navigationService.navigateTo(Routes.loginView);
        break;
      case 3:
        // Navigate to More view (you may need to create this route)
        // _navigationService.navigateTo(Routes.moreView);
        break;
    }
  }

  void navigateToCart() {
    _navigationService.navigateTo(Routes.cartView);
  }
}
