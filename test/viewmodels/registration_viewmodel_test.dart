import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:thuprai_clone/app/app.locator.dart';
import 'package:thuprai_clone/ui/views/registration/registration_viewmodel.dart';

import '../helpers/test_helpers.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  group('RegistrationViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
    setUpAll(() => setupLocator());

    test('When user taps on the register button, the user should be registered',
        () async {
      final registration = RegistrationViewModel();

      await registration.requestRegistrationApi();

      expect(
          // Verify that the user is registered
          registration.requestRegistrationApi,
          equals(true)

          // The user should be registered
          );
    });

    test('when user taps on the resgister for error ', () async {
      final registration = RegistrationViewModel();

      await registration.requestRegistrationApi();

      expect(
          // Verify that the user is registered
          registration.requestRegistrationApi,
          equals(false)

          // The user should not be registered
          );
    });
  });
}
