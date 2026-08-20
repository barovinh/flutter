import 'package:get/get.dart';
import 'package:todo_training/app_routes.dart';
import 'package:todo_training/features/profile/profile_binding.dart';
import 'package:todo_training/features/profile/profile_controller.dart';
import 'package:todo_training/features/profile/profile_page.dart';
import 'package:todo_training/features/task/task_binding.dart';
import 'package:todo_training/features/task/task_page.dart';
import 'package:todo_training/features/edit-profile/views/edit_profile_page.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.profile,
      page: () => ProfilePage(),
      binding: ProfileBinding(),
    ),

    GetPage(
      name: AppRoutes.task,
      page: () => TaskPage(),
      binding: TaskBinding(),
    ),

    GetPage(
      name: AppRoutes.editProfile,
      page: () => EditProfilePage(),
      binding: ProfileBinding(),
    ),
  ];
}
