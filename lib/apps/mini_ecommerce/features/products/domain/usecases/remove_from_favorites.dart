import '../repositories/favorite_repository.dart';

class RemoveFromFavorites {
  final FavoriteRepository repository;

  RemoveFromFavorites(this.repository);

  Future<void> call(int productId) async {
    return await repository.removeFromFavorites(productId);
  }
}
