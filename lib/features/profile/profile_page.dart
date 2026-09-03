import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_training/constants/colors.dart';
import 'package:todo_training/widgets/shared_app_bar.dart';
import 'package:todo_training/features/profile/widgets/achievements_section.dart';
import 'package:todo_training/features/profile/widgets/bio_section.dart';
import 'package:todo_training/features/profile/widgets/edit_profile_button.dart';
import 'package:todo_training/features/profile/widgets/follow_row.dart';
import 'package:todo_training/features/profile/widgets/pinned_section.dart';
import 'package:todo_training/features/profile/widgets/profile_header.dart';
import 'package:todo_training/features/profile/widgets/stats_section.dart';
import 'package:todo_training/features/profile/widgets/status_card.dart';

import 'profile_controller.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final controller = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<ProfileController>()) {
      Get.put(ProfileController());
    }
    return Scaffold(
      backgroundColor: kBgDark,
      appBar: const SharedAppBar(currentPage: 'profile'),
      body: Obx(() {
        final user = controller.userInfo.value;
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileHeader(user: user),
              StatusCard(),
              BioSection(),
              EditProfileButton(),
              FollowRow(),
              Divider(
                color: Colors.grey,
                thickness: 1,
                height: 24,
                indent: 16,
                endIndent: 16,
              ),
              AchievementsSection(),
              StatsSection(),
              PinnedSection(),
            ],
          ),
        );
      }),
    );
  }
}
