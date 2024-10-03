import 'package:flutter_test/flutter_test.dart';
import 'package:thuprai_clone/app/app.locator.dart';
import 'package:thuprai_clone/ui/views/detail/detail_viewmodel.dart';

import '../helpers/test_helpers.dart';

void main() {
  final model = DetailViewModel();
  group('DetailViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
    setUpAll(() => setupLocator());
  });

  test("this is test", () async {
    model.bookData;
    expect(model.bookData, isA<DetailViewModel>());
  });
}
