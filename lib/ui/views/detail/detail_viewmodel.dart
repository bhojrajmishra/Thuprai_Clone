import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:thuprai_clone/app/app.locator.dart';
import 'package:thuprai_clone/ui/views/cart/model/cart_model.dart';

import 'package:thuprai_clone/ui/views/detail/model/book_model.dart';
import 'package:thuprai_clone/ui/views/detail/repository/book_repository_implementation.dart';

import 'package:thuprai_clone/ui/views/cart/model/cart_request_model.dart';

class DetailViewModel extends BaseViewModel {
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

  // Future<void> addCart(
  //     {required BookModel? bookData,
  //     required int quantity,
  //     required int bookId}) async {
  //   if (bookData == null) {
  //     debugPrint('Book data is null');
  //     return;
  //   }

  //   setBusy(true);
  //   try {
  //     await _bookRepository.addCart(CartRequestModel(
  //       path: "/book/${bookData.slug}",
  //       quantity: quantity,
  //       url: "http://127.0.0.1:8000/v1/api/products/$bookId",
  //     ));
  //     notifyListeners();
  //   } catch (e) {
  //     debugPrint('Error adding to cart: $e');
  //     setError(e);
  //   } finally {
  //     setBusy(false);
  //   }
  // }

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
    } catch (e) {
      debugPrint('Error adding to cart: $e');
    } finally {
      setBusy(false);
    }
  }
}
