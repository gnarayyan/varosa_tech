import 'package:dio/dio.dart';
import '../../domain/entities/product.dart';

abstract class ProductRemoteDataSource {
  Future<List<Product>> getProducts({int page = 1, int limit = 20});
  Future<List<Product>> searchProducts(String query);
  Future<List<String>> getCategories();
  Future<List<Product>> getProductsByCategory(String category);
  Future<Product> getProductById(int id);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final Dio dio;
  static const String baseUrl = 'https://fakestoreapi.com';

  ProductRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<Product>> getProducts({int page = 1, int limit = 20}) async {
    try {
      final response = await dio.get(
        '$baseUrl/products',
        queryParameters: {'limit': limit, 'offset': (page - 1) * limit},
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => Product.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load products');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }

  @override
  Future<List<Product>> searchProducts(String query) async {
    try {
      // Since the fake API doesn't have search endpoint, we'll get all products
      // and filter them locally
      final products = await getProducts(limit: 100);
      return products
          .where(
            (product) =>
                product.title.toLowerCase().contains(query.toLowerCase()) ||
                product.description.toLowerCase().contains(
                  query.toLowerCase(),
                ) ||
                product.category.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    } catch (e) {
      throw Exception('Failed to search products: $e');
    }
  }

  @override
  Future<List<String>> getCategories() async {
    try {
      final response = await dio.get('$baseUrl/products/categories');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.cast<String>();
      } else {
        throw Exception('Failed to load categories');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('Failed to load categories: $e');
    }
  }

  @override
  Future<List<Product>> getProductsByCategory(String category) async {
    try {
      final response = await dio.get('$baseUrl/products/category/$category');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => Product.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load products by category');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('Failed to load products by category: $e');
    }
  }

  @override
  Future<Product> getProductById(int id) async {
    try {
      final response = await dio.get('$baseUrl/products/$id');

      if (response.statusCode == 200) {
        return Product.fromJson(response.data);
      } else {
        throw Exception('Failed to load product');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('Failed to load product: $e');
    }
  }
}
