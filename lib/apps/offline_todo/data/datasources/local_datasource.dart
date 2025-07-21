import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/todo_model.dart';

class DatabaseHelper {
  static const String _databaseName = 'todo_database.db';
  static const int _databaseVersion = 1;
  static const String _tableName = 'todos';

  static Database? _database;

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_tableName (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        description TEXT,
        isCompleted INTEGER NOT NULL DEFAULT 0,
        createdAt INTEGER NOT NULL,
        dueDate INTEGER,
        priority INTEGER NOT NULL DEFAULT 2
      )
    ''');
  }

  // Insert a todo
  Future<int> insertTodo(TodoModel todo) async {
    Database db = await database;
    return await db.insert(_tableName, todo.toMap());
  }

  // Get all todos
  Future<List<TodoModel>> getAllTodos() async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query(
      _tableName,
      orderBy: 'createdAt DESC',
    );
    return List.generate(maps.length, (i) => TodoModel.fromMap(maps[i]));
  }

  // Get todo by id
  Future<TodoModel?> getTodoById(int id) async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return TodoModel.fromMap(maps.first);
    }
    return null;
  }

  // Update a todo
  Future<int> updateTodo(TodoModel todo) async {
    Database db = await database;
    return await db.update(
      _tableName,
      todo.toMap(),
      where: 'id = ?',
      whereArgs: [todo.id],
    );
  }

  // Delete a todo
  Future<int> deleteTodo(int id) async {
    Database db = await database;
    return await db.delete(_tableName, where: 'id = ?', whereArgs: [id]);
  }

  // Search todos by title or description
  Future<List<TodoModel>> searchTodos(String query) async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query(
      _tableName,
      where: 'title LIKE ? OR description LIKE ?',
      whereArgs: ['%$query%', '%$query%'],
      orderBy: 'createdAt DESC',
    );
    return List.generate(maps.length, (i) => TodoModel.fromMap(maps[i]));
  }

  // Get todos by completion status
  Future<List<TodoModel>> getTodosByStatus(bool isCompleted) async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query(
      _tableName,
      where: 'isCompleted = ?',
      whereArgs: [isCompleted ? 1 : 0],
      orderBy: 'createdAt DESC',
    );
    return List.generate(maps.length, (i) => TodoModel.fromMap(maps[i]));
  }

  // Get todos by priority
  Future<List<TodoModel>> getTodosByPriority(int priority) async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query(
      _tableName,
      where: 'priority = ?',
      whereArgs: [priority],
      orderBy: 'createdAt DESC',
    );
    return List.generate(maps.length, (i) => TodoModel.fromMap(maps[i]));
  }

  // Close the database
  Future<void> close() async {
    Database db = await database;
    db.close();
  }
}
