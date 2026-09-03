import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_training/model/todo.dart';
import 'package:todo_training/features/to-do/todo_controller.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;

  const TodoItem({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    final TodoController ctrl = TodoController.to;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Checkbox(
            value: todo.completed,
            onChanged: (v) {
              ctrl.updateTodo(todo.id, completed: v ?? false);
            },
          ),
          Expanded(
            child: Text(
              todo.todo,
              style: TextStyle(
                color: todo.completed ? Colors.white54 : Colors.white,
                decoration: todo.completed ? TextDecoration.lineThrough : null,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.white70),
            onPressed: () => _showEditDialog(context),
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.redAccent),
            onPressed: () => _showDeleteConfirm(context),
          ),
        ],
      ),
    );
  }

  void _showEditDialog(BuildContext context) {
    final TextEditingController tc = TextEditingController(text: todo.todo);
    final TodoController ctrl = TodoController.to;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Edit Todo'),
        content: TextField(controller: tc, autofocus: true),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              ctrl.updateTodo(todo.id, todo: tc.text);
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirm(BuildContext context) {
    final TodoController ctrl = TodoController.to;
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Delete Todo'),
        content: const Text('Are you sure you want to delete this todo?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              ctrl.removeTodo(todo.id);
              Navigator.pop(context);
            },
            child: const Text(
              'Delete',
              style: TextStyle(color: Colors.redAccent),
            ),
          ),
        ],
      ),
    );
  }
}
