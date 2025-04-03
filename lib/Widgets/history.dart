import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ios_calculator/Widgets/result.dart';
import 'package:ios_calculator/methods.dart';

class History extends StatelessWidget {
  const History({
    super.key,
    required this.history,
  });
  final String history;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      width: MediaQuery.of(context).size.width,
      child: AutoSizeText(
        formatNumber(history),
        maxLines: 1,
        style: TextStyle(fontSize: 25, color: Colors.grey),
        minFontSize: 20,
        overflowReplacement: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: ScrollText(
            text: history,
            fontSize: 20,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
