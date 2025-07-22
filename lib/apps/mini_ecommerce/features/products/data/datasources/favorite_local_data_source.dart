import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../domain/entities/favorite_product.dart';

abstract class FavoriteLocalDataSource {
  Future<List<FavoriteProduct>> getFavorites();
  Future<void> addToFavorites(FavoriteProduct favorite);
  Future<void> removeFromFavorites(int productId);
  Future<bool> isFavorite(int productId);
  Future<void> clearFavorites();
}

class FavoriteLocalDataSourceImpl implements FavoriteLocalDataSource {
  static Database? _database;
  static const String tableName = 'favorites';

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'ecommerce_favorites.db');

    return await openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableName (
        productId INTEGER PRIMARY KEY,
        title TEXT NOT NULL,
        price REAL NOT NULL,
        image TEXT NOT NULL,
        category TEXT NOT NULL,
        addedAt TEXT NOT NULL
      )
    ''');
  }

  @override
  Future<List<FavoriteProduct>> getFavorites() async {
    final db = await database;
    final maps = await db.query(tableName, orderBy: 'addedAt DESC');

    return maps.map((map) => FavoriteProduct.fromMap(map)).toList();
  }

  @override
  Future<void> addToFavorites(FavoriteProduct favorite) async {
    final db = await database;
    await db.insert(
      tableName,
      favorite.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> removeFromFavorites(int productId) async {
    final db = await database;
    await db.delete(tableName, where: 'productId = ?', whereArgs: [productId]);
  }

  @override
  Future<bool> isFavorite(int productId) async {
    final db = await database;
    final result = await db.query(
      tableName,
      where: 'productId = ?',
      whereArgs: [productId],
      limit: 1,
    );

    return result.isNotEmpty;
  }

  @override
  Future<void> clearFavorites() async {
    final db = await database;
    await db.delete(tableName);
  }
}
