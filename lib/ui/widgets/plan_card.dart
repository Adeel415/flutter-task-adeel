import 'package:flutter/material.dart';

import '../../models/plan.dart';
import '../common/app_colors.dart';
import '../common/app_strings.dart';

class PlanCard extends StatelessWidget {
  final Plan plan;

  const PlanCard({Key? key, required this.plan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            plan.name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Data: ${plan.data}',
                    style: const TextStyle(color: AppColors.textSecondary),
                  ),
                  Text(
                    '${AppStrings.validFor} ${plan.validity}',
                    style: const TextStyle(color: AppColors.textSecondary),
                  ),
                ],
              ),
              Text(
                '${AppStrings.usd} ${plan.price.toStringAsFixed(2)}',
                style:const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}