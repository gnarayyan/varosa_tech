import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:varosa_tech/apps/mini_ecommerce/features/products/presentation/widgets/fav_empty_view.dart';
import 'package:varosa_tech/apps/mini_ecommerce/features/products/presentation/widgets/favourite_error_view.dart';
import '../../../../../../../../themes/app_theme.dart';
import '../bloc/favorite/favorite_bloc.dart';
import 'favorite_card.dart';

class FavoritesTab extends StatelessWidget {
  const FavoritesTab({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<FavoriteBloc>().add(const LoadFavorites());
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        if (state is FavoriteLoading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.primary),
          );
        }

        if (state is FavoriteError) {
          return FavouriteErrorView(state.message);
        }

        if (state is FavoriteLoaded && state.favorites.isNotEmpty) {
          // if (state.favorites.isEmpty) {
          //   return FavEmptyView();
          // }

          return RefreshIndicator(
            onRefresh: () async {
              context.read<FavoriteBloc>().add(const LoadFavorites());
            },
            color: AppColors.primary,
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: state.favorites.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: FavoriteCard(
                    favorite: state.favorites[index],
                    onRemove: () {
                      context.read<FavoriteBloc>().add(
                        RemoveProductFromFavorites(
                          state.favorites[index].productId,
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          );
        }

        return FavEmptyView();
      },
    );
  }
}
