import 'package:flutter/material.dart';
import 'package:ios_calculator/methods.dart';

class ScrollText extends StatelessWidget {
  const ScrollText({
    super.key,
    required this.text,
    required this.fontSize,
    this.color = Colors.white,
  });

  final String text;
  final double fontSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      reverse: true,
      child: Text(
        formatNumber(text),
        maxLines: 1,
        style: TextStyle(fontSize: fontSize, color: color),
      ),
    );
  }
}
