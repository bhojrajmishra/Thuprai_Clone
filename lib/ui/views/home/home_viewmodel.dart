import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thuprai_clone/app/app.locator.dart';
import 'package:thuprai_clone/app/app.router.dart';
import 'package:thuprai_clone/ui/views/home/model/home_response_model.dart';
import 'package:thuprai_clone/ui/views/home/repository/home_repository_implementation.dart';

class HomeViewModel extends BaseViewModel with Initialisable {
  final HomeRepositoryImplementation _homeRepository =
      locator<HomeRepositoryImplementation>();
  final NavigationService _navigation = locator<NavigationService>();

  HomeResponseModel? fetchData;

  List<String> featuredImageUrls = [];
  List<String> featuredTitles = [];
  List<String> ebookCoverUrls = [];
  List<String> ebookTitles = [];
  List<String> audiobookCoverUrls = [];
  List<String> audiobookTitles = [];
  List<String> newReleaseCoverUrls = [];
  List<String> newReleaseTitles = [];
  List<String> bestSellerCoverUrls = [];
  List<String> bestSellerTitles = [];

  @override
  Future<void> initialise() async {
    await getBooks();
  }

  Future<void> getBooks() async {
    try {
      setBusy(true);
      fetchData = await _homeRepository.getBooks();
      _updateMappedLists();
      notifyListeners();
    } catch (e) {
      setError(e);
      debugPrint('Error fetching books: $e');
    } finally {
      setBusy(false);
    }
  }

  void _updateMappedLists() {
    featuredImageUrls =
        fetchData?.featured?.map((e) => e.image ?? '').toList() ?? [];
    featuredTitles =
        fetchData?.featured?.map((e) => e.title ?? '').toList() ?? [];

    ebookCoverUrls =
        fetchData?.ebooks?.map((e) => e.frontCover ?? '').toList() ?? [];
    ebookTitles = fetchData?.ebooks?.map((e) => e.title ?? '').toList() ?? [];

    audiobookCoverUrls =
        fetchData?.audiobooks?.map((e) => e.frontCover ?? '').toList() ?? [];
    audiobookTitles =
        fetchData?.audiobooks?.map((e) => e.title ?? '').toList() ?? [];

    newReleaseCoverUrls =
        fetchData?.newReleases?.map((e) => e.frontCover ?? '').toList() ?? [];
    newReleaseTitles =
        fetchData?.newReleases?.map((e) => e.title ?? '').toList() ?? [];

    bestSellerCoverUrls =
        fetchData?.bestsellingEbooks?.map((e) => e.frontCover ?? '').toList() ??
            [];
    bestSellerTitles =
        fetchData?.bestsellingEbooks?.map((e) => e.title ?? '').toList() ?? [];
  }

  void onItemSelected(String slug) {
    navigateToBookDetails(slug: slug);
    debugPrint(slug);
  }

  void navigateToBookDetails({required String slug}) {
    _navigation.navigateTo(
      Routes.detailView,
      arguments: DetailViewArguments(slug: slug),
    );
  }

  void onCarouselItemTapped(int index) {
    if (index < (fetchData?.featured?.length ?? 0)) {
      navigateToBookDetails(slug: fetchData?.featured?[index].slug ?? '');
      debugPrint('Tapped on carousel item $index');
      debugPrint(fetchData?.featured?[index].slug ?? '');
    }
  }
}
