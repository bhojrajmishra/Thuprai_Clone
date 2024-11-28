import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thuprai_clone/app/app.bottomsheets.dart';
import 'package:thuprai_clone/app/app.dialogs.dart';
import 'package:thuprai_clone/app/app.locator.dart';
import 'package:thuprai_clone/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thuprai_clone/base/service/deep_link_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp(
    env: '',
  ));
  Future.delayed(const Duration(seconds: 2), () {
    final deepLinkService = locator<DeepLinkService>();
    deepLinkService.initializeDeepLinks();
    debugPrint('Deep link initialization completed');
  });
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required String env});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.startupView,
          onGenerateRoute: StackedRouter().onGenerateRoute,
          navigatorKey: StackedService.navigatorKey,
          navigatorObservers: [
            StackedService.routeObserver,
          ],
          theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        );
      },
    );
  }
}
