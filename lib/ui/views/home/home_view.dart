import 'package:flutter/material.dart';
import 'package:flutter_task_adeel/ui/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';
import '../../common/app_colors.dart';
import '../../common/app_strings.dart';
import '../../common/ui_helpers.dart';
import '../../widgets/bundle_card.dart';
import '../../widgets/category_chip.dart';
import '../../widgets/plan_card.dart';

class HomeView extends StackedView<HomeViewmodel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context,
      HomeViewmodel viewModel,
      Widget? child,
      ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.appTitle,
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.more_vert, color: AppColors.textPrimary),
          ),
        ],
      ),
      body: viewModel.isBusy
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: const EdgeInsets.all(horizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Time
            Text(
              '9:41',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: spaceLarge),

            // Location
            Text(
              AppStrings.turkey,
              style: TextStyle(color: AppColors.textSecondary),
            ),
            const SizedBox(height: spaceMedium),

            // Question
            Text(
              AppStrings.whereInternet,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: spaceMedium),

            // Category chips
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CategoryChip(
                    label: AppStrings.all,
                    isSelected: viewModel.selectedCategory == 'All',
                    onTap: () => viewModel.selectCategory('All'),
                  ),
                  const SizedBox(width: spaceSmall),
                  CategoryChip(
                    label: AppStrings.standard,
                    isSelected: viewModel.selectedCategory == 'Standard',
                    onTap: () => viewModel.selectCategory('Standard'),
                  ),
                  const SizedBox(width: spaceSmall),
                  CategoryChip(
                    label: AppStrings.unlimited,
                    isSelected: viewModel.selectedCategory == 'Unlimited',
                    onTap: () => viewModel.selectCategory('Unlimited'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: spaceLarge),

            // Bundles count
            Text(
              AppStrings.bundlesAvailable,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: spaceMedium),

            // Bundles list
            ...viewModel.filteredBundles.map(
                  (bundle) => Padding(
                padding: const EdgeInsets.only(bottom: spaceSmall),
                child: BundleCard(bundle: bundle),
              ),
            ),

            const SizedBox(height: spaceLarge),

            // Regional plans header
            Text(
              AppStrings.regionalPlans,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: spaceMedium),

            // Regional plans
            ...viewModel.regionalPlans.map(
                  (plan) => Padding(
                padding: const EdgeInsets.only(bottom: spaceSmall),
                child: PlanCard(plan: plan),
              ),
            ),

            const SizedBox(height: spaceLarge),

            // Support section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(spaceMedium),
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Text(
                    AppStrings.needSupport,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                   SizedBox(height: spaceSmall),
                   Text(
                    AppStrings.contactWhatsApp,
                    style: TextStyle(color: AppColors.textSecondary),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  HomeViewmodel viewModelBuilder(BuildContext context) => HomeViewmodel();

  @override
  void onViewModelReady(HomeViewmodel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }
}