import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import '../../../core/di/feature_di.dart';

// Data sources
import '../features/products/data/datasources/product_remote_data_source.dart';
import '../features/products/data/datasources/favorite_local_data_source.dart';

// Repositories
import '../features/products/data/repositories/product_repository_impl.dart';
import '../features/products/data/repositories/favorite_repository_impl.dart';
import '../features/products/domain/repositories/product_repository.dart';
import '../features/products/domain/repositories/favorite_repository.dart';

// Use cases
import '../features/products/domain/usecases/get_products.dart';
import '../features/products/domain/usecases/search_products.dart';
import '../features/products/domain/usecases/get_categories.dart';
import '../features/products/domain/usecases/get_products_by_category.dart';
import '../features/products/domain/usecases/get_favorites.dart';
import '../features/products/domain/usecases/add_to_favorites.dart';
import '../features/products/domain/usecases/remove_from_favorites.dart';
import '../features/products/domain/usecases/is_favorite.dart';

// BLoCs
import '../features/products/presentation/bloc/product/product_bloc.dart';
import '../features/products/presentation/bloc/favorite/favorite_bloc.dart';

class EcommerceDI with DIHelpers implements FeatureDI {
  @override
  void registerDependencies(GetIt sl) {
    _registerDataSources(sl);
    _registerRepositories(sl);
    _registerUseCases(sl);
    _registerBlocs(sl);
  }

  @override
  void unregisterDependencies(GetIt sl) {
    // BLoCs
    safeUnregister<ProductBloc>(sl);
    safeUnregister<FavoriteBloc>(sl);

    // Use cases
    safeUnregister<GetProducts>(sl);
    safeUnregister<SearchProductsByQuery>(sl);
    safeUnregister<GetCategories>(sl);
    safeUnregister<GetProductsByCategory>(sl);
    safeUnregister<GetFavorites>(sl);
    safeUnregister<AddToFavorites>(sl);
    safeUnregister<RemoveFromFavorites>(sl);
    safeUnregister<IsFavorite>(sl);

    // Repositories
    safeUnregister<ProductRepository>(sl);
    safeUnregister<FavoriteRepository>(sl);

    // Data sources
    safeUnregister<ProductRemoteDataSource>(sl);
    safeUnregister<FavoriteLocalDataSource>(sl);
  }

  void _registerDataSources(GetIt sl) {
    // Core HTTP client (safely register to avoid conflicts)
    safeRegister<Dio>(sl, () => Dio());

    // Data sources
    safeRegister<ProductRemoteDataSource>(
      sl,
      () => ProductRemoteDataSourceImpl(dio: sl()),
    );

    safeRegister<FavoriteLocalDataSource>(
      sl,
      () => FavoriteLocalDataSourceImpl(),
    );
  }

  void _registerRepositories(GetIt sl) {
    safeRegister<ProductRepository>(
      sl,
      () => ProductRepositoryImpl(remoteDataSource: sl()),
    );

    safeRegister<FavoriteRepository>(
      sl,
      () => FavoriteRepositoryImpl(localDataSource: sl()),
    );
  }

  void _registerUseCases(GetIt sl) {
    // Product use cases
    safeRegister<GetProducts>(sl, () => GetProducts(sl()));
    safeRegister<SearchProductsByQuery>(sl, () => SearchProductsByQuery(sl()));
    safeRegister<GetCategories>(sl, () => GetCategories(sl()));
    safeRegister<GetProductsByCategory>(sl, () => GetProductsByCategory(sl()));

    // Favorite use cases
    safeRegister<GetFavorites>(sl, () => GetFavorites(sl()));
    safeRegister<AddToFavorites>(sl, () => AddToFavorites(sl()));
    safeRegister<RemoveFromFavorites>(sl, () => RemoveFromFavorites(sl()));
    safeRegister<IsFavorite>(sl, () => IsFavorite(sl()));
  }

  void _registerBlocs(GetIt sl) {
    safeRegisterFactory<ProductBloc>(
      sl,
      () => ProductBloc(
        getProducts: sl(),
        searchProducts: sl(),
        getCategories: sl(),
        getProductsByCategory: sl(),
      ),
    );

    safeRegisterFactory<FavoriteBloc>(
      sl,
      () => FavoriteBloc(
        getFavorites: sl(),
        addToFavorites: sl(),
        removeFromFavorites: sl(),
        isFavorite: sl(),
      ),
    );
  }

  /// Static convenience methods for backward compatibility
  static void register(GetIt sl) {
    final instance = EcommerceDI();
    instance.registerDependencies(sl);
  }

  static void unregister(GetIt sl) {
    final instance = EcommerceDI();
    instance.unregisterDependencies(sl);
  }
}
