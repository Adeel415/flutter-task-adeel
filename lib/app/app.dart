import 'package:flutter/material.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter_task_adeel/app/app.router.dart'; // Import the generated router

// Import your views - use full package imports
import 'package:flutter_task_adeel/ui/views/main/main_view.dart';
import 'package:flutter_task_adeel/ui/views/bundles/bundles_view.dart';
import 'package:flutter_task_adeel/ui/views/startup/startup_view.dart';

// Import your services
import 'package:flutter_task_adeel/services/data_service.dart';

// Import bottom sheets and dialogs
import 'package:flutter_task_adeel/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:flutter_task_adeel/ui/dialogs/info_alert/info_alert_dialog.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView),
    MaterialRoute(page: MainView, initial: true),
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
      initialRoute: Routes.mainView, // Now this should work
    );
  }
}