import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import '../ui/views/home/home_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView, initial: true),
    // Add other routes here
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: BottomSheetService),
  ],
)
class App {}