import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thuprai_clone/app/app.router.dart';

class DetailViewModel extends BaseViewModel {
  final NavigationService _navigation = NavigationService();
  final List<Item> items = [
    Item(
      imageUrl: 'https://media.thuprai.com/front_covers/sawarni.jpg',
      title: 'Item 1',
      author: 'Author ',
      description: 'Description ',
    ),
    Item(
      imageUrl: 'https://media.thuprai.com/front_covers/sawarni.jpg',
      title: 'Item 2',
      author: 'Author 2',
      description: 'Description ',
    ),
    Item(
      imageUrl: 'https://media.thuprai.com/front_covers/sawarni.jpg',
      title: 'Item ',
      author: 'Author ',
      description: 'Description ',
    ),
    Item(
      imageUrl: 'https://media.thuprai.com/front_covers/sawarni.jpg',
      title: 'Item ',
      author: 'Author ',
      description: 'Description ',
    ),
    Item(
      imageUrl: 'https://media.thuprai.com/front_covers/sawarni.jpg',
      title: 'Item ',
      author: 'Author ',
      description: 'Description ',
    ),
  ];

  void onItemSelected(String slug) {
    debugPrint(slug);
  }

  void NavigationToCart() {
    _navigation.navigateTo(Routes.cartView);
  }

  final descriptions = [
    Description(
      title: 'पुस्तकको बारेमा ',
      subtitle:
          '२०० वर्षअघिसम्म चीन र भारत विश्वका पहिलो र दोस्रो ठूला अर्थतन्त्र थिए । उनीहरू त्यसरी सम्पन्न हुँदा नै काठमाडौं उपत्यका केही हदसम्म समृद्ध हुन पुगेको थियो । उत्तर-दक्षिण अन्तरदेशीय व्यापारको केन्द्र अन्द्रपो बनेको थियो । त्यसको अवशेषका रूपमा रहेका उपत्यकाका ऐतिहासिक सम्पदाहरू तपाईं-हाम्रा आँखासामु नै छन् । हाम्रा यी दुई । छिमेकी फेरि विश्वशक्ति बन्दै गर्दा के नेपाल अन्द्रपोको भूमिकामा फर्कन सक्छ ? दुई ढुङ्गाबीचको तरुल होइन, साँघु बन्न सक्छ?',
    ),
    Description(
      title: ' पुस्तकको बारेमा ',
      subtitle:
          '२०० वर्षअघिसम्म चीन र भारत विश्वका पहिलो र दोस्रो ठूला अर्थतन्त्र थिए । उनीहरू त्यसरी सम्पन्न हुँदा नै काठमाडौं उपत्यका केही हदसम्म समृद्ध हुन पुगेको थियो । उत्तर-दक्षिण अन्तरदेशीय व्यापारको केन्द्र अन्द्रपो बनेको थियो । त्यसको अवशेषका रूपमा रहेका उपत्यकाका ऐतिहासिक सम्पदाहरू तपाईं-हाम्रा आँखासामु नै छन् । हाम्रा यी दुई । छिमेकी फेरि विश्वशक्ति बन्दै गर्दा के नेपाल अन्द्रपोको भूमिकामा फर्कन सक्छ ? दुई ढुङ्गाबीचको तरुल होइन, साँघु बन्न सक्छ?',
    ),
  ];

  final Map<String, String> publishers = {
    'Publisher': 'Publisher',
    'Published Date': 'Published Date',
    'ISBN': 'ISBN',
    'Language': 'Language',
    'Pages': 'Pages',
    'Category': 'Category',
    'Binding': 'Binding',
    'Weight': 'Weight',
    'Dimension': 'Dimension',
  };
}

class Item {
  final String imageUrl;
  final String title;
  final String author;
  final String description;

  Item(
      {required this.imageUrl,
      required this.title,
      required this.author,
      required this.description});
}

class Description {
  final String title;
  final String subtitle;
  final Icon? leading;
  final Icon? trailing;
  const Description({
    required this.title,
    required this.subtitle,
    this.leading,
    this.trailing,
  });
}
