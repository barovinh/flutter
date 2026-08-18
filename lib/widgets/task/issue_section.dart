import 'package:flutter/material.dart';
import 'package:todo_training/model/issue.dart';
import 'package:todo_training/widgets/task/issue_item.dart';

class TaskSection extends StatefulWidget {
  const TaskSection({super.key});

  @override
  State<TaskSection> createState() => _TaskSectionState();
}

class _TaskSectionState extends State<TaskSection> {
  List<Issue> _allIssues = []; // toàn bộ data gốc
  List<Issue> _issues = []; // data đang hiển thị
  bool _isLoading = true; // loading lần đầu
  bool _isLoadingMore = false; // đang load thêm
  bool _hasMore = true; // còn data không

  static const int _pageSize = 10;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _loadInitial();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _loadInitial() async {
    final List<Issue> all = await Issue.loadFromAsset();

    setState(() {
      _allIssues = all;
      _issues = all.take(_pageSize).toList();
      _hasMore = all.length > _pageSize;
      _isLoading = false;
    });
  }

  Future<void> _loadMore() async {
    if (_isLoadingMore || !_hasMore) return;

    setState(() => _isLoadingMore = true);

    await Future.delayed(const Duration(milliseconds: 600));

    final int currentCount = _issues.length;
    final List<Issue> nextPage = _allIssues
        .skip(currentCount)
        .take(_pageSize)
        .toList();

    setState(() {
      _issues.addAll(nextPage);
      _hasMore = _issues.length < _allIssues.length;
      _isLoadingMore = false;
    });
  }

  void _onScroll() {
    final double maxScroll = _scrollController.position.maxScrollExtent;
    final double current = _scrollController.offset;

    if (current >= maxScroll - 150) {
      _loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_issues.isEmpty) {
      return const Center(
        child: Text(
          'Không có task nào',
          style: TextStyle(color: Colors.white54),
        ),
      );
    }

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final int crossAxisCount = constraints.maxWidth >= 600 ? 2 : 1;

        return GridView.builder(
          controller: _scrollController,
          padding: const EdgeInsets.symmetric(vertical: 8),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisExtent: 105,
          ),
          itemCount: _hasMore ? _issues.length + 1 : _issues.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == _issues.length) {
              return const Center(child: CircularProgressIndicator());
            }

            final Issue issue = _issues[index];
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
  }
}
