import 'package:flutter_test/flutter_test.dart';
import 'package:thuprai_clone/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('DetailViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
    setUpAll(() => setupLocator());
  });
}
