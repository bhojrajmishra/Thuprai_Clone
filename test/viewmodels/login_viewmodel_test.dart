import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:thuprai_clone/app/app.locator.dart';
import 'package:thuprai_clone/app/app.router.dart';
import 'package:thuprai_clone/ui/views/login/login_viewmodel.dart';
import 'package:thuprai_clone/ui/views/login/model/login_request.dart';
import 'package:thuprai_clone/ui/views/login/model/login_response.dart';
import 'package:thuprai_clone/ui/views/login/repository/login_repository_implementation.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_helpers.mocks.dart';

class MockFormState extends Mock implements FormState {
  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return super.toString();
  }
}

class MockLoginRepositoryImpl extends Mock implements LoginRepositoryImpl {}

void main() {
  group('LoginViewModelTest -', () {
    late LoginViewModel loginViewModel;
    late MockNavigationService mockNavigationService;
    late MockSnackbarService mockSnackbarService;
    late MockSecureStorageService mockSecureStorageService;
    late MockLoginRepositoryImpl mockLoginRepositoryImpl;
    late MockFormState mockFormState;

    setUp(() {
      registerServices();
      mockNavigationService = getAndRegisterNavigationService();
      mockSnackbarService = getAndRegisterSnackbarService();
      mockSecureStorageService = getAndRegisterSecureStorageService();
      mockLoginRepositoryImpl = MockLoginRepositoryImpl();
      locator.registerSingleton<LoginRepositoryImpl>(mockLoginRepositoryImpl);

      loginViewModel = LoginViewModel();
      mockFormState = MockFormState();
    });

    tearDown(() => locator.reset());

    test('Initial values are correct', () {
      expect(loginViewModel.isPasswordVisible, false);
      expect(loginViewModel.emailController.text, '');
      expect(loginViewModel.passwordController.text, '');
    });

    test('togglePasswordVisibility changes isPasswordVisible', () {
      expect(loginViewModel.isPasswordVisible, false);
      loginViewModel.togglePasswordVisibility();
      expect(loginViewModel.isPasswordVisible, true);
    });

    test('navigateToHome calls NavigationService', () {
      loginViewModel.navigateToHome();
      verify(mockNavigationService.navigateTo(Routes.homeView)).called(1);
    });

    test('navigateToSignUp calls NavigationService', () {
      loginViewModel.navigateToSignUp();
      verify(mockNavigationService.navigateTo(Routes.registrationView))
          .called(1);
    });

    test('requestLoginApi with invalid form shows error snackbar', () async {
      when(mockFormState.validate()).thenReturn(false);

      await loginViewModel.requestLoginApi();

      verify(mockSnackbarService.showSnackbar(
              message: 'Please enter valid data'))
          .called(1);
    });

    test(
        'requestLoginApi with valid form and successful login navigates to home',
        () async {
      when(mockFormState.validate()).thenReturn(true);

      loginViewModel.emailController.text = 'test@example.com';
      loginViewModel.passwordController.text = 'password123';

      when(mockLoginRepositoryImpl.requestLoginApi(
              LoginRequest(username: 'aliean', password: 'password123')))
          .thenAnswer((_) async => LoginResponse(
              fullName: 'Test User',
              email: '',
              id: 1,
              isStaff: false,
              roles: [],
              organizations: {},
              token: 'test_token'));

      await loginViewModel.requestLoginApi();

      verify(mockSecureStorageService.saveData('token', 'test_token'))
          .called(1);
      verify(mockNavigationService.navigateTo(Routes.homeView)).called(1);
    });

    test(
        'requestLoginApi with valid form and failed login shows error snackbar',
        () async {
      when(mockLoginRepositoryImpl.requestLoginApi(
              LoginRequest(username: 'login', password: 'password123')))
          .thenAnswer((_) async => null);

      await loginViewModel.requestLoginApi();

      verify(mockSnackbarService.showSnackbar(
              message: 'Login failed: Invalid response'))
          .called(1);
    });

    test('requestLoginApi with exception shows error snackbar', () async {
      when(mockFormState.validate()).thenReturn(true);

      loginViewModel.emailController.text = 'test@example.com';
      loginViewModel.passwordController.text = 'password123';

      when(mockLoginRepositoryImpl
              .requestLoginApi(LoginRequest(username: '', password: '')))
          .thenThrow(Exception('Test exception'));

      await loginViewModel.requestLoginApi();

      verify(mockSnackbarService.showSnackbar(
              message: 'Login failed: Exception: Test exception'))
          .called(1);
    });
  });
}
