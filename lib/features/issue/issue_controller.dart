import 'dart:convert';

import 'package:get/get.dart';
import 'package:todo_training/constants/state.dart';
import 'package:todo_training/model/issue.dart';
import 'package:http/http.dart' as http;

class IssueController extends GetxController {
  static IssueController get to => Get.find();

  final RxList<Issue> allIssues = <Issue>[].obs;
  final RxList<Issue> visibleIssues = <Issue>[].obs;
  final RxBool isLoading = true.obs;

  final RxString _query = ''.obs;
  String get query => _query.value;
  set query(String q) => _query.value = q;

  final RxString _statusFilter = 'All'.obs;
  String get statusFilter => _statusFilter.value;
  set statusFilter(String value) {
    _statusFilter.value = value;
    _applyFilter();
  }

  final RxString _ownerFilter = 'Create by me'.obs;
  String get ownerFilter => _ownerFilter.value;
  set ownerFilter(String value) {
    _ownerFilter.value = value;
    _applyFilter();
  }

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
    final List<Issue> list = await fetchIssues();
    allIssues.assignAll(list);
    visibleIssues.assignAll(allIssues.take(pageSize));
    isLoading.value = false;
  }

  void _applyFilter() {
    Iterable<Issue> result = allIssues;

    // Search
    final q = query.trim().toLowerCase();
    if (q.isNotEmpty) {
      result = result.where((e) => e.title.toLowerCase().contains(q));
    }

    // Status
    switch (statusFilter) {
      case 'Open':
        result = result.where((e) => e.state == States.open);
        break;

      case 'Closed':
        result = result.where((e) => e.state == States.closed);
        break;

      case 'In Progress':
        result = result.where((e) => e.state == States.inProgress);
        break;

      case 'Resolved':
        result = result.where((e) => e.state == States.resolved);
        break;
    }

    // Filter Create by me...
    switch (ownerFilter) {
      case 'Assigned to me':
        result = result.where((e) => e.assignees.contains('barovinh'));
        break;

      case 'Create by me':
        result = result.where((e) => e.userName.contains('barovinh'));
        break;
    }

    visibleIssues.assignAll(result.toList());
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

  Future<List<Issue>> fetchIssues() async {
    final response = await http.get(
      Uri.parse('https://dummyjson.com/c/07a8-7e1f-41ad-87cf'),
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final issues = json['issues'] as List<dynamic>;

      return issues
          .map((issues) => Issue.fromJson(issues as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to load issue');
    }
  }

  bool isFilter() {
    final bool qEmpty = query.trim().isEmpty;
    final bool statusDefault = statusFilter == 'All';
    final bool ownerDefault = ownerFilter == 'Create by me';
    return qEmpty && statusDefault && ownerDefault;
  }
}
