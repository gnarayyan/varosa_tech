import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/favorite_product.dart';
import '../../../domain/usecases/get_favorites.dart';
import '../../../domain/usecases/add_to_favorites.dart';
import '../../../domain/usecases/remove_from_favorites.dart';
import '../../../domain/usecases/is_favorite.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final GetFavorites getFavorites;
  final AddToFavorites addToFavorites;
  final RemoveFromFavorites removeFromFavorites;
  final IsFavorite isFavorite;

  FavoriteBloc({
    required this.getFavorites,
    required this.addToFavorites,
    required this.removeFromFavorites,
    required this.isFavorite,
  }) : super(FavoriteInitial()) {
    on<LoadFavorites>(_onLoadFavorites);
    on<AddProductToFavorites>(_onAddProductToFavorites);
    on<RemoveProductFromFavorites>(_onRemoveProductFromFavorites);
    on<CheckIsFavorite>(_onCheckIsFavorite);
  }

  Future<void> _onLoadFavorites(
    LoadFavorites event,
    Emitter<FavoriteState> emit,
  ) async {
    emit(FavoriteLoading());
    try {
      final favorites = await getFavorites();
      emit(FavoriteLoaded(favorites: favorites));
    } catch (e) {
      emit(FavoriteError(e.toString()));
    }
  }

  Future<void> _onAddProductToFavorites(
    AddProductToFavorites event,
    Emitter<FavoriteState> emit,
  ) async {
    try {
      await addToFavorites(event.favorite);
      add(const LoadFavorites());
    } catch (e) {
      emit(FavoriteError(e.toString()));
    }
  }

  Future<void> _onRemoveProductFromFavorites(
    RemoveProductFromFavorites event,
    Emitter<FavoriteState> emit,
  ) async {
    try {
      await removeFromFavorites(event.productId);
      add(const LoadFavorites());
    } catch (e) {
      emit(FavoriteError(e.toString()));
    }
  }

  Future<void> _onCheckIsFavorite(
    CheckIsFavorite event,
    Emitter<FavoriteState> emit,
  ) async {
    try {
      final isProductFavorite = await isFavorite(event.productId);
      emit(
        FavoriteStatusChecked(
          productId: event.productId,
          isFavorite: isProductFavorite,
        ),
      );
    } catch (e) {
      emit(FavoriteError(e.toString()));
    }
  }
}
