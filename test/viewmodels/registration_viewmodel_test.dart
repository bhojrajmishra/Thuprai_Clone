import 'package:flutter_test/flutter_test.dart';
import 'package:thuprai_clone/app/app.locator.dart';
import 'package:thuprai_clone/ui/views/registration/registration_viewmodel.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('RegistrationViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());

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
  });
}
