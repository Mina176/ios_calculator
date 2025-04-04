import 'package:flutter/material.dart';
import 'package:ios_calculator/Widgets/history_and_result_landscape.dart';

class DisplayScreenLandscape extends StatelessWidget {
  const DisplayScreenLandscape({
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
        child: HistoryAndResultLandscape(
          history: history,
          equation: equation,
          historyOnTap: historyOnTap,
        ),
      ),
    );
  }
}
