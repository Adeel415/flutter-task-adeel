import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../bottom_sheets/notice/cart_sheet.dart';
import 'main_viewmodel.dart';
import '../../common/app_colors.dart';
import '../../common/app_strings.dart';
import '../../widgets/bundle_card.dart';
import '../../widgets/category_chip.dart';
import '../../widgets/plan_card.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MainViewModel>(
      builder: (context, viewModel, _) {
        return Scaffold(
          backgroundColor: AppColors.background,
          body: Stack(
            children: [
              Column(
                children: [
                  _buildAppBar(context, viewModel),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(bottom: 100),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSearchBar(),
                          _buildSelectedCountry(),
                          _buildCategoryChips(viewModel),
                          _buildBundleCount(viewModel),
                          _buildBundleGrid(viewModel),
                          _buildRegionalPlansSection(viewModel),
                          _buildSupportSection(),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              if (viewModel.hasCartItems)
                _buildCheckoutBar(context, viewModel),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAppBar(BuildContext context, MainViewModel viewModel) {
    return Container(
        decoration: BoxDecoration(
          gradient:const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              AppColors.primary,
              AppColors.primary2,
              AppColors.primary
            ],
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              const Icon(Icons.chevron_left, color: AppColors.primary, size: 28),
              const Expanded(
                child: Text(
                  AppStrings.turkey,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              GestureDetector(
                onTap: viewModel.hasCartItems
                    ? () => _showCart(context, viewModel)
                    : null,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const Icon(Icons.shopping_bag_outlined,
                        color: AppColors.white, size: 28),
                    if (viewModel.totalCartQuantity > 0)
                      Positioned(
                        right: -4,
                        top: -4,
                        child: Container(
                          padding: const EdgeInsets.all(3),
                          decoration: const BoxDecoration(
                            color: AppColors.removeRed,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            '${viewModel.totalCartQuantity}',
                            style: const TextStyle(
                              color: AppColors.white,
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Row(
          children: [
            Icon(Icons.search, color: AppColors.subtitleGray, size: 18),
            SizedBox(width: 8),
            Text(
              AppStrings.whereDoYouNeedInternet,
              style: TextStyle(color: AppColors.subtitleGray, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedCountry() {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      child: Row(
        children: [
          Container(
            padding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('🇹🇷', style: TextStyle(fontSize: 16)),
                SizedBox(width: 6),
                Text(
                  AppStrings.turkey,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(width: 4),
                Icon(Icons.close,
                    size: 14, color: AppColors.subtitleGray),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChips(MainViewModel viewModel) {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      child: Row(
        children: [
          CategoryChip(
            label: AppStrings.all,
            isSelected: viewModel.selectedCategory == BundleCategory.all,
            onTap: () => viewModel.selectCategory(BundleCategory.all),
          ),
          const SizedBox(width: 8),
          CategoryChip(
            label: AppStrings.standard,
            isSelected:
            viewModel.selectedCategory == BundleCategory.standard,
            onTap: () => viewModel.selectCategory(BundleCategory.standard),
          ),
          const SizedBox(width: 8),
          CategoryChip(
            label: AppStrings.unlimited,
            isSelected:
            viewModel.selectedCategory == BundleCategory.unlimited,
            onTap: () =>
                viewModel.selectCategory(BundleCategory.unlimited),
          ),
        ],
      ),
    );
  }

  Widget _buildBundleCount(MainViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        '${viewModel.filteredBundles.length} ${AppStrings.bundlesAvailableFor}',
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }

  Widget _buildBundleGrid(MainViewModel viewModel) {
    final bundles = viewModel.filteredBundles;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 0.85,
        ),
        itemCount: bundles.length,
        itemBuilder: (context, index) {
          final bundle = bundles[index];
          final qty = viewModel.getQuantityInCart(bundle);
          return BundleCard(
            bundle: bundle,
            quantityInCart: qty,
            onAdd: () => viewModel.addToCart(bundle),
            onRemove: () => viewModel.removeFromCart(bundle),
          );
        },
      ),
    );
  }

  Widget _buildRegionalPlansSection(MainViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            AppStrings.regionalGlobalPlans,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.5,
            ),
            itemCount: viewModel.plans.length,
            itemBuilder: (context, index) {
              return PlanCard(plan: viewModel.plans[index]);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSupportSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            AppStrings.needSupport,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              const Text(
                'If you need help, contact us on ',
                style:
                TextStyle(fontSize: 12, color: AppColors.subtitleGray),
              ),
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: const Color(0xFF25D366),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.chat_bubble, color: Colors.white, size: 12),
                    SizedBox(width: 4),
                    Text(
                      'WhatsApp',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCheckoutBar(BuildContext context, MainViewModel viewModel) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: GestureDetector(
            onTap: () => _showCart(context, viewModel),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
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
      ),
    );
  }

  void _showCart(BuildContext context, MainViewModel viewModel) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => ChangeNotifierProvider.value(
        value: viewModel,
        child: const CartSheet(),
      ),
    );
  }
}