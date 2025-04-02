import 'package:flutter/material.dart';
import 'package:ios_calculator/Widgets/display_screen.dart';
import 'package:ios_calculator/Widgets/keyboard.dart';

class Calculator extends StatelessWidget {
  const Calculator({
    super.key,
    required this.history,
    required this.equation,
  });
  final String history;
  final String equation;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(children: [
        DisplayScreen(
          history: history,
          equation: equation,
        ),
        Keyboard(),
      ]),
    );
  }
}
