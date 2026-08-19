import 'package:flutter/material.dart';

class FollowRow extends StatelessWidget {
  const FollowRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.people, color: Colors.white70)),
        const Text('8 followers', style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w900)),
        const SizedBox(width: 10),
        const Text('10 following', style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w900)),
      ],
    );
  }
}
