import 'package:get/get.dart';
import 'package:todo_training/model/issue.dart';

class TaskController extends GetxController {
  final isLoading = false.obs;
  final listIssue = Rxn<List<Issue>>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    loadProfile();
  }

  Future<void> loadProfile() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));
    final list = await Issue.loadFromAsset();

    listIssue.value = list;
    isLoading.value = false;
  }
}
