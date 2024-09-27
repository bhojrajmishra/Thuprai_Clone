import 'package:thuprai_clone/ui/views/home/model/home_response_model.dart';

abstract class RetroClient {
  Future<HomeResponseModel> get(String url, {Map<String, String> headers});

  Future<HomeResponseModel> post(String url,
      {Map<String, String> headers, dynamic body});
}
