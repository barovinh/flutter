import 'package:flutter/material.dart';

class HeaderTask extends StatefulWidget {
  const HeaderTask({super.key});

  @override
  State<HeaderTask> createState() => _HeaderTaskState();
}

class _HeaderTaskState extends State<HeaderTask> {
  String _selectedFilter1 = 'All';
  String _selectedFilter2 = 'Create by me';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          PopupMenuButton<String>(
            offset: const Offset(0, 40),
            onSelected: (value) {
              setState(() {
                _selectedFilter1 = value;
              });
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'All', child: Text('All')),
              const PopupMenuItem(value: 'Open', child: Text('Open')),
              const PopupMenuItem(value: 'Closed', child: Text('Closed')),
            ],
            child: Row(
              children: [
                Text(
                  _selectedFilter1,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Icon(Icons.arrow_drop_down, color: Colors.white70),
              ],
            ),
          ),

          PopupMenuButton<String>(
            onSelected: (value) {
              setState(() {
                _selectedFilter2 = value;
              });
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'Create by me',
                child: Text('Create by me'),
              ),
              const PopupMenuItem(
                value: 'Assigned to me',
                child: Text('Assigned to me'),
              ),
              const PopupMenuItem(
                value: 'Mentions me',
                child: Text('Mentions me'),
              ),
              const PopupMenuItem(value: 'Involved', child: Text('Involved')),
            ],
            child: Row(
              children: [
                Text(
                  _selectedFilter2,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Icon(Icons.arrow_drop_down, color: Colors.white70),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
