import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:thuprai_clone/app/app.locator.dart';
import 'package:thuprai_clone/ui/views/home/home_viewmodel.dart';
import 'package:thuprai_clone/ui/views/home/repository/home_repository_implementation.dart';
import 'package:thuprai_clone/ui/views/home/model/home_response_model.dart';
import 'package:stacked_services/stacked_services.dart';

// This will generate a mock file for us
import '../helpers/test_helpers.mocks.dart';

@GenerateMocks([HomeRepositoryImplementation, NavigationService])
void main() {
  late HomeViewModel viewModel;
  late MockHomeRepositoryImplementation mockHomeRepository;
  late MockNavigationService mockNavigationService;

  // Setup the locator only if needed and reset at the start of each test
  setUp(() async {
    await locator
        .reset(); // Reset the locator to prevent duplicate registrations

    // Create mock instances
    mockHomeRepository = MockHomeRepositoryImplementation();
    mockNavigationService = MockNavigationService();

    // Register mocks using lazy singletons to avoid registration conflicts
    locator.registerLazySingleton<HomeRepositoryImplementation>(
      () => mockHomeRepository,
    );
    locator.registerLazySingleton<NavigationService>(
      () => mockNavigationService,
    );

    // Initialize the ViewModel
    viewModel = HomeViewModel();
  });

  tearDown(() async {
    await locator.reset(); // Clean up after each test to ensure fresh state
  });

  group('HomeViewModel Tests', () {
    test('fetchBooks should update homeData and notify listeners', () async {
      // Arrange
      final mockHomeData = HomeResponseModel(
        featured: [Featured(title: 'Test Book', slug: 'test-slug')],
        newReleases: [],
        ebooks: [],
        audiobooks: [],
        bestsellingEbooks: [],
      );
      when(mockHomeRepository.getBooks()).thenAnswer((_) async => mockHomeData);

      // Act
      await viewModel.fetchBooks();

      // Assert
      expect(viewModel.homeData, mockHomeData);
      expect(viewModel.isBusy, false);
    });

    test('refreshBooks should call fetchBooks', () async {
      // Arrange
      when(mockHomeRepository.getBooks())
          .thenAnswer((_) async => HomeResponseModel());

      // Act
      await viewModel.refreshBooks();

      // Assert
      verify(mockHomeRepository.getBooks()).called(1);
    });

    test('onItemSelected should navigate to DetailView', () {
      // Arrange
      const testSlug = 'test-slug';

      // Act
      viewModel.onItemSelected(testSlug);

      // Assert
      verify(mockNavigationService.navigateTo(any,
              arguments: anyNamed('arguments')))
          .called(1);
    });

    test('onViewAllTapped should navigate to ViewAllView', () {
      // Arrange
      const testTitle = 'Test Title';

      // Act
      viewModel.onViewAllTapped(testTitle);

      // Assert
      verify(mockNavigationService.navigateTo(any,
              arguments: anyNamed('arguments')))
          .called(1);
    });
  });
}
