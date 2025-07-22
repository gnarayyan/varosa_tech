import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../../../../../../core/service_locator.dart';
import '../../../../../../../../themes/app_theme.dart';
import '../bloc/product/product_bloc.dart';
import '../bloc/favorite/favorite_bloc.dart';
import '../widgets/product_grid.dart';
import '../widgets/search_bar.dart';
import '../widgets/category_filter.dart';
import '../widgets/favorites_tab.dart';

@RoutePage()
class EcommercePage extends StatelessWidget {
  const EcommercePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<ProductBloc>()..add(const LoadProducts()),
        ),
        BlocProvider(
          create: (context) => sl<FavoriteBloc>()..add(const LoadFavorites()),
        ),
      ],
      child: EcommerceView(),
    );
  }
}

class EcommerceView extends StatefulWidget {
  const EcommerceView({super.key});

  @override
  State<EcommerceView> createState() => _EcommerceViewState();
}

class _EcommerceViewState extends State<EcommerceView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<ProductBloc>()..add(const LoadProducts()),
        ),
        BlocProvider(
          create: (context) => sl<FavoriteBloc>()..add(const LoadFavorites()),
        ),
      ],
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: Text(
            'Mini Store',
            style: AppTextStyles.h2.copyWith(
              color: AppColors.onPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.onPrimary,
          elevation: 0,
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: AppColors.onPrimary,
            labelColor: AppColors.onPrimary,
            unselectedLabelColor: AppColors.onPrimary.withAlpha(
              (0.7 * 255).toInt(),
            ),
            tabs: const [
              Tab(icon: Icon(LucideIcons.store), text: 'Products'),
              Tab(icon: Icon(LucideIcons.heart), text: 'Favorites'),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            Column(
              children: [
                // Products Tab
                Container(
                  color: AppColors.primary,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: EcommerceSearchBar(),
                      ),
                      const CategoryFilter(),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
                const Expanded(child: ProductGrid()),
              ],
            ),
            const FavoritesTab(),
          ],
        ),
      ),
    );
  }
}
