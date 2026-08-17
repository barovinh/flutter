import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import 'tab_item.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: kBgCard,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                TabItem(label: 'Overview', isActive: true, onTap: () {}),
                TabItem(label: 'Repositories', count: 18, onTap: () {}),
                TabItem(label: 'Projects', onTap: () {}),
                TabItem(label: 'Packages', onTap: () {}),
                TabItem(label: 'Stars', count: 18, onTap: () {}),
              ],
            ),
          ),
          // Avatar + tên
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 36,
                  backgroundImage: AssetImage('assets/icons/avt_barovinh.jpg'),
                ),
                const SizedBox(width: 14),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      'Phan Ngọc Bảo Vinh',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'barovinh',
                      style: TextStyle(color: Colors.white54, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Tabs
        ],
      ),
    );
  }
}
