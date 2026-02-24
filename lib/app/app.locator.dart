import 'package:get_it/get_it.dart';
import '../services/data_service.dart';
import '../services/navigation_service.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => DataService());
  locator.registerLazySingleton(() => NavigationService());
}