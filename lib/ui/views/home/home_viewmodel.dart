import 'package:stacked/stacked.dart';
import 'package:thuprai_clone/app/app.locator.dart';
import 'package:thuprai_clone/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final NavigationService _navigate = locator<NavigationService>();

  //Mock data for the button listview items

  final List<Button> buttonItems = [
    Button('E-books'),
    Button('Audiobooks'),
    Button('Taskar'),
    Button('Drama'),
    Button('E-Kavita'),
  ];

  // Mock data for the ListView items
  final List<Item> items = [
    Item(
      imageUrl:
          'https://media.thuprai.com/__sized__/featured/sawarni-crop-c0-5__0-5-1200x630-70.jpg',
      title: 'Item 1',
    ),
    Item(
        imageUrl:
            'https://media.thuprai.com/__sized__/featured/sawarni-crop-c0-5__0-5-1200x630-70.jpg',
        title: 'Item 2'),
    Item(
        imageUrl:
            'https://media.thuprai.com/__sized__/featured/sawarni-crop-c0-5__0-5-1200x630-70.jpg',
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
    _navigate.navigateTo(
      Routes.detailView,
    );
  }
}

void navigateToDetails() {
  // Handle navigation to the detailed page
}

// Define a model for the ListView items
class Item {
  final String imageUrl;
  final String title;

  Item({required this.imageUrl, required this.title});
}

//Define a model for the listview button items
class Button {
  final String text;

  Button(this.text);
}
