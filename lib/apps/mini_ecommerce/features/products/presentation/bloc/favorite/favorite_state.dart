part of 'favorite_bloc.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object?> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteLoaded extends FavoriteState {
  final List<FavoriteProduct> favorites;

  const FavoriteLoaded({required this.favorites});

  @override
  List<Object?> get props => [favorites];
}

class FavoriteStatusChecked extends FavoriteState {
  final int productId;
  final bool isFavorite;

  const FavoriteStatusChecked({
    required this.productId,
    required this.isFavorite,
  });

  @override
  List<Object?> get props => [productId, isFavorite];
}

class FavoriteError extends FavoriteState {
  final String message;

  const FavoriteError(this.message);

  @override
  List<Object?> get props => [message];
}
