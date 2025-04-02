import 'package:flutter/material.dart';
import 'package:ios_calculator/styles.dart';

class Result extends StatelessWidget {
  const Result({
    super.key,
    required this.equation,
  });
  final String equation;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        reverse: true,
        child: FittedBox(
          child: Text(
            equation,
            style: kResultStyle56,
            maxLines: 1,
          ),
        ),
      ),
    );
  }
}
