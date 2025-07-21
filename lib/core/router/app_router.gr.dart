// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/foundation.dart' as _i6;
import 'package:varosa_tech/apps/offline_todo/domain/entities/todo.dart' as _i7;
import 'package:varosa_tech/apps/offline_todo/presentation/pages/add_todo_page.dart'
    as _i1;
import 'package:varosa_tech/apps/offline_todo/presentation/pages/edit_todo_page.dart'
    as _i2;
import 'package:varosa_tech/apps/offline_todo/presentation/pages/todo_page.dart'
    as _i4;
import 'package:varosa_tech/core/landing_page/landing_page.dart' as _i3;

/// generated route for
/// [_i1.AddTodoPage]
class AddTodoRoute extends _i5.PageRouteInfo<void> {
  const AddTodoRoute({List<_i5.PageRouteInfo>? children})
    : super(AddTodoRoute.name, initialChildren: children);

  static const String name = 'AddTodoRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.AddTodoPage();
    },
  );
}

/// generated route for
/// [_i2.EditTodoPage]
class EditTodoRoute extends _i5.PageRouteInfo<EditTodoRouteArgs> {
  EditTodoRoute({
    _i6.Key? key,
    required _i7.Todo todo,
    List<_i5.PageRouteInfo>? children,
  }) : super(
         EditTodoRoute.name,
         args: EditTodoRouteArgs(key: key, todo: todo),
         initialChildren: children,
       );

  static const String name = 'EditTodoRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EditTodoRouteArgs>();
      return _i2.EditTodoPage(key: args.key, todo: args.todo);
    },
  );
}

class EditTodoRouteArgs {
  const EditTodoRouteArgs({this.key, required this.todo});

  final _i6.Key? key;

  final _i7.Todo todo;

  @override
  String toString() {
    return 'EditTodoRouteArgs{key: $key, todo: $todo}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! EditTodoRouteArgs) return false;
    return key == other.key && todo == other.todo;
  }

  @override
  int get hashCode => key.hashCode ^ todo.hashCode;
}

/// generated route for
/// [_i3.LandingPage]
class LandingRoute extends _i5.PageRouteInfo<void> {
  const LandingRoute({List<_i5.PageRouteInfo>? children})
    : super(LandingRoute.name, initialChildren: children);

  static const String name = 'LandingRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.LandingPage();
    },
  );
}

/// generated route for
/// [_i4.TodoPage]
class TodoRoute extends _i5.PageRouteInfo<void> {
  const TodoRoute({List<_i5.PageRouteInfo>? children})
    : super(TodoRoute.name, initialChildren: children);

  static const String name = 'TodoRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.TodoPage();
    },
  );
}
