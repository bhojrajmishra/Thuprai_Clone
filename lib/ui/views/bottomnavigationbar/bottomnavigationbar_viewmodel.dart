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

  int _cartItemCount = 0;
  int get cartItemCount => _cartItemCount;

  void updateCartItemCount(int count) {
    _cartItemCount = count;
    notifyListeners();
  }

  void navigateToCart() {
    _navigationService.navigateTo(Routes.cartView);
  }
}
