import '../entities/todo.dart';

abstract class TodoRepository {
  Future<List<Todo>> getAllTodos();
  Future<Todo?> getTodoById(int id);
  Future<Todo> addTodo(Todo todo);
  Future<Todo> updateTodo(Todo todo);
  Future<bool> deleteTodo(int id);
  Future<List<Todo>> searchTodos(String query);
  Future<List<Todo>> getTodosByStatus(bool isCompleted);
}
