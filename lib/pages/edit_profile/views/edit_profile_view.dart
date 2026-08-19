import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todo_training/constants/colors.dart';
import 'package:todo_training/widgets/shared_app_bar.dart';

import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgDark,
      appBar: const SharedAppBar(currentPage: 'task'),
      body: const Center(
        child: Text(
          'EditProfileView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
