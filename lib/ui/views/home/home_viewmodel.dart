import 'package:stacked/stacked.dart';
import 'package:thuprai_clone/app/app.locator.dart';
import 'package:thuprai_clone/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  // Mock data for the ListView items
  final List<Item> items = [
    Item(
        imageUrl: 'https://media.thuprai.com/front_covers/sawarni.jpg',
        title: 'Item 1'),
    Item(
        imageUrl: 'https://media.thuprai.com/front_covers/sawarni.jpg',
        title: 'Item 2'),
    Item(
        imageUrl: 'https://media.thuprai.com/front_covers/sawarni.jpg',
        title: 'Item 3'),
    Item(
        imageUrl: 'https://media.thuprai.com/front_covers/sawarni.jpg',
        title: 'Item 4'),
    Item(
        imageUrl: 'https://media.thuprai.com/front_covers/sawarni.jpg',
        title: 'Item 5'),
  ];

  void onItemSelected(String title) {
    // Handle navigation to the detailed page with the selected title
    _navigationService.navigateTo(
      Routes.detailView,
      arguments: (title: title),
    );
  }
}

// Define a model for the ListView items
class Item {
  final String imageUrl;
  final String title;

  Item({required this.imageUrl, required this.title});
}
