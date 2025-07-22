import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../core/service_locator.dart';
import '../../../themes/app_theme.dart';
import '../bloc/navigation_bloc.dart';
import '../widgets/tab_navigator.dart';

@RoutePage()
class NestedBottomNavPage extends StatelessWidget {
  const NestedBottomNavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<NavigationBloc>(),
      child: const NestedBottomNavView(),
    );
  }
}

class NestedBottomNavView extends StatelessWidget {
  const NestedBottomNavView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.background,
          body: SafeArea(
            child: IndexedStack(
              index: state.selectedIndex,
              children: const [
                TabNavigator(tabIndex: 0),
                TabNavigator(tabIndex: 1),
                TabNavigator(tabIndex: 2),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: AppColors.surface,
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadow.withOpacity(0.1),
                  blurRadius: 12,
                  offset: const Offset(0, -4),
                ),
              ],
            ),
            child: BottomNavigationBar(
              currentIndex: state.selectedIndex,
              onTap: (index) {
                context.read<NavigationBloc>().add(TabChanged(index));
              },
              backgroundColor: AppColors.surface,
              selectedItemColor: AppColors.primary,
              unselectedItemColor: AppColors.textHint,
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              selectedLabelStyle: AppTextStyles.bodySmall.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
              unselectedLabelStyle: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textHint,
              ),
              items: [
                BottomNavigationBarItem(
                  icon: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: state.selectedIndex == 0
                          ? AppColors.primary.withOpacity(0.1)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      LucideIcons.home,
                      color: state.selectedIndex == 0
                          ? AppColors.primary
                          : AppColors.textHint,
                    ),
                  ),
                  label: 'Item 1',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: state.selectedIndex == 1
                          ? AppColors.primary.withOpacity(0.1)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      LucideIcons.user,
                      color: state.selectedIndex == 1
                          ? AppColors.primary
                          : AppColors.textHint,
                    ),
                  ),
                  label: 'Item 2',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: state.selectedIndex == 2
                          ? AppColors.primary.withOpacity(0.1)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      LucideIcons.settings,
                      color: state.selectedIndex == 2
                          ? AppColors.primary
                          : AppColors.textHint,
                    ),
                  ),
                  label: 'Item 3',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
