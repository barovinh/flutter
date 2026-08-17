import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constants/colors.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 71, 53, 72),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [BoxShadow(blurRadius: 8, color: Colors.black12)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Phan Ngọc Bảo Vinh',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            _StatRow(
              icon: SvgPicture.asset(
                'assets/icons/github.svg',
                width: 14,
                height: 14,
                colorFilter: const ColorFilter.mode(
                  Colors.yellow,
                  BlendMode.srcIn,
                ),
              ),
              label: '854 Contributions on Github',
            ),
            _StatRow(
              icon: const Icon(Icons.public, color: Colors.yellow, size: 14),
              label: '10 Public Repos',
            ),
            _StatRow(
              icon: const Icon(
                Icons.timer_sharp,
                color: Colors.yellow,
                size: 14,
              ),
              label: 'Joined Github 3 years ago',
            ),
          ],
        ),
      ),
    );
  }
}

class _StatRow extends StatelessWidget {
  final Widget icon;
  final String label;
  const _StatRow({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(
            color: kCyan,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
