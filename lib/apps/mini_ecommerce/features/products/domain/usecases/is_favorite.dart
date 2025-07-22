import '../repositories/favorite_repository.dart';

class IsFavorite {
  final FavoriteRepository repository;

  IsFavorite(this.repository);

  Future<bool> call(int productId) async {
    return await repository.isFavorite(productId);
  }
}
