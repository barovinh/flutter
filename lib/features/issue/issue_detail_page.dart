import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_training/constants/colors.dart';
import 'package:todo_training/features/issue/issue_detail_controller.dart';
import 'package:todo_training/widgets/confirm_dialog.dart';

class IssueDetailPage extends GetView<IssueDetailController> {
  const IssueDetailPage({super.key});
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) return;
        final bool leave = await showConfirmDialog(
          context,
          title: 'Rời trang?',
          message: 'Bạn có chắc muốn rời trang chi tiết?',
          confirmLabel: 'Rời trang',
          confirmColor: Colors.orange,
        );
        if (leave) Get.back();
      },
      child: Obx(() {
        final issue = controller.issue.value;
        return Scaffold(
          backgroundColor: kBgDark,
          appBar: AppBar(
            backgroundColor: kBgCard,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),

              onPressed: () => Navigator.maybePop(context),
            ),
            title: Text(
              '#${issue.number}',
              style: const TextStyle(color: Colors.white),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  issue.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'by @${issue.userName}',
                  style: const TextStyle(color: Colors.white54, fontSize: 13),
                ),
                const SizedBox(height: 16),
                // Body
                if (issue.body != null && issue.body!.isNotEmpty)
                  Text(
                    issue.body!,
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                const Spacer(),
                if (issue.state.value == 'open' ||
                    issue.state.value == 'in_progress')
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.greenAccent.shade700,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () async {
                        final bool confirm = await showConfirmDialog(
                          context,
                          title: 'Xác nhận hoàn thành',
                          message:
                              'Đánh dấu issue #${issue.number} là Resolved?',
                          confirmLabel: 'Hoàn thành',
                          confirmColor: Colors.greenAccent.shade700,
                        );
                        if (confirm) {
                          controller.markAsResolved();
                          Get.back();
                        }
                      },
                      child: const Text(
                        'Mark as Resolved',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
