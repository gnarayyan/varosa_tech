part of 'todo_bloc.dart';

sealed class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class LoadTodos extends TodoEvent {}

class AddTodoEvent extends TodoEvent {
  final Todo todo;

  const AddTodoEvent(this.todo);

  @override
  List<Object> get props => [todo];
}

class UpdateTodoEvent extends TodoEvent {
  final Todo todo;

  const UpdateTodoEvent(this.todo);

  @override
  List<Object> get props => [todo];
}

class DeleteTodoEvent extends TodoEvent {
  final int id;

  const DeleteTodoEvent(this.id);

  @override
  List<Object> get props => [id];
}

class ToggleTodoEvent extends TodoEvent {
  final Todo todo;

  const ToggleTodoEvent(this.todo);

  @override
  List<Object> get props => [todo];
}

class SearchTodosEvent extends TodoEvent {
  final String query;

  const SearchTodosEvent(this.query);

  @override
  List<Object> get props => [query];
}

class FilterTodosEvent extends TodoEvent {
  final TodoFilter filter;

  const FilterTodosEvent(this.filter);

  @override
  List<Object> get props => [filter];
}
