import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:integration_test/integration_test.dart';
import 'package:thuprai_clone/app/app.bottomsheets.dart';
import 'package:thuprai_clone/app/app.dialogs.dart';
import 'package:thuprai_clone/app/app.locator.dart';
import 'package:thuprai_clone/ui/views/login/login_view.dart';
import 'key_string.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupBottomSheetUi();
  setupDialogUi();
  FlutterSecureStorage.setMockInitialValues({});
  Get.testMode = true;

  group('Login View integration test', () {
    testWidgets('first test', (tester) async {
      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: const LoginView(),
            );
          },
        ),
      );

      /// Check if all the required widgets are available.
      expect(emailTextfield, findsOneWidget);
      expect(passwordTextfield, findsOneWidget);
      expect(loginButton, findsOneWidget);

      /// Check if login is prevented when it fails validation and validation messages can be seen
      await tester.enterText(find.byKey(const Key('email')), '');
      await tester.enterText(find.byKey(const Key('password')), '');

      await tester.ensureVisible(loginButton);
      await tester.tap(
        loginButton,
      );
      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
      await Future.delayed(const Duration(seconds: 2));

      /// Check if login is allowed when valid credentials are inputted.
      await tester.enterText(emailTextfield, 'ram@gmail.com');
      await tester.enterText(passwordTextfield, 'ram@#123');
      await tester.tap(loginButton);
      await Future.delayed(const Duration(seconds: 3));

      await tester.pumpAndSettle();
    });
  });
}
