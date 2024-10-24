import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thuprai_clone/app/app.locator.dart';
import 'package:thuprai_clone/app/app.router.dart';
import 'package:thuprai_clone/network/secure_storage.dart';
import 'package:thuprai_clone/ui/views/login/model/login_request.dart';
import 'package:thuprai_clone/ui/views/login/model/login_response.dart';
import 'package:thuprai_clone/ui/views/login/repository/login_repository_implementation.dart';

class LoginViewModel extends BaseViewModel {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final NavigationService _navigate = locator<NavigationService>();
  final LoginRepositoryImpl _loginRepositoryImpl =
      locator<LoginRepositoryImpl>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final SecureStorageService _secureStorage = locator<SecureStorageService>();
  late final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isPasswordVisible = false;

  void navigateToHome() {
    _navigate.navigateTo(Routes.homeView);
  }

  void navigateToSignUp() {
    _navigate.navigateTo(Routes.registrationView);
  }

  void requestgoogleSignIn() {
    // TODO: Implement Google sign-in logic
  }

  void requestfacebookSignIn() {
    // TODO: Implement Facebook sign-in logic
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  Future<void> requestLoginApi() async {
    if (!formKey.currentState!.validate()) {
      _snackbarService.showSnackbar(message: 'Please enter valid data');
      return;
    }
    setBusy(true);

    try {
      LoginRequest loginRequest = LoginRequest(
        username: emailController.text,
        password: passwordController.text,
      );

      LoginResponse? response =
          await _loginRepositoryImpl.requestLoginApi(loginRequest);

      if (response != null && response.token.isNotEmpty) {
        await _secureStorage.saveData('token', response.token);
        await saveUserDetails();
        debugPrint('SaveUserDatail successfully:  ${response.token}');
      } else {
        _snackbarService.showSnackbar(
            message: 'Login failed: Invalid response');
      }
    } catch (e) {
      _snackbarService.showSnackbar(message: 'Login failed: $e');
      debugPrint('Login failed: $e');
    } finally {
      setBusy(false);
      debugPrint('Login request completed');
      _snackbarService.showSnackbar(message: 'Login request completed');
    }
  }

  Future<void> saveUserDetails() async {
    await _secureStorage.saveData('email', emailController.text);
    await _secureStorage.saveData('password', passwordController.text);
    await _secureStorage.saveData('isLoggedIn', 'true');
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
