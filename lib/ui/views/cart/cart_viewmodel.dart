import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thuprai_clone/app/app.locator.dart';
import 'package:thuprai_clone/app/app.router.dart';

class CartViewModel extends BaseViewModel {
  final NavigationService _navigation = locator<NavigationService>();

  CartViewModel();

  // Mock data for the button listview items

  final List<String> buttonItems = [
    'E-books',
    'Audiobooks',
    'Taskar',
    'Drama',
    'E-Kavita',
  ];

  final List<Items> items = [
    Items(
        imageUrl:
            'https://media.thuprai.com/__sized__/front_covers/music-myth-and-melody-f-thumbnail-100x145-70.jpg',
        title: 'title1',
        quantity: 1),
    Items(
        imageUrl:
            'https://media.thuprai.com/__sized__/front_covers/music-myth-and-melody-f-thumbnail-100x145-70.jpg',
        title: 'title1'),
    Items(
        imageUrl:
            'https://media.thuprai.com/__sized__/front_covers/music-myth-and-melody-f-thumbnail-100x145-70.jpg',
        title: 'title1'),
    Items(
        imageUrl:
            'https://media.thuprai.com/__sized__/front_covers/music-myth-and-melody-f-thumbnail-100x145-70.jpg',
        title: 'title1'),
  ];

  List<ItemDescription> itemDescriptions = [
    ItemDescription(name: "hshfew", price: 200),
    ItemDescription(name: "hshfew", price: 200),
    ItemDescription(name: "hshfew", price: 200),
  ];

  void onItemSelected(String slug) {
    _navigation.navigateTo(
      Routes.detailView,
      arguments: DetailViewArguments(slug: slug),
    );
  }

  void incrementItem(int index) {
    itemDescriptions[index].price += 1;
    notifyListeners();
  }

  void decrementItem(int index) {
    itemDescriptions[index].price -= 1;
    notifyListeners();
  }

  void updateCount(int index, int count) {
    itemDescriptions[index].price = count.toDouble();
    notifyListeners();
  }

  void onAddItem() {
    items.add(Items(
        imageUrl:
            'https://media.thuprai.com/__sized__/front_covers/music-myth-and-melody-f-thumbnail-100x145-70.jpg',
        title: 'title1'));
    notifyListeners();
  }

  void onRemoveItem(int index) {
    items.removeAt(index);
    notifyListeners();
  }
}

class ItemDescription {
  final String name;
  double price;

  ItemDescription({
    required this.name,
    required this.price,
  });
}

class Items {
  final String imageUrl;
  final String title;
  final int? quantity;

  Items({
    required this.imageUrl,
    required this.title,
    this.quantity = 1,
  });
}
