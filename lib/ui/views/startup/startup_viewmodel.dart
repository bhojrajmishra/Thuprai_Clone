import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thuprai_clone/app/app.locator.dart';
import 'package:thuprai_clone/app/app.router.dart';
import 'package:thuprai_clone/network/secure_storage.dart';

class StartupViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SecureStorageService _secureStorage = locator<SecureStorageService>();

  Future<void> runStartupLogic() async {
    await Future.delayed(
        const Duration(seconds: 3)); // Simulating some startup work

    String? token = await _secureStorage.getData('token');

    if (token != null && token.isNotEmpty) {
      // Token exists, navigate to home
      _navigationService.replaceWith(Routes.bottomnavigationbarView);
      debugPrint('Token exists: $token');
    } else {
      // No token, navigate to login
      _navigationService.replaceWith(Routes.loginView);
      debugPrint('Token does not exist');
    }
  }
}
