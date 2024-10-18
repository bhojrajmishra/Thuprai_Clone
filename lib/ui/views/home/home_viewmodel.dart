import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thuprai_clone/app/app.locator.dart';
import 'package:thuprai_clone/app/app.router.dart';
import 'package:thuprai_clone/ui/views/home/model/home_response_model.dart';
import 'package:thuprai_clone/ui/views/home/repository/home_repository_implementation.dart';

class HomeViewModel extends FutureViewModel<HomeResponseModel> {
  final HomeRepositoryImplementation _homeRepository =
      locator<HomeRepositoryImplementation>();
  final NavigationService _navigation = locator<NavigationService>();

  @override
  Future<HomeResponseModel> futureToRun() =>
      _homeRepository.getBooks().then((value) => value ?? HomeResponseModel());

  HomeResponseModel get homeData => data ?? HomeResponseModel();

  Future<void> refreshBooks() => runBusyFuture(futureToRun());

  void onItemSelected(String slug) => _navigateToBookDetails(slug: slug);

  void _navigateToBookDetails({required String slug}) {
    _navigation.navigateTo(
      Routes.detailView,
      arguments: DetailViewArguments(slug: slug),
    );
  }

  void onCarouselItemTapped(int index) {
    if (index < (homeData.featured?.length ?? 0)) {
      _navigateToBookDetails(slug: homeData.featured?[index].slug ?? '');
    }
  }

  void onViewAllTapped(String title) {
    _navigation.navigateTo(
      Routes.viewallView,
      arguments: ViewallViewArguments(title: title),
    );
  }
}
