import 'package:get/get.dart';
import 'package:todo_training/features/profile/profile_binding.dart';
import 'package:todo_training/features/profile/profile_page.dart';
// import 'package:todo_training/widgets/profile/profile_page.dart';
// import 'package:todo_training/features/profile_binding.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: '/profile',
      page: () => ProfilePage(),
      binding: ProfileBinding(),
    ),
  ];
}
