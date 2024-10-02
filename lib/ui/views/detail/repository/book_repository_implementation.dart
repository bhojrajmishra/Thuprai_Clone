// book_repository_implementation.dart
import 'package:thuprai_clone/app/app.locator.dart';
import 'package:thuprai_clone/network/retro_client.dart';
import 'package:thuprai_clone/ui/views/detail/model/book_model.dart';
import 'book_repository.dart';

final RetroClient _retroClient = locator<RetroClient>();

class BookRepositoryImplementation implements BookRepository {
  @override
  Future<BookModel> getBookData(String slug) async {
    try {
      final response = await _retroClient.getBookData(slug);
      return response;
    } catch (e) {
      throw Exception('Failed to fetch book data: $e');
    }
  }
}
