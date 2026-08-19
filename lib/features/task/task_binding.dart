import 'package:get/get.dart';
import 'package:todo_training/features/task/task_controller.dart';

class TaskBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<TaskController>(() => TaskController());
  }
}
