import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/colors.dart';

class SharedAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String currentPage;

  const SharedAppBar({super.key, required this.currentPage});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kBgCard,
      elevation: 0,
      centerTitle: false,
      leadingWidth: 88,
      leading: Row(
        children: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.menu_rounded, color: Colors.white),
            tooltip: 'Menu',
            color: kBgCard,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            onSelected: (value) {
              if (value == 'profile' && currentPage != 'profile') {
                Navigator.pushReplacementNamed(context, '/profile');
              } else if (value == 'issues' && currentPage != 'issues') {
                Navigator.pushReplacementNamed(context, '/issues');
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'profile',
                child: Row(
                  children: [
                    Icon(
                      Icons.person_outline,
                      color: currentPage == 'profile'
                          ? kPurple
                          : Colors.white70,
                      size: 20,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Profile',
                      style: TextStyle(
                        color: currentPage == 'profile'
                            ? kPurple
                            : Colors.white,
                        fontWeight: currentPage == 'profile'
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                    if (currentPage == 'profile') ...[
                      const Spacer(),
                      const Icon(Icons.check, color: kPurple, size: 16),
                    ],
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'issues',
                child: Row(
                  children: [
                    Icon(
                      Icons.task_alt_outlined,
                      color: currentPage == 'issues' ? kPurple : Colors.white70,
                      size: 20,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Issues',
                      style: TextStyle(
                        color: currentPage == 'issues' ? kPurple : Colors.white,
                        fontWeight: currentPage == 'issues'
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                    if (currentPage == 'issues') ...[
                      const Spacer(),
                      const Icon(Icons.check, color: kPurple, size: 16),
                    ],
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(2),
            child: SvgPicture.asset(
              'assets/icons/github.svg',
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
      title: const Text('Baro Vinh', style: TextStyle(color: Colors.white)),
      actions: [
        PopupMenuButton<String>(
          icon: const Icon(Icons.more_vert, color: Colors.white70),
          tooltip: 'More',
          color: kBgCard,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onSelected: (value) {},
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'search',
              child: Row(
                children: [
                  Icon(Icons.search_rounded, color: Colors.white70, size: 20),
                  SizedBox(width: 12),
                  Text('Search', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            const PopupMenuItem(
              value: 'new',
              child: Row(
                children: [
                  Icon(Icons.add_box_sharp, color: Colors.white70, size: 20),
                  SizedBox(width: 12),
                  Text('New', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            const PopupMenuItem(
              value: 'notification',
              child: Row(
                children: [
                  Icon(
                    Icons.mark_unread_chat_alt_rounded,
                    color: Colors.white70,
                    size: 20,
                  ),
                  SizedBox(width: 12),
                  Text('Notification', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            const PopupMenuDivider(),
            const PopupMenuItem(
              value: 'profile',
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 12,
                    backgroundImage: AssetImage(
                      'assets/icons/avt_barovinh.jpg',
                    ),
                  ),
                  SizedBox(width: 12),
                  Text('barovinh', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
