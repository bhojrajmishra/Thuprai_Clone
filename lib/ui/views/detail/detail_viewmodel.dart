import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thuprai_clone/app/app.locator.dart';

import 'package:thuprai_clone/ui/views/detail/model/book_model.dart';
import 'package:thuprai_clone/ui/views/detail/repository/book_repository_implementation.dart';

import 'package:thuprai_clone/ui/views/cart/model/cart_request_model.dart';

class DetailViewModel extends BaseViewModel {
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final Logger _logger = locator<Logger>();

  final BookRepositoryImplementation _bookRepository =
      locator<BookRepositoryImplementation>();

  BookModel? bookData;

  Future<void> fetchBookData(String slug) async {
    try {
      setBusy(true);
      _logger.i('Fetching book data for slug: $slug');

      bookData = await _bookRepository.getBookData(slug);

      if (bookData == null) {
        _logger.w('No book found for slug: $slug');
        // Optionally navigate to an error page or show a snackbar
        _snackbarService.showSnackbar(
          message: 'Book not found',
          duration: Duration(seconds: 2),
        );
      }

      notifyListeners();
    } catch (e) {
      setError(e);
      _logger.e('Error fetching book data for slug: $slug', e);
      _snackbarService.showSnackbar(
        message: 'Failed to load book details',
        duration: Duration(seconds: 2),
      );
    } finally {
      setBusy(false);
    }
  }

  Future<void> addCart(
      int id, String nepaliTitle, String frontCover, double price) async {
    setBusy(true);
    try {
      final cartRequest = CartRequestModel(
        path: "/book/$id",
        quantity: 1,
        url: "http://127.0.0.1:8000/v1/api/products/$id/",
      );
      debugPrint('Cart request: ${cartRequest.toJson()}');
      await _bookRepository.addCart(cartRequest);
      notifyListeners();

      _snackbarService.closeSnackbar();
      _snackbarService.showSnackbar(
        message: 'Successfully Added to cart',
        duration: Duration(seconds: 2),
      );
    } catch (e) {
      debugPrint('Error adding to cart: $e');
    } finally {
      setBusy(false);
    }
  }
}
