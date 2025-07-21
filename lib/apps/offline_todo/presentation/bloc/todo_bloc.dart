import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/todo.dart';
import '../../domain/usecases/todo_usecases.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final GetAllTodos _getAllTodos;
  final AddTodo _addTodo;
  final UpdateTodo _updateTodo;
  final DeleteTodo _deleteTodo;
  final ToggleTodoStatus _toggleTodoStatus;
  final SearchTodos _searchTodos;
  final GetTodosByStatus _getTodosByStatus;

  TodoBloc({
    required GetAllTodos getAllTodos,
    required AddTodo addTodo,
    required UpdateTodo updateTodo,
    required DeleteTodo deleteTodo,
    required ToggleTodoStatus toggleTodoStatus,
    required SearchTodos searchTodos,
    required GetTodosByStatus getTodosByStatus,
  }) : _getAllTodos = getAllTodos,
       _addTodo = addTodo,
       _updateTodo = updateTodo,
       _deleteTodo = deleteTodo,
       _toggleTodoStatus = toggleTodoStatus,
       _searchTodos = searchTodos,
       _getTodosByStatus = getTodosByStatus,
       super(TodoInitial()) {
    on<LoadTodos>(_onLoadTodos);
    on<AddTodoEvent>(_onAddTodo);
    on<UpdateTodoEvent>(_onUpdateTodo);
    on<DeleteTodoEvent>(_onDeleteTodo);
    on<ToggleTodoEvent>(_onToggleTodo);
    on<SearchTodosEvent>(_onSearchTodos);
    on<FilterTodosEvent>(_onFilterTodos);
  }

  Future<void> _onLoadTodos(LoadTodos event, Emitter<TodoState> emit) async {
    emit(TodoLoading());
    try {
      final todos = await _getAllTodos();
      emit(TodoLoaded(todos: todos));
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }

  Future<void> _onAddTodo(AddTodoEvent event, Emitter<TodoState> emit) async {
    try {
      await _addTodo(event.todo);
      add(LoadTodos());
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }

  Future<void> _onUpdateTodo(
    UpdateTodoEvent event,
    Emitter<TodoState> emit,
  ) async {
    try {
      await _updateTodo(event.todo);
      add(LoadTodos());
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }

  Future<void> _onDeleteTodo(
    DeleteTodoEvent event,
    Emitter<TodoState> emit,
  ) async {
    try {
      await _deleteTodo(event.id);
      add(LoadTodos());
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }

  Future<void> _onToggleTodo(
    ToggleTodoEvent event,
    Emitter<TodoState> emit,
  ) async {
    try {
      await _toggleTodoStatus(event.todo);
      add(LoadTodos());
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }

  Future<void> _onSearchTodos(
    SearchTodosEvent event,
    Emitter<TodoState> emit,
  ) async {
    try {
      final todos = await _searchTodos(event.query);
      if (state is TodoLoaded) {
        final currentState = state as TodoLoaded;
        emit(currentState.copyWith(todos: todos, searchQuery: event.query));
      } else {
        emit(TodoLoaded(todos: todos, searchQuery: event.query));
      }
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }

  Future<void> _onFilterTodos(
    FilterTodosEvent event,
    Emitter<TodoState> emit,
  ) async {
    try {
      List<Todo> todos;
      switch (event.filter) {
        case TodoFilter.all:
          todos = await _getAllTodos();
          break;
        case TodoFilter.completed:
          todos = await _getTodosByStatus(true);
          break;
        case TodoFilter.pending:
          todos = await _getTodosByStatus(false);
          break;
      }

      if (state is TodoLoaded) {
        final currentState = state as TodoLoaded;
        emit(currentState.copyWith(todos: todos, currentFilter: event.filter));
      } else {
        emit(TodoLoaded(todos: todos, currentFilter: event.filter));
      }
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }
}
