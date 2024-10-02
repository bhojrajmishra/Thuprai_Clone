import 'package:thuprai_clone/ui/views/detail/model/book_model.dart';

abstract class BookRepository {
  Future<BookModel> getBookData(String slug);
}
