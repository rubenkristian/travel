import 'package:flutter/material.dart';

class ChipDetail extends StatelessWidget {
  final String label;
  final Color color;

  const ChipDetail({super.key, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20),
      color: color,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.close, size: 14, color: Colors.white),
            SizedBox(width: 5),
            Text(label, style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
