import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../../../../../../themes/app_theme.dart';
import '../../domain/entities/product.dart';
import '../../domain/entities/favorite_product.dart';
import '../bloc/favorite/favorite_bloc.dart';

class ProductCard extends StatefulWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _checkFavoriteStatus();
  }

  void _checkFavoriteStatus() async {
    // In a real app, you might want to check this more efficiently
    final favoriteBloc = context.read<FavoriteBloc>();
    favoriteBloc.add(CheckIsFavorite(widget.product.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FavoriteBloc, FavoriteState>(
      listener: (context, state) {
        if (state is FavoriteStatusChecked &&
            state.productId == widget.product.id) {
          setState(() {
            _isFavorite = state.isFavorite;
          });
        }
      },
      child: Container(
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: widget.product.image,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          color: AppColors.background,
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primary,
                              strokeWidth: 2,
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) => Container(
                          color: AppColors.background,
                          child: const Icon(
                            LucideIcons.imageOff,
                            color: AppColors.textHint,
                            size: 32,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: GestureDetector(
                      onTap: _toggleFavorite,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: AppColors.surface.withAlpha(
                            (0.9 * 255).toInt(),
                          ),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.shadow.withAlpha(
                                (0.1 * 255).toInt(),
                              ),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Icon(
                          _isFavorite ? LucideIcons.heart : LucideIcons.heart,
                          size: 16,
                          color: _isFavorite
                              ? AppColors.error
                              : AppColors.textHint,
                        ),
                      ),
                    ),
                  ),
                  if (widget.product.rating.rate >= 4.0)
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.success,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              LucideIcons.star,
                              size: 10,
                              color: AppColors.onPrimary,
                            ),
                            const SizedBox(width: 2),
                            Text(
                              widget.product.rating.rate.toStringAsFixed(1),
                              style: AppTextStyles.bodySmall.copyWith(
                                color: AppColors.onPrimary,
                                fontSize: 10,
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
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.product.title,
                      style: AppTextStyles.titleSmall.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        height: 1.2,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    // const SizedBox(height: 4),
                    // Text(
                    //   _formatCategoryName(widget.product.category),
                    //   style: AppTextStyles.bodySmall.copyWith(
                    //     color: AppColors.textSecondary,
                    //     fontSize: 10,
                    //   ),
                    // ),
                    // const SizedBox(height: 4),
                    // Text(
                    //   widget.product.description,
                    //   style: AppTextStyles.bodySmall.copyWith(
                    //     color: AppColors.textSecondary,
                    //     fontSize: 10,
                    //     height: 1.2,
                    //   ),
                    //   maxLines: 2,
                    //   overflow: TextOverflow.ellipsis,
                    // ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            '\$${widget.product.price.toStringAsFixed(2)}',
                            style: AppTextStyles.titleMedium.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              LucideIcons.star,
                              size: 12,
                              color: AppColors.warning,
                            ),
                            const SizedBox(width: 2),
                            Text(
                              widget.product.rating.rate.toStringAsFixed(1),
                              style: AppTextStyles.bodySmall.copyWith(
                                color: AppColors.textSecondary,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ],
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

  void _toggleFavorite() {
    if (_isFavorite) {
      context.read<FavoriteBloc>().add(
        RemoveProductFromFavorites(widget.product.id),
      );
    } else {
      final favorite = FavoriteProduct.fromProduct(
        widget.product.id,
        widget.product.title,
        widget.product.price,
        widget.product.image,
        widget.product.category,
      );
      context.read<FavoriteBloc>().add(AddProductToFavorites(favorite));
    }

    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  // String _formatCategoryName(String category) {
  //   return category
  //       .split(' ')
  //       .map(
  //         (word) => word.isNotEmpty
  //             ? '${word[0].toUpperCase()}${word.substring(1)}'
  //             : word,
  //       )
  //       .join(' ');
  // }
}
