import 'package:flutter/material.dart';
import '../../../models/bundle.dart';
import '../common/app_colors.dart';

class BundleCard extends StatelessWidget {
  final Bundle bundle;
  final int quantityInCart;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const BundleCard({
    super.key,
    required this.bundle,
    required this.quantityInCart,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = quantityInCart > 0;

    return GestureDetector(
      onTap: onAdd,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.borderColor,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              bundle.dataLabel,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              'Valid for:\n${bundle.validDays} days',
              style: const TextStyle(
                fontSize: 10,
                color: AppColors.subtitleGray,
                height: 1.4,
              ),
            ),
            const Spacer(),
            Divider(),
            if (isSelected) ...[
              _buildQuantityControls(),
            ] else ...[
              Text(
                bundle.priceLabel,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.priceBlue,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildQuantityControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: onRemove,
          child: Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Icon(Icons.remove, size: 14, color: AppColors.textPrimary),
          ),
        ),
        Text(
          'x$quantityInCart',
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        GestureDetector(
          onTap: onAdd,
          child: Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Icon(Icons.add, size: 14, color: AppColors.white),
          ),
        ),
      ],
    );
  }
}