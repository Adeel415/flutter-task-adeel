import 'package:get_it/get_it.dart';
import 'package:stacked_services/stacked_services.dart';

final locator = GetIt.instance;

Future setupLocator() async {

  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => BottomSheetService());

  // Register your ViewModels here as you create them
  // locator.registerFactory(() => HomeViewModel());
  // locator.registerFactory(() => BundlesViewModel());
}