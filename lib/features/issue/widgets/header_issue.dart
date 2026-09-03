import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_training/features/issue/issue_controller.dart';

class HeaderIssue extends StatefulWidget {
  const HeaderIssue({super.key});

  @override
  State<HeaderIssue> createState() => _HeaderIssueState();
}

class _HeaderIssueState extends State<HeaderIssue> {
  String _selectedFilter1 = 'All';
  String _selectedFilter2 = 'Create by me';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchBarApp(),

          Row(
            children: [
              PopupMenuButton<String>(
                offset: const Offset(0, 40),
                onSelected: (value) {
                  setState(() {
                    _selectedFilter1 = value;
                  });
                  IssueController.to.statusFilter = value;
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(value: 'All', child: Text('All')),
                  const PopupMenuItem(value: 'Open', child: Text('Open')),
                  const PopupMenuItem(value: 'Closed', child: Text('Closed')),
                  const PopupMenuItem(
                    value: 'In Progress',
                    child: Text('In Progress'),
                  ),
                  const PopupMenuItem(
                    value: 'Resolved',
                    child: Text('Resolved'),
                  ),
                ],
                child: Row(
                  children: [
                    Text(
                      _selectedFilter1,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Icon(Icons.arrow_drop_down, color: Colors.white70),
                  ],
                ),
              ),

              PopupMenuButton<String>(
                onSelected: (value) {
                  setState(() {
                    _selectedFilter2 = value;
                  });
                  IssueController.to.ownerFilter = value;
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'Create by me',
                    child: Text('Create by me'),
                  ),
                  const PopupMenuItem(
                    value: 'Assigned to me',
                    child: Text('Assigned to me'),
                  ),
                  const PopupMenuItem(
                    value: 'Mentions me',
                    child: Text('Mentions me'),
                  ),
                  const PopupMenuItem(
                    value: 'Involved',
                    child: Text('Involved'),
                  ),
                ],
                child: Row(
                  children: [
                    Text(
                      _selectedFilter2,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Icon(Icons.arrow_drop_down, color: Colors.white70),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SearchBarApp extends StatefulWidget {
  const SearchBarApp({super.key});

  @override
  State<SearchBarApp> createState() => _SearchBarAppState();
}

class _SearchBarAppState extends State<SearchBarApp> {
  bool isDark = false;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 40,
      child: SearchBar(
        controller: _controller,

        padding: const WidgetStatePropertyAll<EdgeInsets>(
          EdgeInsets.symmetric(horizontal: 16),
        ),
        leading: const Icon(Icons.search),
        hintText: 'Search...',
        onChanged: (value) {
          if (!Get.isRegistered<IssueController>()) {
            Get.put(IssueController());
          }
          IssueController.to.query = value;
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
