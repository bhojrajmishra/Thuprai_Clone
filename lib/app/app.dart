import 'package:thuprai_clone/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:thuprai_clone/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:thuprai_clone/ui/views/home/home_view.dart';
import 'package:thuprai_clone/ui/views/login/repository/login_repository_implementation.dart';
import 'package:thuprai_clone/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thuprai_clone/ui/views/login/login_view.dart';
import 'package:thuprai_clone/ui/views/detail/detail_view.dart';
import 'package:thuprai_clone/ui/views/cart/cart_view.dart';
import 'package:thuprai_clone/ui/views/registration/registration_view.dart';
import 'package:thuprai_clone/ui/views/bottomnavigationbar/bottomnavigationbar_view.dart';
import 'package:thuprai_clone/ui/views/cart/cart_view.dart';
import 'package:thuprai_clone/ui/views/viewall/viewall_view.dart';
import 'package:thuprai_clone/ui/views/profile/profile_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: DetailView),
    MaterialRoute(page: CartView),
    MaterialRoute(page: RegistrationView),
    MaterialRoute(page: BottomnavigationbarView),
    MaterialRoute(page: CartView),
    MaterialRoute(page: ViewallView),
    MaterialRoute(page: ProfileView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: LoginRepositoryImpl),

    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
