import '../../domain/entities/todo.dart';

class TodoModel extends Todo {
  const TodoModel({
    super.id,
    required super.title,
    super.description,
    super.isCompleted = false,
    required super.createdAt,
    super.dueDate,
    super.priority = 2,
  });

  // Convert from database map to TodoModel
  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id']?.toInt(),
      title: map['title'] ?? '',
      description: map['description'],
      isCompleted: map['isCompleted'] == 1,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
      dueDate: map['dueDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['dueDate'])
          : null,
      priority: map['priority']?.toInt() ?? 2,
    );
  }

  // Convert TodoModel to database map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isCompleted': isCompleted ? 1 : 0,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'dueDate': dueDate?.millisecondsSinceEpoch,
      'priority': priority,
    };
  }

  // Convert from Todo entity to TodoModel
  factory TodoModel.fromEntity(Todo todo) {
    return TodoModel(
      id: todo.id,
      title: todo.title,
      description: todo.description,
      isCompleted: todo.isCompleted,
      createdAt: todo.createdAt,
      dueDate: todo.dueDate,
      priority: todo.priority,
    );
  }

  // Convert TodoModel to Todo entity
  Todo toEntity() {
    return Todo(
      id: id,
      title: title,
      description: description,
      isCompleted: isCompleted,
      createdAt: createdAt,
      dueDate: dueDate,
      priority: priority,
    );
  }

  @override
  TodoModel copyWith({
    int? id,
    String? title,
    String? description,
    bool? isCompleted,
    DateTime? createdAt,
    DateTime? dueDate,
    int? priority,
  }) {
    return TodoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      createdAt: createdAt ?? this.createdAt,
      dueDate: dueDate ?? this.dueDate,
      priority: priority ?? this.priority,
    );
  }
}
