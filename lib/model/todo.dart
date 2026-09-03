class Todo {
  final int id;
  final String todo;
  final bool completed;
  final int userId;

  Todo({
    required this.id,
    required this.todo,
    required this.completed,
    required this.userId,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'] as int,
      todo: json['todo'] as String,
      completed: json['completed'] as bool,
      userId: json['userId'] as int,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'todo': todo,
    'completed': completed,
    'userId': userId,
  };

  Todo copyWith({String? todo, bool? completed}) {
    return Todo(
      id: id,
      todo: todo ?? this.todo,
      completed: completed ?? this.completed,
      userId: userId,
    );
  }
}
