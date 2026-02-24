import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_task_adeel/ui/common/app_colors.dart';
import 'package:flutter_task_adeel/ui/common/app_strings.dart';
import 'package:flutter_task_adeel/ui/views/main/main_viewmodel.dart';

class MainView extends StackedView<MainViewModel> {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context,
      MainViewModel viewModel,
      Widget? child,
      ) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.only(left: 16),
          child: Icon(Icons.arrow_back, color: Color(0xFF202124), size: 24),
        ),
        title: const Text(
          'Bundles Turkey',
          style: TextStyle(
            color: Color(0xFF202124),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.more_vert, color: Color(0xFF202124), size: 24),
          ),
        ],
      ),
      body: viewModel.isBusy
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Time and Location Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '9:41',
                  style: TextStyle(
                    color: Color(0xFF202124),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Text(
                  'Turkey',
                  style: TextStyle(
                    color: Color(0xFF5F6368),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // "Where do you need internet?" Text
            const Text(
              'Where do you need internet?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xFF202124),
              ),
            ),
            const SizedBox(height: 16),

            // Category Chips Row
            Row(
              children: [
                _buildCategoryChip('All', viewModel.selectedCategory == 'All', () => viewModel.selectCategory('All')),
                const SizedBox(width: 8),
                _buildCategoryChip('Standard', viewModel.selectedCategory == 'Standard', () => viewModel.selectCategory('Standard')),
                const SizedBox(width: 8),
                _buildCategoryChip('Unlimited', viewModel.selectedCategory == 'Unlimited', () => viewModel.selectCategory('Unlimited')),
              ],
            ),
            const SizedBox(height: 24),

            // "8 Bundles Available for Turkey" Text
            const Text(
              '8 Bundles Available for Turkey',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF202124),
              ),
            ),
            const SizedBox(height: 16),

            // Bundle Cards
            _buildBundleCard('3 GB', '30 days', 2.99),
            const SizedBox(height: 12),
            _buildBundleCard('5 GB', '30 days', 3.50),
            const SizedBox(height: 12),
            _buildBundleCard('10 GB', '30 days', 4.25),
            const SizedBox(height: 12),
            _buildBundleCard('20 GB', '30 days', 7.48, isUnlimited: true),

            const SizedBox(height: 24),

            // Regional Plans Header
            const Text(
              'Regional & Global Plans Supporting Turkey',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF202124),
              ),
            ),
            const SizedBox(height: 16),

            // EuroConnect Plan
            _buildRegionalPlanCard(
              'EuroConnect',
              '1 GB',
              '7 days',
              '34 Supported Countries',
              2.51,
            ),
            const SizedBox(height: 12),

            // EuroLink Plan
            _buildRegionalPlanCard(
              'EuroLink',
              '1 GB',
              '7 days',
              '57 Supported Countries',
              2.52,
            ),

            const SizedBox(height: 24),

            // Support Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: const [
                  Text(
                    'Need support?',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF202124),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'If you need help, contact us on WhatsApp',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF5F6368),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFE8F0FE) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? const Color(0xFF1A73E8) : const Color(0xFFDADCE0),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? const Color(0xFF1A73E8) : const Color(0xFF5F6368),
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildBundleCard(String name, String validity, double price, {bool isUnlimited = false}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF202124),
                ),
              ),
              Text(
                'USD ${price.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A73E8),
                ),
              ),
            ],
          ),
          if (isUnlimited) ...[
            const SizedBox(height: 4),
            const Text(
              'Unlimited',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF5F6368),
              ),
            ),
          ],
          const SizedBox(height: 4),
          Text(
            'Valid for:',
            style: TextStyle(
              fontSize: 14,
              color: const Color(0xFF5F6368),
            ),
          ),
          Text(
            validity,
            style: TextStyle(
              fontSize: 14,
              color: const Color(0xFF5F6368),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRegionalPlanCard(String name, String data, String validity, String countries, double price) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF202124),
                ),
              ),
              Text(
                'USD ${price.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A73E8),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Data:',
            style: TextStyle(
              fontSize: 14,
              color: const Color(0xFF5F6368),
            ),
          ),
          Text(
            data,
            style: TextStyle(
              fontSize: 14,
              color: const Color(0xFF5F6368),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Valid for:',
            style: TextStyle(
              fontSize: 14,
              color: const Color(0xFF5F6368),
            ),
          ),
          Text(
            validity,
            style: TextStyle(
              fontSize: 14,
              color: const Color(0xFF5F6368),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Limited to:',
            style: TextStyle(
              fontSize: 14,
              color: const Color(0xFF5F6368),
            ),
          ),
          Text(
            countries,
            style: TextStyle(
              fontSize: 14,
              color: const Color(0xFF5F6368),
            ),
          ),
        ],
      ),
    );
  }

  @override
  MainViewModel viewModelBuilder(BuildContext context) => MainViewModel();

  @override
  void onViewModelReady(MainViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }
}