import 'package:flutter/material.dart';
import '../../models/bundle.dart';
import '../common/app_colors.dart';
import '../common/app_strings.dart';

class BundleCard extends StatelessWidget {
  final Bundle bundle;

  const BundleCard({Key? key, required this.bundle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                bundle.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${AppStrings.validFor} ${bundle.validity}',
                style: const TextStyle(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${AppStrings.usd} ${bundle.price.toStringAsFixed(2)}',
                style:const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.cardBackground,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}