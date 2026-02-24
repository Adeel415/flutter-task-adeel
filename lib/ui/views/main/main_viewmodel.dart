import 'package:stacked/stacked.dart';
import 'package:flutter_task_adeel/services/data_service.dart';
import 'package:flutter_task_adeel/models/bundle.dart';
import 'package:flutter_task_adeel/models/plan.dart';
import 'package:flutter_task_adeel/app/app.locator.dart';

class MainViewModel extends BaseViewModel {
  final DataService _dataService = locator<DataService>();

  String _selectedCategory = 'All';
  List<Bundle> _bundles = [];
  List<Plan> _regionalPlans = [];

  String get selectedCategory => _selectedCategory;
  List<Bundle> get bundles => _bundles;
  List<Plan> get regionalPlans => _regionalPlans;

  void init() {
    loadData();
  }

  void loadData() {
    setBusy(true);

    // Simulate loading
    Future.delayed(const Duration(milliseconds: 500), () {
      _bundles = _dataService.getBundles();
      _regionalPlans = _dataService.getRegionalPlans();
      setBusy(false);
      notifyListeners();
    });
  }

  void selectCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  List<Bundle> get filteredBundles {
    if (_selectedCategory == 'All') return _bundles;
    if (_selectedCategory == 'Standard') {
      return _bundles.where((b) => b.type == 'standard').toList();
    }
    if (_selectedCategory == 'Unlimited') {
      return _bundles.where((b) => b.type == 'unlimited').toList();
    }
    return _bundles;
  }
}