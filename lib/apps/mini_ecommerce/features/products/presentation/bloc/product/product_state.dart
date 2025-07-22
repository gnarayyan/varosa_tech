part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> products;
  final List<String> categories;
  final bool hasReachedMax;
  final bool isSearching;

  const ProductLoaded({
    required this.products,
    required this.categories,
    required this.hasReachedMax,
    required this.isSearching,
  });

  ProductLoaded copyWith({
    List<Product>? products,
    List<String>? categories,
    bool? hasReachedMax,
    bool? isSearching,
  }) {
    return ProductLoaded(
      products: products ?? this.products,
      categories: categories ?? this.categories,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      isSearching: isSearching ?? this.isSearching,
    );
  }

  @override
  List<Object?> get props => [products, categories, hasReachedMax, isSearching];
}

class ProductError extends ProductState {
  final String message;

  const ProductError(this.message);

  @override
  List<Object?> get props => [message];
}
