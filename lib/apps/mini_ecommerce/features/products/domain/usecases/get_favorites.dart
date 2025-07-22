import '../entities/favorite_product.dart';
import '../repositories/favorite_repository.dart';

class GetFavorites {
  final FavoriteRepository repository;

  GetFavorites(this.repository);

  Future<List<FavoriteProduct>> call() async {
    return await repository.getFavorites();
  }
}
