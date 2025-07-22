import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../themes/app_theme.dart';

class TabHomeScreen extends StatelessWidget {
  final int tabIndex;
  final VoidCallback onNavigateToDetail;

  const TabHomeScreen({
    super.key,
    required this.tabIndex,
    required this.onNavigateToDetail,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Item ${tabIndex + 1} Screen',
          style: AppTextStyles.h2.copyWith(
            color: AppColors.onPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),

            // Tab Icon
            Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: AppColors.primary.withAlpha((0.1 * 255).toInt()),
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.primary.withAlpha((0.2 * 255).toInt()),
                  width: 2,
                ),
              ),
              child: Icon(
                _getTabIcon(tabIndex),
                size: 40,
                color: AppColors.primary,
              ),
            ),

            const SizedBox(height: 32),

            // Welcome Text
            Text(
              'Welcome to Item ${tabIndex + 1}',
              style: AppTextStyles.h1.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 16),

            Text(
              _getTabDescription(tabIndex),
              style: AppTextStyles.bodyLarge.copyWith(
                color: AppColors.textSecondary,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),

            // const SizedBox(height: 48),

            // Feature Cards
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1,
                children: [
                  _buildFeatureCard(
                    'Navigate',
                    'Tap to push detail screen',
                    LucideIcons.arrowRight,
                    AppColors.primary,
                  ),
                  _buildFeatureCard(
                    'Persistent',
                    'Bottom nav stays visible',
                    LucideIcons.layers,
                    AppColors.secondary,
                  ),
                  _buildFeatureCard(
                    'Independent',
                    'Each tab has own stack',
                    LucideIcons.fileStack,
                    AppColors.success,
                  ),
                  _buildFeatureCard(
                    'Nested',
                    'True nested navigation',
                    LucideIcons.navigation,
                    AppColors.warning,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Navigate Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onNavigateToDetail,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.onPrimary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                  shadowColor: AppColors.primary.withAlpha((0.3 * 255).toInt()),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(LucideIcons.arrowRight, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      'Go to Item ${tabIndex + 1} Detail',
                      style: AppTextStyles.titleMedium.copyWith(
                        color: AppColors.onPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard(
    String title,
    String description,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow.withAlpha((0.08 * 255).toInt()),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withAlpha((0.1 * 255).toInt()),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: AppTextStyles.titleSmall.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textSecondary,
              fontSize: 10,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  IconData _getTabIcon(int index) {
    switch (index) {
      case 0:
        return LucideIcons.home;
      case 1:
        return LucideIcons.user;
      case 2:
        return LucideIcons.settings;
      default:
        return LucideIcons.circle;
    }
  }

  // String _getTabDescription(int index) {
  //   switch (index) {
  //     case 0:
  //       return 'This is your home dashboard. Navigate to see nested navigation in action while keeping the bottom bar persistent.';
  //     case 1:
  //       return 'Manage your profile and personal settings. Each tab maintains its own navigation stack independently.';
  //     case 2:
  //       return 'Configure app settings and preferences. Experience seamless navigation without losing your current context.';
  //     default:
  //       return 'Explore the features of this tab.';
  //   }
  // }

  String _getTabDescription(int index) {
    switch (index) {
      case 0:
        return '';
      case 1:
        return '';
      case 2:
        return '';
      default:
        return 'Explore the features of this tab.';
    }
  }
}
