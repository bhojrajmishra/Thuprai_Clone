import 'package:flutter_test/flutter_test.dart';
import 'package:thuprai_clone/app/app.locator.dart';
import 'package:thuprai_clone/network/secure_storage.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('SecureStorage Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
    setUpAll(() => setupLocator());
  });

  test('wtiretoken', () async {
    final model = SecureStorageService();
    await model.saveData('key', 'value');
    expect(model.saveData, same('value'));
  });

  test('readtoken', () async {
    final model = SecureStorageService();
    await model.getData('key');
    expect(model.getData, same('value'));
  });

  test('deletetoken', () async {
    final model = SecureStorageService();
    await model.deleteData('key');
    expect(model.deleteData, same('value'));
  });
}
