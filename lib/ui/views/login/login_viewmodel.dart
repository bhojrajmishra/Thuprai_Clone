import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thuprai_clone/app/app.locator.dart';
import 'package:thuprai_clone/app/app.router.dart';
import 'package:thuprai_clone/ui/views/login/model/login_request.dart';
import 'package:thuprai_clone/ui/views/login/model/login_response.dart';
import 'package:thuprai_clone/ui/views/login/repository/login_repository_implementation.dart';

class LoginViewModel extends BaseViewModel {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _navigate = locator<NavigationService>();
  final _loginRepositoryImpl = locator<LoginRepositoryImpl>();
  final _snackbarService = locator<SnackbarService>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void navigateToHome() {
    _navigate.navigateTo(Routes.homeView);
  }

  Future<void> requestLoginApi() async {
    if (!formKey.currentState!.validate()) {
      _snackbarService.showSnackbar(message: 'Please enter valid data');
      return;
    }

    setBusy(true);
    try {
      LoginRequest loginRequest = LoginRequest(
        email: emailController.text,
        password: passwordController.text,
      );
      LoginResponse? loginResult =
          await _loginRepositoryImpl.requestLoginApi(loginRequest);
      if (loginResult == null) {
        _snackbarService.showSnackbar(message: 'Login failed');
        setBusy(false);
        return;
      }
      navigateToHome();
      setBusy(false);
    } catch (e) {
      _snackbarService.showSnackbar(message: e.toString());
    }
  }
}
