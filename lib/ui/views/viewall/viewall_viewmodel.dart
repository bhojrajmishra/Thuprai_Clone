import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thuprai_clone/app/app.router.dart';
import 'package:thuprai_clone/ui/views/home/home_viewmodel.dart';

class ViewallViewModel extends BaseViewModel with Initialisable {
  final HomeViewModel _homeViewModel = HomeViewModel();
  final NavigationService _navigationService = NavigationService();
  @override
  Future<void> initialise() async {
    await getBooks();
    debugPrint('ViewallViewModel initialised ');
  }

  List<dynamic> coverUrls = [];

  List<String> titles = [];

  Future<void> getBooks() async {
    try {
      setBusy(true);
      await _homeViewModel.getBooks();
      titles.addAll(_homeViewModel.featuredTitles);
      titles.addAll(_homeViewModel.ebookTitles);
      titles.addAll(_homeViewModel.audiobookTitles);
      titles.addAll(_homeViewModel.newReleaseTitles);
      titles.addAll(_homeViewModel.bestSellerTitles);
      coverUrls.addAll(_homeViewModel.ebookCoverUrls);
      coverUrls.addAll(_homeViewModel.audiobookCoverUrls);
      coverUrls.addAll(_homeViewModel.newReleaseCoverUrls);
      coverUrls.addAll(_homeViewModel.bestSellerCoverUrls);
      coverUrls.addAll(_homeViewModel.featuredImageUrls);
      notifyListeners();
    } catch (e) {
      setError(e);
      debugPrint('Error fetching books: $e');
    } finally {
      setBusy(false);
    }
  }

  bool isGridView = true;

  void toggleViewMode() {
    isGridView = !isGridView;
    notifyListeners();
  }

  void onModelReady() {
    initialise();
  }

  void onItemSelected() {
    _navigationService.navigateTo(Routes.detailView);
  }
}
