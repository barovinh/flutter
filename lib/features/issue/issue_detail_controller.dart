import 'package:get/get.dart';
import 'package:todo_training/constants/state.dart';
import 'package:todo_training/features/issue/issue_controller.dart';
import 'package:todo_training/model/issue.dart';

class IssueDetailController extends GetxController {
  static IssueDetailController get to => Get.find();
  final IssueController _issueController = IssueController.to;
  late final Rx<Issue> issue;
  @override
  void onInit() {
    super.onInit();

    final id = Get.arguments as int;

    final Issue found = _issueController.allIssues.firstWhere(
      (e) => e.id == id,
    );
    issue = found.obs;
  }

  void markAsResolved() {
    _issueController.updateIssueState(issue.value.id, States.resolved);
    issue.value = issue.value.copyWith(state: States.resolved);
  }
}
