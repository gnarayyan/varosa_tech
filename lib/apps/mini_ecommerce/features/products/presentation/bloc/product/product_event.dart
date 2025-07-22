part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object?> get props => [];
}

class LoadProducts extends ProductEvent {
  const LoadProducts();
}

class LoadMoreProducts extends ProductEvent {
  const LoadMoreProducts();
}

class SearchProducts extends ProductEvent {
  final String query;

  const SearchProducts(this.query);

  @override
  List<Object?> get props => [query];
}

class LoadCategories extends ProductEvent {
  const LoadCategories();
}

class FilterByCategory extends ProductEvent {
  final String category;

  const FilterByCategory(this.category);

  @override
  List<Object?> get props => [category];
}

class ClearSearch extends ProductEvent {
  const ClearSearch();
}

class RefreshProducts extends ProductEvent {
  const RefreshProducts();
}
