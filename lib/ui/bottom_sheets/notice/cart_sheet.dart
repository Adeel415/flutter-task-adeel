import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../common/app_colors.dart';
import '../../common/app_strings.dart';
import '../../../models/cart_item.dart';
import '../../../models/bundle.dart';
import '../../views/main/main_viewmodel.dart';

class CartSheet extends StatelessWidget {
  const CartSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MainViewModel>(
      builder: (context, viewModel, _) {
        return Container(
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Handle bar
              Container(
                margin: const EdgeInsets.only(top: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.borderColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 8),
              // Cart items list
              ...viewModel.cartItems
                  .map((item) => _buildCartItem(context, item, viewModel)),
              // Checkout button
              Padding(
                padding: EdgeInsets.fromLTRB(
                    16, 8, 16, MediaQuery.of(context).padding.bottom + 16),
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.checkoutButton,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'USD ${viewModel.totalCartPrice.toStringAsFixed(2)} - ${AppStrings.checkout}',
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCartItem(
      BuildContext context, CartItem item, MainViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'USD ${item.totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  '${item.bundle.dataLabel} / ${item.bundle.validDays} Days',
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.subtitleGray,
                  ),
                ),
              ],
            ),
          ),
          _buildControlButton(
            icon: Icons.remove,
            onTap: () => viewModel.removeFromCart(item.bundle),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'x${item.quantity}',
              style: const TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
          _buildControlButton(
            icon: Icons.add,
            onTap: () => viewModel.addToCart(item.bundle),
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: () => viewModel.deleteFromCart(item.bundle),
            child: const Icon(Icons.close,
                color: AppColors.removeRed, size: 20),
          ),
        ],
      ),
    );
  }

  Widget _buildControlButton(
      {required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.borderColor),
        ),
        child: Icon(icon, size: 14, color: AppColors.textPrimary),
      ),
    );
  }
}