import '../entities/product.dart';
import '../repositories/product_repository.dart';

class SearchProductsByQuery {
  final ProductRepository repository;

  SearchProductsByQuery(this.repository);

  Future<List<Product>> call(String query) async {
    if (query.trim().isEmpty) {
      return [];
    }
    return await repository.searchProducts(query);
  }
}
