import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thuprai_clone/app/app.locator.dart';
import 'package:thuprai_clone/app/app.router.dart';
import 'package:thuprai_clone/ui/views/detail/model/book_model.dart';
import 'package:thuprai_clone/ui/views/detail/repository/book_repository_implementation.dart';

class DetailViewModel extends BaseViewModel {
  final NavigationService _navigation = locator<NavigationService>();
  final BookRepositoryImplementation _bookRepository =
      locator<BookRepositoryImplementation>();

  BookModel? bookData;

  Future<void> fetchBookData(String slug) async {
    try {
      setBusy(true);
      bookData = await _bookRepository.getBookData(slug);
      notifyListeners();
    } catch (e) {
      setError(e);
      debugPrint('Error fetching book data: $e');
    } finally {
      setBusy(false);
    }
  }

  void navigationToCart(
      int id, String nepaliTitle, String frontCover, double price) {
    _navigation.navigateTo(Routes.cartView);
  }
}
