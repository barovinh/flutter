import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_training/app_routes.dart';
import 'package:todo_training/model/user.dart';

class ProfileController extends GetxController {
  final isLoading = false.obs;
  final userInfo = Rxn<User>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final avatarController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    loadProfile();
  }

  Future<void> loadProfile() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));
    final user = User();
    await user.initData();
    userInfo.value = user;
    isLoading.value = false;

    nameController.text = user.username;
    emailController.text = user.email;
    avatarController.text = user.avatar;
  }

  Future<void> updateProfile() async {
    // update profile
  }

  Future<void> updateUser(User user) async {
    userInfo.value = user;
  }

  void submitData() {
    userInfo.update((val) {
      val?.username = nameController.text;
      val?.email = emailController.text;
      val?.avatar = avatarController.text;
    });

    Get.snackbar(
      "Success",
      "User updated infro: ${userInfo.value?.username}",
      snackPosition: SnackPosition.BOTTOM,
    );

    Get.toNamed(AppRoutes.profile);
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    avatarController.dispose();
    super.onClose();
  }
}
