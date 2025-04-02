import 'package:flutter/material.dart';
import 'package:ios_calculator/Widgets/history.dart';
import 'package:ios_calculator/Widgets/result.dart';

class DisplayScreen extends StatelessWidget {
  const DisplayScreen({
    super.key,
    required this.history,
    required this.equation,
  });

  final String history;
  final String equation;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            History(history: history),
            Result(equation: equation),
          ],
        ),
      ),
    );
  }
}
