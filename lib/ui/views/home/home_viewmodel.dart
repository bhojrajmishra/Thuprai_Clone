import 'package:stacked/stacked.dart';
import 'package:thuprai_clone/app/app.locator.dart';
import 'package:thuprai_clone/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thuprai_clone/ui/views/home/model/home_response_model.dart';
import 'package:thuprai_clone/ui/views/home/repository/home_repository.dart';

class HomeViewModel extends BaseViewModel {
  final NavigationService _navigation = locator<NavigationService>();

  HomeViewModel();

  // Mock data for the button listview items
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
    Item(
      imageUrl: 'https://via.placeholder.com/150',
      title: 'Title 5',
      description: 'Description 5',
    ),
  ];
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

//   Future<void> fetchBooks() async {
//     setBusy(true);
//     try {
//       bookResponse = await _bookRepository.getBooks();
//     } catch (e) {
//       errorMessage = 'Failed to fetch books';
//     }
//     setBusy(false);
//   }

//   List<BookResponseModel> get popularBooks {
//     return bookResponse?.results.take(5).toList() ?? [];
//   }

//   List<BookResponseModel> get newReleases {
//     return bookResponse?.results.skip(5).take(5).toList() ?? [];
//   }

//   List<BookResponseModel> get recentEbooks {
//     return bookResponse?.results.skip(10).take(5).toList() ?? [];
//   }
// }

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
