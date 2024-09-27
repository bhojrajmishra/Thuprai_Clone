import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thuprai_clone/app/app.locator.dart';
import 'package:thuprai_clone/app/app.router.dart';

class RegistrationViewModel extends BaseViewModel {
  // Text controllers for email and password input fields
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Services for navigation, login repository, and snackbar notifications
  final NavigationService _navigate = locator<NavigationService>();
  // final LoginRepositoryImpl _loginRepositoryImpl =
  //     locator<LoginRepositoryImpl>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Password visibility state
  bool isPasswordVisible = false;

  // Method to navigate to the home screen after successful login
  void navigateToHome() {
    _navigate.navigateTo(Routes.homeView);
  }

  void navigateToLogin() {
    _navigate.navigateTo(Routes.loginView);
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

  // Method to handle registration  logic and API request

  Future<void> requestRegistrationApi() async {
    // Validate the form before proceeding
    if (!formKey.currentState!.validate()) {
      _snackbarService.showSnackbar(message: 'Please enter valid data');
      return;
    }

    setBusy(true);

    try {
      // Create login request object from input values
      // LoginRequest loginRequest = LoginRequest(
      //   username: emailController.text,
      //   password: passwordController.text,
      // );

      // Call the login repository to make the API request
      // await _loginRepositoryImpl.login(loginRequest);

      // Navigate to the home screen after successful login
      navigateToHome();
    } catch (e) {
      // Show error message if login fails
      _snackbarService.showSnackbar(message: 'Login failed. Please try again');
    }

    setBusy(false);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
