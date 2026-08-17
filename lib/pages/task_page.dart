import 'package:flutter/material.dart';
import 'package:todo_training/widgets/task/header_task.dart';
import 'package:todo_training/widgets/task/issue_section.dart';
import '../constants/colors.dart';
import '../widgets/shared_app_bar.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgDark,
      appBar: const SharedAppBar(currentPage: 'task'),
      body: const Column(
        children: [
          HeaderTask(),

          Divider(height: 1, thickness: 1, color: Colors.white12),

          Expanded(child: TaskSection()),
        ],
      ),
    );
  }
}
