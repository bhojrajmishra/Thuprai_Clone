// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:dio/dio.dart';
import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_shared/stacked_shared.dart';
import 'package:thuprai_clone/network/retro_client.dart';
import 'package:thuprai_clone/network/secure_storage.dart';
import 'package:thuprai_clone/ui/views/cart/repository/cart_repository_implementation.dart';
import 'package:thuprai_clone/ui/views/detail/repository/book_repository_implementation.dart';
import 'package:thuprai_clone/ui/views/home/repository/home_repository_implementation.dart';
import 'package:thuprai_clone/ui/views/registration/registration_viewmodel.dart';

import '../ui/views/login/repository/login_repository_implementation.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => LoginRepositoryImpl());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => RetroClient(Dio()));
  locator.registerLazySingleton(() => HomeRepositoryImplementation());
  locator.registerLazySingleton(() => SecureStorageService());
  locator.registerLazySingleton(() => CartRepositoryImplementation());
  locator.registerLazySingleton(() => BookRepositoryImplementation());
  locator.registerLazySingleton(() => RegistrationViewModel());
}
