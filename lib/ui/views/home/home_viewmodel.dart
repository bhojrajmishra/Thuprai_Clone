import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thuprai_clone/app/app.locator.dart';
import 'package:thuprai_clone/app/app.router.dart';
import 'package:thuprai_clone/ui/views/home/model/home_response_model.dart';
import 'package:thuprai_clone/ui/views/home/repository/home_repository_implementation.dart';

class HomeViewModel extends BaseViewModel with Initialisable {
  final HomeRepositoryImplementation _homeRepositoryImplementation =
      locator<HomeRepositoryImplementation>();
  final NavigationService _navigation = locator<NavigationService>();

  @override
  Future<void> initialise() async {
    await getBooks();
  }

  HomeResponseModel? fetchData = HomeResponseModel();

  void navigateToBookDetails({required String slug}) {
    // Navigate to the book details page
    _navigation.navigateTo(Routes.detailView);
  }

  // void navigateToAllViewBook({required String slug}) {
  //   // Navigate to the book details page
  //   _navigation.navigateTo(Routes.allBooksView);
  // }

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

// void onViewAllTapped() {
//     debugPrint('View all tapped');
//     _navigation.navigateTo(Routes.allBooksView);
//     debugPrint('Navigating to all books view');
//   }

  void onItemSelected(String slug) {
    debugPrint('Item selected: $slug');
    navigateToBookDetails(
      slug: slug,
    );

    debugPrint('Navigating to detail view');
  }

  void onButtonSelected(String text) {
    debugPrint('Button selected: $text');

    _navigation.navigateTo(Routes.cartView);

    debugPrint('Navigating to cart view');
  }

  void onCarouselItemTapped(int index) {
    debugPrint('Carousel item tapped: $index');

    _navigation.navigateTo(
      Routes.detailView,
      arguments: DetailViewArguments(slug: fetchData!.featured![index].slug),
    );
    debugPrint('Book slug: ${fetchData!.featured![index].slug}');
  }
}
