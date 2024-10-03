import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:thuprai_clone/app/app.locator.dart';
import 'package:thuprai_clone/app/app.router.dart';
import 'package:thuprai_clone/ui/views/home/home_viewmodel.dart';
import 'package:thuprai_clone/ui/views/home/model/home_response_model.dart';
import 'package:thuprai_clone/ui/views/home/repository/home_repository_implementation.dart';
import '../helpers/test_helpers.dart';
import '../helpers/test_helpers.mocks.dart';

void main() {
  late HomeViewModel homeViewModel;
  late MockHomeRepositoryImplementation mockHomeRepository;
  late MockNavigationService mockNavigationService;

  setUp(() {
    registerServices();
    mockHomeRepository = getAndRegisterHomeRepositoryImplementation();
    mockNavigationService = getAndRegisterNavigationService();
    homeViewModel = HomeViewModel();
  });

  tearDown(() => locator.reset());

  group('HomeViewModel Tests -', () {
    test('Initial state is correct', () {
      expect(homeViewModel.fetchData, isNull);
      expect(homeViewModel.featuredImageUrls, isEmpty);
      expect(homeViewModel.featuredTitles, isEmpty);
      expect(homeViewModel.ebookCoverUrls, isEmpty);
      expect(homeViewModel.ebookTitles, isEmpty);
      expect(homeViewModel.audiobookCoverUrls, isEmpty);
      expect(homeViewModel.audiobookTitles, isEmpty);
      expect(homeViewModel.newReleaseCoverUrls, isEmpty);
      expect(homeViewModel.newReleaseTitles, isEmpty);
      expect(homeViewModel.bestSellerCoverUrls, isEmpty);
      expect(homeViewModel.bestSellerTitles, isEmpty);
    });

    test('getBooks fetches data and updates lists', () async {
      final mockResponse = HomeResponseModel(
        featured: [
          Featured(
              image: 'image1.jpg', title: 'Featured Book 1', slug: 'featured-1')
        ],
        audiobooks: [
          Audiobook(
              frontCover: 'audio1.jpg', title: 'Audiobook 1', slug: 'audio-1')
        ],
      );

      when(mockHomeRepository.getBooks()).thenAnswer((_) async => mockResponse);

      await homeViewModel.getBooks();

      expect(homeViewModel.fetchData, mockResponse);
      expect(homeViewModel.featuredImageUrls, ['image1.jpg']);
      expect(homeViewModel.featuredTitles, ['Featured Book 1']);
      expect(homeViewModel.ebookCoverUrls, ['ebook1.jpg']);
      expect(homeViewModel.ebookTitles, ['Ebook 1']);
      expect(homeViewModel.audiobookCoverUrls, ['audio1.jpg']);
      expect(homeViewModel.audiobookTitles, ['Audiobook 1']);
      expect(homeViewModel.newReleaseCoverUrls, ['new1.jpg']);
      expect(homeViewModel.newReleaseTitles, ['New Release 1']);
      expect(homeViewModel.bestSellerCoverUrls, ['best1.jpg']);
      expect(homeViewModel.bestSellerTitles, ['Bestseller 1']);
    });

    test('getBooks handles error', () async {
      when(mockHomeRepository.getBooks()).thenThrow(Exception('Network error'));

      await homeViewModel.getBooks();

      expect(homeViewModel.hasError, isTrue);
      expect(homeViewModel.fetchData, isNull);
    });

    test('onItemSelected navigates to book details', () {
      const slug = 'test-slug';
      homeViewModel.onItemSelected(slug);

      verify(mockNavigationService.navigateTo(
        Routes.detailView,
        arguments: DetailViewArguments(slug: slug),
      )).called(1);
    });

    test('onCarouselItemTapped navigates to book details for valid index', () {
      final mockResponse = HomeResponseModel(
        featured: [
          Featured(
              image: 'image1.jpg', title: 'Featured Book 1', slug: 'featured-1')
        ],
      );
      homeViewModel.fetchData = mockResponse;

      homeViewModel.onCarouselItemTapped(0);

      verify(mockNavigationService.navigateTo(
        Routes.detailView,
        arguments: DetailViewArguments(slug: 'featured-1'),
      )).called(1);
    });

    test('onCarouselItemTapped does nothing for invalid index', () {
      final mockResponse = HomeResponseModel(
        featured: [
          Featured(
              image: 'image1.jpg', title: 'Featured Book 1', slug: 'featured-1')
        ],
      );
      homeViewModel.fetchData = mockResponse;

      homeViewModel.onCarouselItemTapped(1);

      verifyNever(mockNavigationService.navigateTo(any));
    });
  });
}
