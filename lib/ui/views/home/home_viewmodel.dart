import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thuprai_clone/app/app.locator.dart';
import 'package:thuprai_clone/app/app.router.dart';
import 'package:thuprai_clone/ui/views/home/model/home_response_model.dart';
import 'package:thuprai_clone/ui/views/home/repository/home_repository_implementation.dart';

class HomeViewModel extends BaseViewModel {
  // Dependencies
  final _homeRepository = locator<HomeRepositoryImplementation>();
  final _navigation = locator<NavigationService>();

  // State
  HomeResponseModel? _homeData;
  HomeResponseModel? get homeData => _homeData;

  // Initialize the view model
  Future<void> init() async {
    await fetchBooks();
  }

  // Fetch books data
  Future<void> fetchBooks() async {
    setBusy(true);
    try {
      final result = await _homeRepository.getBooks();
      _homeData = result ?? HomeResponseModel();
      notifyListeners();
    } catch (error) {
      setError(error);
    } finally {
      setBusy(false);
    }
  }

  // Refresh books
  Future<void> refreshBooks() async {
    await fetchBooks();
  }

  // Navigate to book details
  void onItemSelected(String slug) {
    _navigation.navigateTo(
      Routes.detailView,
      arguments: DetailViewArguments(slug: slug),
    );
  }

  // Handle carousel item tap
  void onCarouselItemTapped(int index) {
    if (index < (_homeData?.featured?.length ?? 0)) {
      String slug = _homeData?.featured?[index].slug ?? '';
      onItemSelected(slug);
    }
  }

  // Navigate to view all page
  void onViewAllTapped(String title) {
    _navigation.navigateTo(
      Routes.viewallView,
      arguments: ViewallViewArguments(title: title),
    );
  }
}
