import 'package:flutter/material.dart';
import 'package:ios_calculator/styles.dart';

class Histroy extends StatelessWidget {
  const Histroy({
    super.key,
    required this.history,
  });

  final String history;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        reverse: true,
        child: Text(
          history,
          style: kHistoryStyle,
        ),
      ),
    );
  }
}