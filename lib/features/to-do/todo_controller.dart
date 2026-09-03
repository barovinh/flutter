import 'dart:convert';

import 'package:get/get.dart';
import 'package:todo_training/model/todo.dart';
import 'package:http/http.dart' as http;

class TodoController extends GetxController {
  static TodoController get to => Get.find();

  final RxList<Todo> allTodos = <Todo>[].obs;
  final RxList<Todo> visibleTodos = <Todo>[].obs;
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTodos()
        .then((list) {
          allTodos.assignAll(list);
          visibleTodos.assignAll(allTodos);
          isLoading.value = false;
        })
        .catchError((_) {
          isLoading.value = false;
        });
  }

  Future<List<Todo>> fetchTodos() async {
    try {
      final response = await http.get(
        Uri.parse('https://dummyjson.com/c/eb6e-6524-431d-9926'),
        headers: {'Accept': 'application/json'},
      );

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        List<dynamic> items = <dynamic>[];
        if (decoded is Map<String, dynamic>) {
          items =
              (decoded['todos'] ?? decoded['data'] ?? decoded['issues'])
                  as List<dynamic>? ??
              <dynamic>[];
        } else if (decoded is List<dynamic>) {
          items = decoded;
        }

        return items
            .map((e) => Todo.fromJson(e as Map<String, dynamic>))
            .toList();
      }
    } catch (_) {}
    return <Todo>[];
  }

  void addTodo(Todo todo) {
    allTodos.insert(0, todo);
    visibleTodos.insert(0, todo);
  }

  void updateTodo(int id, {String? todo, bool? completed}) {
    final idx = allTodos.indexWhere((t) => t.id == id);
    if (idx == -1) return;
    final updated = allTodos[idx].copyWith(todo: todo, completed: completed);
    allTodos[idx] = updated;

    final vIdx = visibleTodos.indexWhere((t) => t.id == id);
    if (vIdx != -1) visibleTodos[vIdx] = updated;
  }

  void removeTodo(int id) {
    allTodos.removeWhere((t) => t.id == id);
    removeVisibleTodo(id);
  }

  void removeVisibleTodo(int id) {
    visibleTodos.removeWhere((t) => t.id == id);
  }
}
