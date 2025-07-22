import '../entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts({int page = 1, int limit = 20});
  Future<List<Product>> searchProducts(String query);
  Future<List<String>> getCategories();
  Future<List<Product>> getProductsByCategory(String category);
  Future<Product> getProductById(int id);
}
