import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class AchievementsSection extends StatelessWidget {
  const AchievementsSection({super.key});

  static const List<String> _badges = [
    'https://github.githubassets.com/assets/yolo-default-be0bbff04951.png',
    'https://github.githubassets.com/assets/pull-shark-default-498c279a747d.png',
    'https://github.githubassets.com/assets/quickdraw-default-39c6aec8ff89.png',
    'https://github.githubassets.com/assets/pair-extraordinaire-default-579438a20e01.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 10, left: 16),
          child: Text(
            'Achievements',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            spacing: 6,
            children: _badges
                .map((url) => _AchievementBadge(imageUrl: url))
                .toList(),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}

class _AchievementBadge extends StatelessWidget {
  final String imageUrl;
  const _AchievementBadge({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: kPurple,
      child: CircleAvatar(radius: 30, backgroundImage: NetworkImage(imageUrl)),
    );
  }
}
