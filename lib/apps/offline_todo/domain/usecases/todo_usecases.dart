import '../entities/todo.dart';
import '../repositories/todo_repository.dart';

class GetAllTodos {
  final TodoRepository repository;

  GetAllTodos(this.repository);

  Future<List<Todo>> call() async {
    return await repository.getAllTodos();
  }
}

class GetTodoById {
  final TodoRepository repository;

  GetTodoById(this.repository);

  Future<Todo?> call(int id) async {
    return await repository.getTodoById(id);
  }
}

class AddTodo {
  final TodoRepository repository;

  AddTodo(this.repository);

  Future<Todo> call(Todo todo) async {
    if (todo.title.trim().isEmpty) {
      throw Exception('Todo title cannot be empty');
    }
    return await repository.addTodo(todo);
  }
}

class UpdateTodo {
  final TodoRepository repository;

  UpdateTodo(this.repository);

  Future<Todo> call(Todo todo) async {
    if (todo.title.trim().isEmpty) {
      throw Exception('Todo title cannot be empty');
    }
    if (todo.id == null) {
      throw Exception('Todo ID cannot be null for update');
    }
    return await repository.updateTodo(todo);
  }
}

class DeleteTodo {
  final TodoRepository repository;

  DeleteTodo(this.repository);

  Future<bool> call(int id) async {
    return await repository.deleteTodo(id);
  }
}

class SearchTodos {
  final TodoRepository repository;

  SearchTodos(this.repository);

  Future<List<Todo>> call(String query) async {
    if (query.trim().isEmpty) {
      return await repository.getAllTodos();
    }
    return await repository.searchTodos(query);
  }
}

class GetTodosByStatus {
  final TodoRepository repository;

  GetTodosByStatus(this.repository);

  Future<List<Todo>> call(bool isCompleted) async {
    return await repository.getTodosByStatus(isCompleted);
  }
}

class ToggleTodoStatus {
  final TodoRepository repository;

  ToggleTodoStatus(this.repository);

  Future<Todo> call(Todo todo) async {
    final updatedTodo = todo.copyWith(isCompleted: !todo.isCompleted);
    return await repository.updateTodo(updatedTodo);
  }
}
