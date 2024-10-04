import 'package:dio/dio.dart';
import 'package:thuprai_clone/app/app.locator.dart';
import 'package:thuprai_clone/network/retro_client.dart';
import 'package:thuprai_clone/ui/views/cart/model/cart_model.dart';

import 'package:thuprai_clone/ui/views/cart/model/cart_request_model.dart';
import 'package:thuprai_clone/ui/views/detail/model/book_model.dart';
import 'book_repository.dart';

class BookRepositoryImplementation implements BookRepository {
  final RetroClient _retroClient = locator<RetroClient>();

  @override
  Future<BookModel> getBookData(String slug) async {
    try {
      final response = await _retroClient.getBookData(slug);
      return response;
    } catch (e) {
      throw Exception('Failed to fetch book data: $e');
    }
  }

  @override
  Future<void> addCart(CartRequestModel cartRequest) async {
    try {
      await _retroClient.addCart(cartRequest);
    } catch (e) {
      throw Exception('Failed to add to cart: $e');
    }
  }
}
