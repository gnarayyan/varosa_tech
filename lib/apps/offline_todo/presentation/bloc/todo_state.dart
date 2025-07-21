part of 'todo_bloc.dart';

enum TodoFilter { all, completed, pending }

sealed class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

final class TodoInitial extends TodoState {}

class TodoLoading extends TodoState {}

class TodoLoaded extends TodoState {
  final List<Todo> todos;
  final TodoFilter currentFilter;
  final String searchQuery;

  const TodoLoaded({
    required this.todos,
    this.currentFilter = TodoFilter.all,
    this.searchQuery = '',
  });

  @override
  List<Object> get props => [todos, currentFilter, searchQuery];

  TodoLoaded copyWith({
    List<Todo>? todos,
    TodoFilter? currentFilter,
    String? searchQuery,
  }) {
    return TodoLoaded(
      todos: todos ?? this.todos,
      currentFilter: currentFilter ?? this.currentFilter,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}

class TodoError extends TodoState {
  final String message;

  const TodoError(this.message);

  @override
  List<Object> get props => [message];
}
