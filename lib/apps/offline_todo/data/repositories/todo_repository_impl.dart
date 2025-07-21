import '../../domain/entities/todo.dart';
import '../../domain/repositories/todo_repository.dart';
import '../datasources/local_datasource.dart';
import '../models/todo_model.dart';

class TodoRepositoryImpl implements TodoRepository {
  final DatabaseHelper _databaseHelper;

  TodoRepositoryImpl(this._databaseHelper);

  @override
  Future<List<Todo>> getAllTodos() async {
    final todoModels = await _databaseHelper.getAllTodos();
    return todoModels.map((model) => model.toEntity()).toList();
  }

  @override
  Future<Todo?> getTodoById(int id) async {
    final todoModel = await _databaseHelper.getTodoById(id);
    return todoModel?.toEntity();
  }

  @override
  Future<Todo> addTodo(Todo todo) async {
    final todoModel = TodoModel.fromEntity(todo);
    final id = await _databaseHelper.insertTodo(todoModel);
    return todoModel.copyWith(id: id).toEntity();
  }

  @override
  Future<Todo> updateTodo(Todo todo) async {
    final todoModel = TodoModel.fromEntity(todo);
    await _databaseHelper.updateTodo(todoModel);
    return todo;
  }

  @override
  Future<bool> deleteTodo(int id) async {
    final result = await _databaseHelper.deleteTodo(id);
    return result > 0;
  }

  @override
  Future<List<Todo>> searchTodos(String query) async {
    final todoModels = await _databaseHelper.searchTodos(query);
    return todoModels.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<Todo>> getTodosByStatus(bool isCompleted) async {
    final todoModels = await _databaseHelper.getTodosByStatus(isCompleted);
    return todoModels.map((model) => model.toEntity()).toList();
  }
}
