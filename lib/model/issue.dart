import 'dart:convert';
import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:todo_training/constants/state.dart';

// ─────────────────────────────────────────────────────────────
class Issue {
  final int id;
  final int number;
  final String title;
  final String? body;
  final States state;
  final String userAvatar;
  final String userName;
  final List<Label> labels;
  final int commentsCount;
  final DateTime createdAt;
  final DateTime? closedAt;
  final List<String> assignees;
  final String? milestone;

  const Issue({
    required this.id,
    required this.number,
    required this.title,
    this.body,
    required this.state,
    required this.userAvatar,
    required this.userName,
    required this.labels,
    required this.commentsCount,
    required this.createdAt,
    this.closedAt,
    this.assignees = const [],
    this.milestone,
  });

  factory Issue.fromJson(Map<String, dynamic> json) {
    return Issue(
      id: json['id'] as int,
      number: json['number'] as int,
      title: json['title'] as String,
      body: json['body'] as String?,

      state: States.values.firstWhere(
        (e) => e.value == json['state'],
        orElse: () => States.open,
      ),

      userAvatar: json['userAvatar'] as String,
      userName: json['userName'] as String,
      labels: (json['labels'] as List)
          .map((l) => Label.fromJson(l as Map<String, dynamic>))
          .toList(),
      commentsCount: json['commentsCount'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
      closedAt: json['closedAt'] != null
          ? DateTime.parse(json['closedAt'] as String)
          : null,
      assignees: List<String>.from(json['assignees'] ?? []),
      milestone: json['milestone'] as String?,
    );
  }

  static Future<List<Issue>> loadFromAsset() async {
    final String raw = await rootBundle.loadString('assets/seeder.json');

    final Map<String, dynamic> data = jsonDecode(raw);

    final List<dynamic> list = data['issues'] as List;
    return list
        .map((item) => Issue.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}

class Label {
  final String name;
  final String colorHex;

  const Label({required this.name, required this.colorHex});

  factory Label.fromJson(Map<String, dynamic> json) {
    return Label(
      name: json['name'] as String,
      colorHex: json['color'] as String,
    );
  }
}
