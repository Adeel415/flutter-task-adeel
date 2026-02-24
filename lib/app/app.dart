import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import '../ui/views/startup/startup_view.dart';
import '../ui/views/main/main_view.dart';
import '../services/data_service.dart';
import '../ui/bottom_sheets/notice/cart_sheet.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView, initial: true),
    MaterialRoute(page: MainView),
  ],
  dependencies: [
    LazySingleton(classType: DataService),
    LazySingleton(classType: NavigationService, asType: NavigationService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
  ],
  bottomsheets: [
    StackedBottomsheet(classType: CartSheet),
  ],
)
class App {}