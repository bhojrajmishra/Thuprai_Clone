import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thuprai_clone/network/secure_storage.dart';

class ProfileViewModel extends BaseViewModel {
  final SecureStorageService _secureStorage = SecureStorageService();
  final SnackbarService _snackbarService = SnackbarService();

  String imageUrls =
      'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png';

  Future<void> getUserData() async {
    String? token = await _secureStorage.getData('email');
    getEmail = token;
    debugPrint('Email: $token');
    notifyListeners();
  }

  String? getEmail;

  Future<void> logout() async {
    await _secureStorage.deleteData('token');
    debugPrint('Logged out successfully');
    _snackbarService.showSnackbar(
      message: 'Logged out successfully',
      duration: const Duration(seconds: 2),
    );
    notifyListeners();
  }

  void ontapIndex(int index) {
    switch (index) {
      case 0:
        Icon(Icons.shopping_cart);
        debugPrint('My Orders');
        break;
      case 1:
        Icon(Icons.settings);
        debugPrint('Settings');
        break;
      case 2:
        Icon(Icons.devices);
        debugPrint('My Devices and Sessions');
        break;
      case 3:
        Icon(Icons.card_giftcard);

        debugPrint('Redeem Gift Card');
        break;
      case 4:
        Icon(Icons.logout);
        logout();
        break;
      default:
        debugPrint('Invalid index');
    }
  }

  List<String> list = [
    'My Orders',
    'Settings',
    'My Devices and Sessions',
    'Redeem Gift Card',
    'Logout',
  ];
}
