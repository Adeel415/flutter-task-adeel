import 'package:flutter/material.dart';
import 'app_colors.dart';

class UIHelpers {
  UIHelpers._();

  // Vertical spacing
  static const SizedBox verticalSpaceTiny = SizedBox(height: 4);
  static const SizedBox verticalSpaceSmall = SizedBox(height: 8);
  static const SizedBox verticalSpaceMedium = SizedBox(height: 16);
  static const SizedBox verticalSpaceLarge = SizedBox(height: 24);
  static const SizedBox verticalSpaceXLarge = SizedBox(height: 32);

  // Horizontal spacing
  static const SizedBox horizontalSpaceTiny = SizedBox(width: 4);
  static const SizedBox horizontalSpaceSmall = SizedBox(width: 8);
  static const SizedBox horizontalSpaceMedium = SizedBox(width: 16);
  static const SizedBox horizontalSpaceLarge = SizedBox(width: 24);

  // Text styles
  static const TextStyle headingStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const TextStyle subheadingStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodyStyle = TextStyle(
    fontSize: 12,
    color: AppColors.textSecondary,
  );

  static const TextStyle priceStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.priceBlue,
  );

  static const TextStyle chipTextStyle = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
  );
}