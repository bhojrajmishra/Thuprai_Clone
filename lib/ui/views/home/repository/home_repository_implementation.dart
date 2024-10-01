import 'package:flutter/material.dart';
import 'package:thuprai_clone/app/app.locator.dart';
import 'package:thuprai_clone/network/retro_client.dart';
import 'package:thuprai_clone/ui/views/home/model/home_response_model.dart';
import 'package:thuprai_clone/ui/views/home/repository/home_repository.dart';

final RetroClient _retroClient = locator<RetroClient>();

class HomeRepositoryImplementation implements HomeRepository {
  @override
  Future<HomeResponseModel?> getBooks() async {
    final data = await _retroClient.getBooks();
    return data;
  }
}
