import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:thuprai_clone/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thuprai_clone/network/secure_storage.dart';
import 'package:thuprai_clone/ui/views/home/home_viewmodel.dart';
import 'package:thuprai_clone/ui/views/home/repository/home_repository_implementation.dart';
import 'package:thuprai_clone/ui/views/startup/startup_viewmodel.dart';
// @stacked-import

import 'test_helpers.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<NavigationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<BottomSheetService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DialogService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<SnackbarService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<HomeRepositoryImplementation>(
      onMissingStub: OnMissingStub.returnDefault),
  MockSpec<SecureStorageService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<HomeViewModel>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<StartupViewModel>(onMissingStub: OnMissingStub.returnDefault),

  // @stacked-mock-spec
])
void registerServices() {
  getAndRegisterNavigationService();
  getAndRegisterBottomSheetService();
  getAndRegisterDialogService();
  getAndRegisterSnackbarService();
  getAndRegisterHomeRepositoryImplementation();
  getAndRegisterSecureStorageService();
  getAndRegisterHomeViewModel();
  getAndRegisterStartupViewModel();

  // @stacked-mock-register
}

MockStartupViewModel getAndRegisterStartupViewModel() {
  _removeRegistrationIfExists<StartupViewModel>();
  final service = MockStartupViewModel();
  locator.registerSingleton<StartupViewModel>(service);
  return service;
}

MockHomeViewModel getAndRegisterHomeViewModel() {
  _removeRegistrationIfExists<HomeViewModel>();
  final service = MockHomeViewModel();
  locator.registerSingleton<HomeViewModel>(service);
  return service;
}

MockSecureStorageService getAndRegisterSecureStorageService() {
  _removeRegistrationIfExists<SecureStorageService>();
  final service = MockSecureStorageService();
  locator.registerSingleton<SecureStorageService>(service);
  return service;
}

MockSnackbarService getAndRegisterSnackbarService() {
  _removeRegistrationIfExists<SnackbarService>();
  final service = MockSnackbarService();
  locator.registerSingleton<SnackbarService>(service);
  return service;
}

MockHomeRepositoryImplementation getAndRegisterHomeRepositoryImplementation() {
  _removeRegistrationIfExists<HomeRepositoryImplementation>();
  final service = MockHomeRepositoryImplementation();
  locator.registerSingleton<HomeRepositoryImplementation>(service);
  return service;
}

MockNavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

MockBottomSheetService getAndRegisterBottomSheetService<T>({
  SheetResponse<T>? showCustomSheetResponse,
}) {
  _removeRegistrationIfExists<BottomSheetService>();
  final service = MockBottomSheetService();

  when(service.showCustomSheet<T, T>(
    enableDrag: anyNamed('enableDrag'),
    enterBottomSheetDuration: anyNamed('enterBottomSheetDuration'),
    exitBottomSheetDuration: anyNamed('exitBottomSheetDuration'),
    ignoreSafeArea: anyNamed('ignoreSafeArea'),
    isScrollControlled: anyNamed('isScrollControlled'),
    barrierDismissible: anyNamed('barrierDismissible'),
    additionalButtonTitle: anyNamed('additionalButtonTitle'),
    variant: anyNamed('variant'),
    title: anyNamed('title'),
    hasImage: anyNamed('hasImage'),
    imageUrl: anyNamed('imageUrl'),
    showIconInMainButton: anyNamed('showIconInMainButton'),
    mainButtonTitle: anyNamed('mainButtonTitle'),
    showIconInSecondaryButton: anyNamed('showIconInSecondaryButton'),
    secondaryButtonTitle: anyNamed('secondaryButtonTitle'),
    showIconInAdditionalButton: anyNamed('showIconInAdditionalButton'),
    takesInput: anyNamed('takesInput'),
    barrierColor: anyNamed('barrierColor'),
    barrierLabel: anyNamed('barrierLabel'),
    customData: anyNamed('customData'),
    data: anyNamed('data'),
    description: anyNamed('description'),
  )).thenAnswer((realInvocation) =>
      Future.value(showCustomSheetResponse ?? SheetResponse<T>()));

  locator.registerSingleton<BottomSheetService>(service);
  return service;
}

MockDialogService getAndRegisterDialogService() {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();
  locator.registerSingleton<DialogService>(service);
  return service;
}

// @stacked-mock-create

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
