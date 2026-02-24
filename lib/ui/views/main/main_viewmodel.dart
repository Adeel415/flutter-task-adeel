import 'package:flutter/foundation.dart';
import '../../../app/app.locator.dart';
import '../../../models/bundle.dart';
import '../../../models/plan.dart';
import '../../../models/cart_item.dart';
import '../../../services/data_service.dart';

enum BundleCategory { all, standard, unlimited }

class MainViewModel extends ChangeNotifier {
  final _dataService = locator<DataService>();

  List<Bundle> _allBundles = [];
  List<Plan> _plans = [];
  final List<CartItem> _cartItems = [];

  BundleCategory _selectedCategory = BundleCategory.all;
  BundleCategory get selectedCategory => _selectedCategory;

  List<Bundle> get filteredBundles {
    switch (_selectedCategory) {
      case BundleCategory.standard:
        return _allBundles.where((b) => !b.isUnlimited).toList();
      case BundleCategory.unlimited:
        return _allBundles.where((b) => b.isUnlimited).toList();
      case BundleCategory.all:
        return _allBundles;
    }
  }

  List<Plan> get plans => _plans;
  List<CartItem> get cartItems => List.unmodifiable(_cartItems);

  int get totalCartQuantity =>
      _cartItems.fold(0, (sum, item) => sum + item.quantity);

  double get totalCartPrice =>
      _cartItems.fold(0.0, (sum, item) => sum + item.totalPrice);

  bool get hasCartItems => _cartItems.isNotEmpty;

  void initialize() {
    _allBundles = _dataService.getBundlesForTurkey();
    _plans = _dataService.getRegionalPlansForTurkey();
    notifyListeners();
  }

  void selectCategory(BundleCategory category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void addToCart(Bundle bundle) {
    final index = _cartItems.indexWhere((i) => i.bundle.id == bundle.id);
    if (index != -1) {
      _cartItems[index].quantity++;
    } else {
      _cartItems.add(CartItem(bundle: bundle));
    }
    notifyListeners();
  }

  void removeFromCart(Bundle bundle) {
    final index = _cartItems.indexWhere((i) => i.bundle.id == bundle.id);
    if (index != -1) {
      if (_cartItems[index].quantity > 1) {
        _cartItems[index].quantity--;
      } else {
        _cartItems.removeAt(index);
      }
      notifyListeners();
    }
  }

  void deleteFromCart(Bundle bundle) {
    _cartItems.removeWhere((i) => i.bundle.id == bundle.id);
    notifyListeners();
  }

  int getQuantityInCart(Bundle bundle) {
    final matches = _cartItems.where((i) => i.bundle.id == bundle.id);
    return matches.isEmpty ? 0 : matches.first.quantity;
  }

  bool isInCart(Bundle bundle) =>
      _cartItems.any((i) => i.bundle.id == bundle.id);
}