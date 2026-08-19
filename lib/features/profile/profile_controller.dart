import 'package:get/get.dart';
import 'package:todo_training/model/user.dart';

class ProfileController extends GetxController {
  final isLoading = false.obs;
  final userInfo = Rxn<User>();

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
  }

  Future<void> updateProfile() async {
    // update profile
  }
}
