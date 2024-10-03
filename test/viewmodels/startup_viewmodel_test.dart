import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:thuprai_clone/app/app.locator.dart';
import 'package:thuprai_clone/ui/views/startup/startup_viewmodel.dart';

import '../helpers/test_helpers.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  group('DetailViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
    setUpAll(() => setupLocator());
    setUpAll(() {
      FlutterSecureStorage.setMockInitialValues({});
    });
  });

  test('when startup', () async {
    final model = StartupViewModel();
    await model.runStartupLogic();
    expect(model.runStartupLogic(), equals(true));
  });

  test('when startup', () async {
    final model = StartupViewModel();
    await model.runStartupLogic();
    expect(model.runStartupLogic(), equals(false));
  });
}
