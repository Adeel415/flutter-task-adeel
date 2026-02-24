import 'package:flutter/material.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked/stacked.dart';
import '../ui/views/home/home_view.dart';
import '../ui/views/bundles/bundles_view.dart';

// Import your services
import '../services/data_service.dart';

// Import your bottom sheets
import '../ui/bottom_sheets/notice/notice_sheet.dart';

// Import your dialogs
import '../ui/dialogs/info_alert/info_alert_dialog.dart';
import 'app.router.dart';

@StackedApp(
  routes: [
    // Material Routes - MainView as initial
    MaterialRoute(page: HomeView, initial: true),
    MaterialRoute(page: BundlesView),

    // Bottom Sheets
    CustomRoute(page: NoticeSheet),

    // Dialogs
    CustomRoute(page: InfoAlertDialog),
  ],
  dependencies: [
    // Stacked Services
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: BottomSheetService),

    // Your Custom Services
    LazySingleton(classType: DataService),
  ],
  logger: StackedLogger(),
)
class App {}

// Your MaterialApp widget stays here
class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bundles Turkey',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: false,
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Color(0xFF202124),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          iconTheme: IconThemeData(color: Color(0xFF202124)),
        ),
      ),
      debugShowCheckedModeBanner: false,
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      initialRoute: Routes.homeView,
    );
  }
}