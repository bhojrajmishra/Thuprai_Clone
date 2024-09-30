import 'package:thuprai_clone/ui/views/home/model/home_response_model.dart';

abstract class HomeRepository {
  Future<HomeResponseModel?> getBooks();
}
