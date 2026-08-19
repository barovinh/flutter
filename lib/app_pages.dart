import 'package:get/get.dart';
import 'package:todo_training/app_routes.dart';
import 'package:todo_training/features/profile/profile_binding.dart';
import 'package:todo_training/features/profile/profile_page.dart';
import 'package:todo_training/features/task/task_binding.dart';
import 'package:todo_training/features/task/task_page.dart';
import 'package:todo_training/pages/edit_profile/bindings/edit_profile_binding.dart';
import 'package:todo_training/pages/edit_profile/views/edit_profile_view.dart';

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
      page: () => EditProfileView(),
      binding: EditProfileBinding(),
    ),
  ];
}
