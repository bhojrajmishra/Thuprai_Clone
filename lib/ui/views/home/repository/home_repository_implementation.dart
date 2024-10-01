import 'package:flutter/material.dart';
import 'package:thuprai_clone/app/app.locator.dart';
import 'package:thuprai_clone/network/retro_client.dart';
import 'package:thuprai_clone/ui/views/home/model/home_response_model.dart';
import 'package:thuprai_clone/ui/views/home/repository/home_repository.dart';

final RetroClient _retroClient = locator<RetroClient>();

class HomeRepositoryImplementation implements HomeRepository {
  @override
  Future<HomeResponseModel?> getBooks() async {
    try {
      final response = await _retroClient.getBooks();
      if (response != null) {
        return response;
      } else {
        throw Exception('No data received');
      }
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }
}
