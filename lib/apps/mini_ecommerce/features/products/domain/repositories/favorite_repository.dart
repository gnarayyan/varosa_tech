import '../entities/favorite_product.dart';

abstract class FavoriteRepository {
  Future<List<FavoriteProduct>> getFavorites();
  Future<void> addToFavorites(FavoriteProduct favorite);
  Future<void> removeFromFavorites(int productId);
  Future<bool> isFavorite(int productId);
  Future<void> clearFavorites();
}
