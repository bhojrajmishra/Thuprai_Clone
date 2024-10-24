import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:thuprai_clone/app/app.bottomsheets.dart';
import 'package:thuprai_clone/app/app.dialogs.dart';
import 'package:thuprai_clone/app/app.locator.dart';
import 'package:thuprai_clone/main.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupBottomSheetUi();
  setupDialogUi();
  FlutterSecureStorage.setMockInitialValues({});
  group('End-to-End Test', () {
    testWidgets('Complete app flow test', (WidgetTester tester) async {
      // Start the app
      await tester.pumpWidget(const MainApp(env: ''));
      await tester.pumpAndSettle();

      // Test 1: Startup View
      expect(find.text('Thuprai'), findsOneWidget);
      expect(find.text('Loading ...'), findsOneWidget);
      await tester.pumpAndSettle();

      // Wait for the app to load
      await Future.delayed(const Duration(seconds: 5));
      //Test 1.1: check if user have token or not
      final storage = FlutterSecureStorage();
      final token = await storage.read(key: 'token');
      if (token != null) {
        // Test 1.2: Home View
        expect(find.byType(RefreshIndicator), findsOneWidget);
        return;
      } else {
        // Test 2: Login View
        expect(find.text('Please login to your account using'), findsOneWidget);
        // Test login form
        await tester.enterText(
            find.widgetWithText(TextField, 'Email'), 'test@example.com');
        await tester.enterText(
            find.widgetWithText(TextField, 'Password'), 'password123');

        // Find and tap login button
        final loginButton = find.widgetWithText(ElevatedButton, 'Continue');
        await tester.tap(loginButton);
        await tester.pumpAndSettle();
      }

      // Test 3: Registration View Navigation
      final signUpButton = find.widgetWithText(TextButton, 'Sign Up');
      await tester.tap(signUpButton);
      await tester.pumpAndSettle();

      // Test registration form
      expect(find.text('Hi there! Welcome to Thuprai'), findsOneWidget);

      await tester.enterText(
          find.widgetWithText(TextField, 'Full Name'), 'Test User');
      await tester.enterText(
          find.widgetWithText(TextField, 'Email'), 'test@example.com');
      await tester.enterText(
          find.widgetWithText(TextField, 'Password'), 'password123');

      // Test 4: Home View
      // Assuming successful login/registration redirects to home
      expect(find.byType(RefreshIndicator), findsOneWidget);

      // Test carousel
      final carousel = find.byType(PageView);
      expect(carousel, findsOneWidget);

      // Test horizontal scrolling in book sections
      final horizontalList = find.byType(ListView).first;
      await tester.drag(horizontalList, const Offset(-300, 0));
      await tester.pumpAndSettle();

      // Test 5: Detail View
      // Find and tap on first book
      final firstBook = find.byType(GestureDetector).first;
      await tester.tap(firstBook);
      await tester.pumpAndSettle();

      // Verify detail view elements
      expect(find.text('Book Details'), findsOneWidget);
      expect(find.byType(Image), findsWidgets);

      // Test buy now and add to cart buttons
      expect(find.text('Buy Now'), findsOneWidget);
      expect(find.text('Add to Cart'), findsOneWidget);

      // Test 6: Cart View
      final cartIcon = find.byIcon(Icons.shopping_cart);
      await tester.tap(cartIcon);
      await tester.pumpAndSettle();

      // Test cart functionality
      final addToCartButton = find.text('Add to Cart');
      await tester.tap(addToCartButton);
      await tester.pumpAndSettle();

      // Verify cart items
      expect(find.byType(ListView), findsOneWidget);

      // Test checkout button
      final checkoutButton = find.text('Checkout');
      expect(checkoutButton, findsOneWidget);
    });

    testWidgets('Test form validation', (WidgetTester tester) async {
      await tester.pumpWidget(const MainApp(env: ''));
      await tester.pumpAndSettle();

      // Test login validation
      final loginButton = find.widgetWithText(ElevatedButton, 'Continue');
      await tester.tap(loginButton);
      await tester.pumpAndSettle();

      // Expect error messages
      expect(find.text('Please enter a valid email'), findsOneWidget);
      expect(
          find.text('Password must be at least 6 characters'), findsOneWidget);

      // Test registration validation
      final signUpButton = find.widgetWithText(TextButton, 'Sign Up');
      await tester.tap(signUpButton);
      await tester.pumpAndSettle();

      final registerButton = find.widgetWithText(ElevatedButton, 'Sign Up');
      await tester.tap(registerButton);
      await tester.pumpAndSettle();

      // Expect error messages
      expect(find.text('Please enter your full name'), findsOneWidget);
      expect(find.text('Please enter a valid email'), findsOneWidget);
      expect(
          find.text('Password must be at least 6 characters'), findsOneWidget);
    });
  });
}
