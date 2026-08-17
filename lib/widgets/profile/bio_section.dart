import 'package:flutter/material.dart';

class BioSection extends StatelessWidget {
  const BioSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(16, 20, 16, 20),
      child: Text(
        'Sinh viên IT - Công Thương TP.HCM aka HUIT',
        style: TextStyle(fontSize: 22),
      ),
    );
  }
}
