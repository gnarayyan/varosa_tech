import '../../domain/entities/favorite_product.dart';
import '../../domain/repositories/favorite_repository.dart';
import '../datasources/favorite_local_data_source.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final FavoriteLocalDataSource localDataSource;

  FavoriteRepositoryImpl({required this.localDataSource});

  @override
  Future<List<FavoriteProduct>> getFavorites() async {
    try {
      return await localDataSource.getFavorites();
    } catch (e) {
      throw Exception('Failed to get favorites: $e');
    }
  }

  @override
  Future<void> addToFavorites(FavoriteProduct favorite) async {
    try {
      return await localDataSource.addToFavorites(favorite);
    } catch (e) {
      throw Exception('Failed to add to favorites: $e');
    }
  }

  @override
  Future<void> removeFromFavorites(int productId) async {
    try {
      return await localDataSource.removeFromFavorites(productId);
    } catch (e) {
      throw Exception('Failed to remove from favorites: $e');
    }
  }

  @override
  Future<bool> isFavorite(int productId) async {
    try {
      return await localDataSource.isFavorite(productId);
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> clearFavorites() async {
    try {
      return await localDataSource.clearFavorites();
    } catch (e) {
      throw Exception('Failed to clear favorites: $e');
    }
  }
}
