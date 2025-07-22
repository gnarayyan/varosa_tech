import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../../../../../../themes/app_theme.dart';
import '../bloc/product/product_bloc.dart';

class EcommerceSearchBar extends StatefulWidget {
  const EcommerceSearchBar({super.key});

  @override
  State<EcommerceSearchBar> createState() => _EcommerceSearchBarState();
}

class _EcommerceSearchBarState extends State<EcommerceSearchBar> {
  final TextEditingController _searchController = TextEditingController();
  final ValueNotifier<String> _query = ValueNotifier<String>('');
  Timer? _debounceTimer;
  
  // Debounce duration in milliseconds
  static const Duration _debounceDuration = Duration(milliseconds: 500);

  @override
  void dispose() {
    _searchController.dispose();
    _query.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    _query.value = query.trim();
    
    // Cancel the previous timer if it exists
    _debounceTimer?.cancel();
    
    // Create a new timer for debouncing
    _debounceTimer = Timer(_debounceDuration, () {
      if (mounted) {
        final trimmedQuery = query.trim();
        if (trimmedQuery.isEmpty) {
          context.read<ProductBloc>().add(const ClearSearch());
        } else {
          context.read<ProductBloc>().add(SearchProducts(trimmedQuery));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        onChanged: _onSearchChanged,
        decoration: InputDecoration(
          hintText: 'Search products...',
          hintStyle: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textHint,
          ),
          prefixIcon: const Icon(
            LucideIcons.search,
            color: AppColors.textHint,
            size: 20,
          ),
          suffixIcon: ValueListenableBuilder<String>(
            valueListenable: _query,
            builder: (context, value, child) {
              return value.isEmpty
                  ? SizedBox.shrink()
                  : IconButton(
                      icon: const Icon(
                        LucideIcons.x,
                        color: AppColors.textHint,
                        size: 18,
                      ),
                      onPressed: () {
                        _searchController.clear();
                        _query.value = '';
                        _debounceTimer?.cancel();
                        context.read<ProductBloc>().add(const ClearSearch());
                      },
                    );
            },
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.primary, width: 2),
          ),
          fillColor: AppColors.surface,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
        style: AppTextStyles.bodyMedium,
      ),
    );
  }
}
