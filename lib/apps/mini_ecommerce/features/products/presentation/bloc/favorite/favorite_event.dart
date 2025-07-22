part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object?> get props => [];
}

class LoadFavorites extends FavoriteEvent {
  const LoadFavorites();
}

class AddProductToFavorites extends FavoriteEvent {
  final FavoriteProduct favorite;

  const AddProductToFavorites(this.favorite);

  @override
  List<Object?> get props => [favorite];
}

class RemoveProductFromFavorites extends FavoriteEvent {
  final int productId;

  const RemoveProductFromFavorites(this.productId);

  @override
  List<Object?> get props => [productId];
}

class CheckIsFavorite extends FavoriteEvent {
  final int productId;

  const CheckIsFavorite(this.productId);

  @override
  List<Object?> get props => [productId];
}
