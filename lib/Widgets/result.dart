import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ios_calculator/methods.dart';

class Result extends StatelessWidget {
  const Result({super.key, required this.equation, required this.history});

  final String equation;
  final String history;
  @override
  Widget build(BuildContext context) {
    if (history != '') {
      return Container(
        alignment: Alignment.centerRight,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: AutoSizeText(formatNumber(equation),
              maxLines: 1,
              style: TextStyle(fontSize: 60),
              minFontSize: 20,
              overflowReplacement: ScrollText(
                text: equation,
                fontSize: 20,
              )),
        ),
      );
    } else {
      return Container(
        alignment: Alignment.centerRight,
        width: MediaQuery.of(context).size.width,
        child: AutoSizeText(
          formatNumber(equation),
          maxLines: 1,
          style: TextStyle(fontSize: 60),
          minFontSize: 50,
          overflowReplacement: ScrollText(
            text: equation,
            fontSize: 50,
          ),
        ),
      );
    }
  }
}

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
