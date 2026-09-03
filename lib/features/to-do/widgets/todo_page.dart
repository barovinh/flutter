import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_training/widgets/shared_app_bar.dart';
import 'package:todo_training/features/to-do/todo_controller.dart';
import 'package:todo_training/model/todo.dart';
import 'package:todo_training/features/to-do/widgets/todo_item.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final TodoController ctrl = TodoController();

  @override
  void initState() {
    super.initState();
    if (!Get.isRegistered<TodoController>()) {
      Get.put(ctrl);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1115),
      appBar: const SharedAppBar(currentPage: 'todo'),
      body: Obx(() {
        if (ctrl.isLoading.value)
          return const Center(child: CircularProgressIndicator());

        final items = ctrl.visibleTodos;
        if (items.isEmpty) {
          return const Center(
            child: Text('No todos', style: TextStyle(color: Colors.white54)),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 8),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final todo = items[index];
            return TodoItem(todo: todo);
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCreateDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showCreateDialog(BuildContext context) {
    final TextEditingController tc = TextEditingController();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('New Todo'),
        content: TextField(controller: tc, autofocus: true),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              final nextId = (ctrl.allTodos.isEmpty
                  ? 1
                  : ctrl.allTodos.first.id + 1);
              ctrl.addTodo(
                Todo(
                  id: nextId,
                  todo: tc.text.trim().isEmpty ? 'Untitled' : tc.text.trim(),
                  completed: false,
                  userId: 0,
                ),
              );
              Navigator.pop(context);
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }
}
