import 'package:stacked/stacked.dart';
import '../../../app/app.locator.dart';
import '../../../services/navigation_service.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  Future<void> runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 2));
    await _navigationService.replaceWithMainView();
  }
}