import 'package:flutter/material.dart';
import 'package:todo_training/constants/colors.dart';
import 'package:todo_training/widgets/shared_app_bar.dart';
import 'package:todo_training/features/issue/widgets/header_issue.dart';
import 'package:todo_training/features/issue/widgets/issue_section.dart';

class IssuePage extends StatelessWidget {
  const IssuePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgDark,
      appBar: const SharedAppBar(currentPage: 'issues'),
      body: const Column(
        children: [
          HeaderIssue(),

          Divider(height: 1, thickness: 1, color: Colors.white12),

          Expanded(child: IssueSection()),
        ],
      ),
    );
  }
}
