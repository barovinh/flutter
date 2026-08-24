import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_training/model/issue.dart';
import 'package:todo_training/features/issue/widgets/issue_item.dart';
import 'package:todo_training/features/issue/issue_controller.dart';

class IssueSection extends StatefulWidget {
  const IssueSection({super.key});

  @override
  State<IssueSection> createState() => _IssueSectionState();
}

class _IssueSectionState extends State<IssueSection> {
  final ScrollController _scrollController = ScrollController();
  IssueController get _ctrl => IssueController.to;

  @override
  void initState() {
    super.initState();
    if (!Get.isRegistered<IssueController>()) {
      Get.put(IssueController());
    }
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final double maxScroll = _scrollController.position.maxScrollExtent;
    final double current = _scrollController.offset;

    if (current >= maxScroll - 150) {
      _ctrl.loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_ctrl.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      final List<Issue> issues = _ctrl.visibleIssues;

      if (issues.isEmpty) {
        return const Center(
          child: Text(
            'Không có issue nào',
            style: TextStyle(color: Colors.white54),
          ),
        );
      }

      return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final int crossAxisCount = constraints.maxWidth >= 600 ? 2 : 1;

          final bool canLoadMore =
              _ctrl.query.isEmpty &&
              _ctrl.visibleIssues.length < _ctrl.allIssues.length;

          return GridView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(vertical: 8),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              mainAxisExtent: 105,
            ),
            itemCount: canLoadMore ? issues.length + 1 : issues.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == issues.length) {
                return const Center(child: CircularProgressIndicator());
              }

              final Issue issue = issues[index];
              return IssueItem(
                id: issue.id,
                state: issue.state,
                title: issue.title,
                userName: issue.userName,
              );
            },
          );
        },
      );
    });
  }
}
