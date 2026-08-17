import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_training/constants/state.dart';
import 'package:todo_training/constants/colors.dart';

class IssueItem extends StatelessWidget {
  final int id;
  final States state;
  final String title;
  final String userName;

  const IssueItem({
    super.key,
    required this.id,
    required this.state,
    required this.title,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: kBgCard,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          handleState(state),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '@$userName',
                  style: const TextStyle(fontSize: 12, color: Colors.white54),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '#$id',
            style: const TextStyle(fontSize: 12, color: Colors.white38),
          ),
        ],
      ),
    );
  }

  Widget handleState(States state) {
    switch (state) {
      case States.open:
        return buildStateSvg('assets/icons/state_open.svg', kCyan);
      case States.inProgress:
        return buildStateSvg('assets/icons/state_in_progress.svg', kPurple);
      case States.resolved:
        return buildStateSvg(
          'assets/icons/state_resolved.svg',
          Colors.greenAccent,
        );
      case States.closed:
        return buildStateSvg('assets/icons/state_closed.svg', kPink);
      default:
        return buildStateSvg('assets/icons/state_open.svg', Colors.white38);
    }
  }

  Widget buildStateSvg(String assetPath, Color color) {
    return SvgPicture.asset(
      assetPath,
      width: 24,
      height: 24,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
  }
}
