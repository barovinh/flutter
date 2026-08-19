import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:todo_training/constants/colors.dart';
import 'package:todo_training/features/task/task_controller.dart';
import 'package:todo_training/widgets/shared_app_bar.dart';
import 'package:todo_training/widgets/task/header_task.dart';
import 'package:todo_training/widgets/task/issue_section.dart';

class TaskPage extends GetView<TaskController> {
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
