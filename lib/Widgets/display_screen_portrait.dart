import 'package:flutter/material.dart';
import 'package:ios_calculator/Widgets/history_and_result_portrait.dart';

class DisplayScreenPortrait extends StatelessWidget {
  const DisplayScreenPortrait({
    super.key,
    required this.history,
    required this.equation,
    required this.historyOnTap,
  });

  final String history;
  final String equation;
  final VoidCallback historyOnTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: HistoryAndResultPortrait(
          history: history,
          equation: equation,
          historyOnTap: historyOnTap,
        ),
      ),
    );
  }
}
