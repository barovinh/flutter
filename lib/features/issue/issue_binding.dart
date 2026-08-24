import 'package:get/get.dart';
import 'package:todo_training/features/issue/issue_controller.dart';

class IssueBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IssueController>(() => IssueController());
  }
}
