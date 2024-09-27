import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thuprai_clone/app/app.locator.dart';
import 'package:thuprai_clone/app/app.router.dart';
import 'package:thuprai_clone/ui/views/login/model/login_request.dart';
import 'package:thuprai_clone/ui/views/login/repository/login_repository_implementation.dart';

class LoginViewModel extends BaseViewModel {
  // Text controllers for email and password input fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Services for navigation, login repository, and snackbar notifications
  final NavigationService _navigate = locator<NavigationService>();
  final LoginRepositoryImpl _loginRepositoryImpl =
      locator<LoginRepositoryImpl>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Password visibility state
  bool isPasswordVisible = false;

  // Method to navigate to the home screen after successful login
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

  // Method to toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  // Method to handle login logic and API request
  Future<void> requestLoginApi() async {
    // Validate the form before proceeding
    if (!formKey.currentState!.validate()) {
      _snackbarService.showSnackbar(message: 'Please enter valid data');
      return;
    }

    setBusy(true);

    try {
      // Create login request object from input values
      LoginRequest loginRequest = LoginRequest(
        username: emailController.text,
        password: passwordController.text,
      );

      // Make the API request using the repository
      await _loginRepositoryImpl.requestLoginApi(loginRequest);

      navigateToHome();
    } catch (e) {
      _snackbarService.showSnackbar(message: 'Login failed: $e');
      debugPrint('Login failed: $e');
    } finally {
      // Set the view to not busy (hides the loading spinner)
      setBusy(false);
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
