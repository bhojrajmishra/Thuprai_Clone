import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:thuprai_clone/app/app.locator.dart';
import 'package:thuprai_clone/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thuprai_clone/ui/views/home/model/home_response_model.dart';
import 'package:thuprai_clone/ui/views/home/repository/home_repository_implementation.dart';

class HomeViewModel extends BaseViewModel with Initialisable {
  final NavigationService _navigation = locator<NavigationService>();
  final HomeRepositoryImplementation _homeRepositoryImplementation =
      locator<HomeRepositoryImplementation>();

  HomeViewModel();

  @override
  Future<void> initialise() async {
    await Future.delayed(const Duration(seconds: 2));
    fetchBooks();
    debugPrint('HomeViewModel initialised');
  }

  Future<HomeResponseModel?> fetchBooks() async {
    try {
      final response = await _homeRepositoryImplementation.getBooks();

      return response;
    } on DioException catch (e) {
      throw Exception('An error occurred: $e');
    }
  }

  // // Mock data for the button listview items
  final List<Button> buttonItems = [
    Button('E-books'),
    Button('Audiobooks'),
    Button('Taskar'),
    Button('Drama'),
    Button('E-Kavita'),
  ];

  final List<Item> items = [
    Item(
      imageUrl: 'https://via.placeholder.com/150',
      title: 'Title 1',
      description: 'Description 1',
    ),
    Item(
      imageUrl: 'https://via.placeholder.com/150',
      title: 'Title 2',
      description: 'Description 2',
    ),
    Item(
      imageUrl: 'https://via.placeholder.com/150',
      title: 'Title 3',
      description: 'Description 3',
    ),
    Item(
      imageUrl: 'https://via.placeholder.com/150',
      title: 'Title 4',
      description: 'Description 4',
    ),
  ];

// List<HomeResponseModel> items = [

// ];

  void onItemSelected(String slug) {
    _navigation.navigateTo(
      Routes.detailView,
      arguments: DetailViewArguments(slug: slug),
    );
  }

  void onButtonSelected(String text) {
    _navigation.navigateTo(
      Routes.detailView,
      arguments: DetailViewArguments(slug: text),
    );
  }
}

class Item {
  final String imageUrl;
  final String title;
  final String description;

  Item({
    required this.imageUrl,
    required this.title,
    required this.description,
  });
}

class Button {
  final String text;

  Button(this.text);
}
