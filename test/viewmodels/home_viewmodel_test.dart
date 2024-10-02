import 'package:flutter_test/flutter_test.dart';
import 'package:thuprai_clone/app/app.locator.dart';
import 'package:thuprai_clone/ui/views/home/home_viewmodel.dart';

import '../helpers/test_helpers.dart';

void main() {
  HomeViewModel getModel() => HomeViewModel();

  group('HomeViewmodelTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
    setUpAll(() => setupLocator());
  });
  test('Homeview model is working', () async {
    final model = getModel();
    expect(model, isA<HomeViewModel>());
  });
  test('fetch book', () async {
    final model = getModel();
    await model.getBooks();
    expect(model.fetchData, isNotNull);
  });
  test('fetch book', () async {
    final model = getModel();
    await model.getBooks();
    expect(model.fetchData, isInstanceOf());
  });
  test('fetch book', () async {
    final model = getModel();
    await model.getBooks();
    expect(model.fetchData, isList);
  });
  test('onitem selected', () async {
    final model = getModel();
    model.onItemSelected;
    expect(model.onItemSelected, isNotNull);
  });

  test('onitem selected', () async {
    final model = getModel();
    model.onItemSelected;
    expect(model.onItemSelected, isNot(0));
  });

  test('onitem selected', () async {
    final model = getModel();
    model.onItemSelected;
    expect(model.onItemSelected, isNot(1));
  });

  test('onitem selected', () async {
    final model = getModel();
    model.onItemSelected;
    expect(model.onItemSelected, isNot(2));
  });
}
