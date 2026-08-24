import 'package:get/get.dart';
import 'package:todo_training/features/issue/issue_detail_controller.dart';

class IssueDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IssueDetailController>(() => IssueDetailController());
  }
}
