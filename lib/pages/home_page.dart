import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/shared_app_bar.dart';
import '../widgets/profile/profile_header.dart';
import '../widgets/profile/status_card.dart';
import '../widgets/profile/bio_section.dart';
import '../widgets/profile/edit_profile_button.dart';
import '../widgets/profile/follow_row.dart';
import '../widgets/profile/achievements_section.dart';
import '../widgets/profile/stats_section.dart';
import '../widgets/profile/pinned_section.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgDark,
      appBar: const SharedAppBar(currentPage: 'profile'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            ProfileHeader(),
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
      ),
    );
  }
}
