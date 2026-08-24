import 'package:get/get.dart';
import 'package:todo_training/constants/state.dart';
import 'package:todo_training/model/issue.dart';

class IssueController extends GetxController {
  static IssueController get to => Get.find();

  final RxList<Issue> allIssues = <Issue>[].obs;
  final RxList<Issue> visibleIssues = <Issue>[].obs;
  final RxBool isLoading = true.obs;

  final RxString _query = ''.obs;
  String get query => _query.value;
  set query(String q) => _query.value = q;

  static const int pageSize = 10;

  @override
  void onInit() {
    super.onInit();
    _loadInitial();
    debounce(
      _query,
      (_) => _applyFilter(),
      time: const Duration(milliseconds: 300),
    );
  }

  Future<void> _loadInitial() async {
    isLoading.value = true;
    final List<Issue> list = await Issue.loadFromAsset();
    allIssues.assignAll(list);
    visibleIssues.assignAll(allIssues.take(pageSize));
    isLoading.value = false;
  }

  void _applyFilter() {
    final String q = _query.value.trim().toLowerCase();
    if (q.isEmpty) {
      visibleIssues.assignAll(allIssues.take(pageSize));
      return;
    }

    final filtered = allIssues
        .where((i) => i.title.toLowerCase().contains(q))
        .toList();
    visibleIssues.assignAll(filtered);
  }

  void loadMore() {
    if (query.isNotEmpty) return;
    final int current = visibleIssues.length;
    if (current >= allIssues.length) return;
    final next = allIssues.skip(current).take(pageSize).toList();
    visibleIssues.addAll(next);
  }

  void updateIssueState(int id, States newState) {
    final int idx = allIssues.indexWhere((e) => e.id == id);
    if (idx == -1) return;
    final updated = allIssues[idx].copyWith(
      state: newState,
      closedAt: newState == States.resolved ? DateTime.now() : null,
    );
    allIssues[idx] = updated;
    final int vIdx = visibleIssues.indexWhere((e) => e.id == id);
    if (vIdx != -1) visibleIssues[vIdx] = updated;
  }
}
