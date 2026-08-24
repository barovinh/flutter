import 'package:get/get.dart';
import 'package:todo_training/app_routes.dart';
import 'package:todo_training/features/profile/profile_binding.dart';
import 'package:todo_training/features/profile/profile_page.dart';
import 'package:todo_training/features/issue/issue_binding.dart';
import 'package:todo_training/features/issue/issue_page.dart';
import 'package:todo_training/features/issue/issue_detail_page.dart';
import 'package:todo_training/features/issue/issue_detail_binding.dart';

import 'package:todo_training/features/edit-profile/views/edit_profile_page.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.profile,
      page: () => ProfilePage(),
      binding: ProfileBinding(),
    ),

    GetPage(
      name: AppRoutes.issues,
      page: () => IssuePage(),
      binding: IssueBinding(),
    ),

    GetPage(
      name: AppRoutes.editProfile,
      page: () => EditProfilePage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.issueDetail,
      page: () => IssueDetailPage(),
      binding: IssueDetailBinding(),
    ),
  ];
}
