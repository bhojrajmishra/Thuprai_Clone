import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thuprai_clone/app/app.locator.dart';
import 'package:thuprai_clone/app/app.router.dart';
import 'package:thuprai_clone/ui/views/home/home_viewmodel.dart';
import 'package:thuprai_clone/ui/views/home/model/home_response_model.dart';

class ViewallViewModel extends BaseViewModel {
  final HomeViewModel _homeViewModel = locator<HomeViewModel>();
  final NavigationService _navigationService = locator<NavigationService>();

  String _title = '';
  String get title => _title;

  List<dynamic> _items = [];
  List<dynamic> get items => _items;

  bool _isGridView = true;
  bool get isGridView => _isGridView;

  void init(String title) {
    _title = title;
    _loadItems();
  }

  void _loadItems() {
    setBusy(true);
    switch (_title) {
      case "New Releases":
        _items = _homeViewModel.homeData!.newReleases ?? [];
        break;
      case "Recent E-books":
        _items = _homeViewModel.homeData!.ebooks ?? [];
        break;
      case "Recent Audiobooks":
        _items = _homeViewModel.homeData!.audiobooks ?? [];
        break;
      case "Best Sellers":
        _items = _homeViewModel.homeData!.bestsellingEbooks ?? [];
        break;
      default:
        _items = [];
    }
    setBusy(false);
  }

  void toggleViewMode() {
    _isGridView = !_isGridView;
    notifyListeners();
  }

  void onItemSelected(String slug) {
    _navigationService.navigateTo(
      Routes.detailView,
      arguments: DetailViewArguments(slug: slug),
    );
  }
}
