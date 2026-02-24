import 'bundle.dart';

class CartItem {
  final Bundle bundle;
  int quantity;

  CartItem({required this.bundle, this.quantity = 1});

  double get totalPrice => bundle.priceUSD * quantity;
}