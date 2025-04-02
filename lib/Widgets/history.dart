import 'package:flutter/material.dart';
import 'package:ios_calculator/Widgets/result.dart';
import 'package:ios_calculator/styles.dart';

class History extends StatelessWidget {
  const History({
    super.key,
    required this.history,
  });

  final String history;

  @override
  Widget build(BuildContext context) {
    if (history.length < 9) {
      return CustomText(
        text: history,
        textStyle: kHistoryStyle30,
      );
    }
    if (history.length < 12) {
      return CustomText(
        text: history,
        textStyle: kHistoryStyle25,
      );
    }

    return CustomText(
      text: history,
      textStyle: kHistoryStyle20,
    );
  }
}
