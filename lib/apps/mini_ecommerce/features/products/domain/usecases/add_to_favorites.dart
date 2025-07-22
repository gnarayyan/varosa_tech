import '../entities/favorite_product.dart';
import '../repositories/favorite_repository.dart';

class AddToFavorites {
  final FavoriteRepository repository;

  AddToFavorites(this.repository);

  Future<void> call(FavoriteProduct favorite) async {
    return await repository.addToFavorites(favorite);
  }
}
