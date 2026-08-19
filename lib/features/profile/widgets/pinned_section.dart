import 'package:flutter/material.dart';
import 'package:todo_training/constants/colors.dart';

class PinnedSection extends StatelessWidget {
  const PinnedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.push_pin, color: Colors.white70),
            title: const Text(
              'Pinned',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: const Text(
              'Customize your pins',
              style: TextStyle(color: Colors.blue),
            ),
          ),
          PinnedCard(
            repoName: 'A211-open-source-group-1/light-studio',
            description:
                'Open Source Programming Final Project - Group 6 - 12DHTH03',
            language: 'JavaScript',
            languageColor: Colors.yellow,
            stars: '3',
            forks: '2',
          ),
          PinnedCard(
            repoName:
                'caro-game-but-pay-to-win-java/caro-game-but-pay-to-win-java',
            description: 'Java Programming Final Project - Group 17 - 12DHTH18',
            language: 'Java',
            languageColor: Colors.orange,
            stars: '6',
            forks: '2',
          ),
          PinnedCard(
            repoName: 'the-woodpeckers-org/code-playground',
            description:
                'A web-based platform for real-time code writing, execution. Support C/C++, Python, Php, JavaScript(Node), ect...',
            language: 'JavaScript',
            languageColor: Colors.yellow,
            stars: '6',
            forks: '2',
          ),
        ],
      ),
    );
  }
}

class PinnedCard extends StatelessWidget {
  final String repoName;
  final String description;
  final String language;
  final Color languageColor;
  final String stars;
  final String forks;

  const PinnedCard({
    super.key,
    required this.repoName,
    required this.description,
    required this.language,
    required this.languageColor,
    required this.stars,
    required this.forks,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kBgCard,
      child: Column(
        children: [
          ListTile(
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.public, size: 18),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    repoName,
                    softWrap: true,
                    style: const TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
            subtitle: Wrap(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.yellow),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Public archive',
                    style: TextStyle(color: Colors.yellow, fontSize: 12),
                  ),
                ),
              ],
            ),
            trailing: const Icon(Icons.drag_indicator),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(description),
                const SizedBox(height: 4),
                Row(
                  spacing: 3,
                  children: [
                    Icon(Icons.circle, color: languageColor, size: 13),
                    const SizedBox(width: 2),
                    Text(
                      language,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.star_border, size: 13),
                    Text(stars),
                    const SizedBox(width: 9),
                    const Icon(Icons.call_split, size: 13),
                    Text(forks),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
