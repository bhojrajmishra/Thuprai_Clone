import 'package:thuprai_clone/ui/views/cart/model/cart_request_model.dart';
import 'package:thuprai_clone/ui/views/detail/model/book_model.dart';

abstract class BookRepository {
  Future<BookModel> getBookData(String slug);
  Future<CartRequestModel> addCart(CartRequestModel addToCart);
}
