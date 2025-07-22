import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/product.dart';
import '../../../domain/usecases/get_products.dart';
import '../../../domain/usecases/search_products.dart';
import '../../../domain/usecases/get_categories.dart';
import '../../../domain/usecases/get_products_by_category.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProducts getProducts;
  final SearchProductsByQuery searchProducts;
  final GetCategories getCategories;
  final GetProductsByCategory getProductsByCategory;

  int _currentPage = 1;
  static const int _limit = 20;
  List<Product> _allProducts = [];
  bool _hasReachedMax = false;
  String? _currentCategory;
  String? _currentSearchQuery;

  ProductBloc({
    required this.getProducts,
    required this.searchProducts,
    required this.getCategories,
    required this.getProductsByCategory,
  }) : super(ProductInitial()) {
    on<LoadProducts>(_onLoadProducts);
    on<LoadMoreProducts>(_onLoadMoreProducts);
    on<SearchProducts>(_onSearchProducts);
    on<LoadCategories>(_onLoadCategories);
    on<FilterByCategory>(_onFilterByCategory);
    on<ClearSearch>(_onClearSearch);
    on<RefreshProducts>(_onRefreshProducts);
  }

  Future<void> _onLoadProducts(
    LoadProducts event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductLoading());
    try {
      _currentPage = 1;
      _allProducts.clear();
      _hasReachedMax = false;
      _currentCategory = null;
      _currentSearchQuery = null;

      final products = await getProducts(page: _currentPage, limit: _limit);
      final categories = await getCategories();

      _allProducts = products;
      _hasReachedMax = products.length < _limit;

      emit(
        ProductLoaded(
          products: _allProducts,
          categories: categories,
          hasReachedMax: _hasReachedMax,
          isSearching: false,
        ),
      );
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  Future<void> _onLoadMoreProducts(
    LoadMoreProducts event,
    Emitter<ProductState> emit,
  ) async {
    if (_hasReachedMax || _currentSearchQuery != null) return;

    if (state is ProductLoaded) {
      final currentState = state as ProductLoaded;

      try {
        _currentPage++;
        List<Product> newProducts;

        if (_currentCategory != null) {
          // For category filtering, we already have all products
          return;
        } else {
          newProducts = await getProducts(page: _currentPage, limit: _limit);
        }

        if (newProducts.isEmpty || newProducts.length < _limit) {
          _hasReachedMax = true;
        }

        _allProducts.addAll(newProducts);

        emit(
          currentState.copyWith(
            products: _allProducts,
            hasReachedMax: _hasReachedMax,
          ),
        );
      } catch (e) {
        _currentPage--; // Revert page increment on error
        emit(ProductError(e.toString()));
      }
    }
  }

  Future<void> _onSearchProducts(
    SearchProducts event,
    Emitter<ProductState> emit,
  ) async {
    if (state is ProductLoaded) {
      final currentState = state as ProductLoaded;

      if (event.query.trim().isEmpty) {
        emit(currentState.copyWith(products: _allProducts, isSearching: false));
        return;
      }

      emit(currentState.copyWith(isSearching: true));

      try {
        _currentSearchQuery = event.query;
        final searchResults = await searchProducts(event.query);

        emit(
          currentState.copyWith(
            products: searchResults,
            isSearching: false,
            hasReachedMax: true, // Disable pagination for search
          ),
        );
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    }
  }

  Future<void> _onLoadCategories(
    LoadCategories event,
    Emitter<ProductState> emit,
  ) async {
    if (state is ProductLoaded) {
      final currentState = state as ProductLoaded;
      try {
        final categories = await getCategories();
        emit(currentState.copyWith(categories: categories));
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    }
  }

  Future<void> _onFilterByCategory(
    FilterByCategory event,
    Emitter<ProductState> emit,
  ) async {
    if (state is ProductLoaded) {
      final currentState = state as ProductLoaded;

      emit(currentState.copyWith(isSearching: true));

      try {
        _currentCategory = event.category;
        _currentSearchQuery = null;

        final categoryProducts = await getProductsByCategory(event.category);

        emit(
          currentState.copyWith(
            products: categoryProducts,
            isSearching: false,
            hasReachedMax: true, // Disable pagination for category filter
          ),
        );
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    }
  }

  Future<void> _onClearSearch(
    ClearSearch event,
    Emitter<ProductState> emit,
  ) async {
    if (state is ProductLoaded) {
      final currentState = state as ProductLoaded;
      _currentSearchQuery = null;
      _currentCategory = null;

      emit(
        currentState.copyWith(
          products: _allProducts,
          isSearching: false,
          hasReachedMax: _hasReachedMax,
        ),
      );
    }
  }

  Future<void> _onRefreshProducts(
    RefreshProducts event,
    Emitter<ProductState> emit,
  ) async {
    add(const LoadProducts());
  }
}
