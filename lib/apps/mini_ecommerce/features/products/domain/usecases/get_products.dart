import '../entities/product.dart';
import '../repositories/product_repository.dart';

class GetProducts {
  final ProductRepository repository;

  GetProducts(this.repository);

  Future<List<Product>> call({int page = 1, int limit = 20}) async {
    return await repository.getProducts(page: page, limit: limit);
  }
}
