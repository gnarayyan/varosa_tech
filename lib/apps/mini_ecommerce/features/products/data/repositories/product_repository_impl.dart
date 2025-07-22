import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_remote_data_source.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Product>> getProducts({int page = 1, int limit = 20}) async {
    try {
      return await remoteDataSource.getProducts(page: page, limit: limit);
    } catch (e) {
      throw Exception('Failed to get products: $e');
    }
  }

  @override
  Future<List<Product>> searchProducts(String query) async {
    try {
      return await remoteDataSource.searchProducts(query);
    } catch (e) {
      throw Exception('Failed to search products: $e');
    }
  }

  @override
  Future<List<String>> getCategories() async {
    try {
      return await remoteDataSource.getCategories();
    } catch (e) {
      throw Exception('Failed to get categories: $e');
    }
  }

  @override
  Future<List<Product>> getProductsByCategory(String category) async {
    try {
      return await remoteDataSource.getProductsByCategory(category);
    } catch (e) {
      throw Exception('Failed to get products by category: $e');
    }
  }

  @override
  Future<Product> getProductById(int id) async {
    try {
      return await remoteDataSource.getProductById(id);
    } catch (e) {
      throw Exception('Failed to get product by id: $e');
    }
  }
}
