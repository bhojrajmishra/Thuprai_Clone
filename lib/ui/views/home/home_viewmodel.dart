import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:thuprai_clone/app/app.locator.dart';
import 'package:thuprai_clone/ui/views/home/model/home_response_model.dart';
import 'package:thuprai_clone/ui/views/home/repository/home_repository_implementation.dart';

class HomeViewModel extends BaseViewModel with Initialisable {
  final HomeRepositoryImplementation _homeRepositoryImplementation =
      locator<HomeRepositoryImplementation>();

  @override
  Future<void> initialise() async {
    await getBooks();
  }

  HomeResponseModel? fetchData = HomeResponseModel();

  Future<void> getBooks() async {
    setBusy(true);
    try {
      final response = await _homeRepositoryImplementation.getBooks();
      if (response != null) {
        debugPrint('Response: $response');
        fetchData = response;
        debugPrint('Response: $fetchData');
      } else {
        throw Exception('No data received');
      }
    } catch (e) {
      throw Exception('An error occurred: $e');
    } finally {
      setBusy(false);
    }
  }

  void onItemSelected(String? slug) {
    debugPrint('Selected: $slug');
  }

  void onButtonSelected(String text) {}
}
